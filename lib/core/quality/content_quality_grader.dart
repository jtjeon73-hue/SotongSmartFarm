import '../../models/smart_farm_content.dart';

/// Deterministic content quality grading (not by character count alone).
class ContentQualityGrade {
  const ContentQualityGrade({
    required this.id,
    required this.grade,
    required this.score,
    required this.matchedCriteria,
    required this.missingCriteria,
  });

  final String id;
  final String grade; // A|B|C|D
  final int score;
  final List<String> matchedCriteria;
  final List<String> missingCriteria;
}

class ContentQualityGrader {
  static const criteria = <String, List<String>>{
    'easyConcept': ['쉬운', '한 줄', '입문', '개념', '요약'],
    'principle': ['원리', '이론', '구조', '스캔', '계층', '모델'],
    'components': ['구성', '요소', '부품', '모듈', '장치'],
    'dataFlow': ['데이터 흐름', '흐름', '파이프라인', '수집', '저장'],
    'installWiring': ['설치', '배선', '케이블', '결선', '위치'],
    'configuration': ['설정', '주소', '스케일', '파라미터', '모드'],
    'calculation': ['공식', '계산', '스케일링', '알고리즘', '지표', 'CRC'],
    'controlProcedure': ['시퀀스', '절차', '상태', '시작조건', '정지조건'],
    'normalState': ['정상', '정상상태', '통과'],
    'faultCases': ['고장', '오류', '장애', '이상', '실패'],
    'diagnosis': ['진단', '점검', '원인', '순서'],
    'safety': ['안전', '비상', '인터록', '위험', '감전'],
    'operations': ['유지관리', '운영', '점검', '교정', '백업'],
    'limits': ['한계', '제한', '주의', '현장 적용', '매뉴얼'],
  };

  static ContentQualityGrade grade(SmartFarmContent content) {
    final text = content.searchableText.toLowerCase();
    final matched = <String>[];
    final missing = <String>[];

    for (final entry in criteria.entries) {
      final hit = entry.value.any((k) => text.contains(k.toLowerCase()));
      if (hit) {
        matched.add(entry.key);
      } else {
        missing.add(entry.key);
      }
    }

    // Section kind / title evidence (not character count).
    void ensure(String key) {
      if (!matched.contains(key)) {
        matched.add(key);
        missing.remove(key);
      }
    }

    for (final s in content.sections) {
      final st = '${s.title} ${s.body}'.toLowerCase();
      switch (s.kind) {
        case SectionKind.safety:
        case SectionKind.danger:
          ensure('safety');
        case SectionKind.fieldValidation:
        case SectionKind.fieldCheck:
          ensure('diagnosis');
          ensure('limits');
        case SectionKind.practical:
          ensure('controlProcedure');
          ensure('operations');
        case SectionKind.flow:
          ensure('dataFlow');
        case SectionKind.manufacturer:
          ensure('limits');
          ensure('configuration');
        case SectionKind.important:
          ensure('easyConcept');
        case SectionKind.expertNote:
          ensure('principle');
        case SectionKind.caution:
          ensure('limits');
        case SectionKind.normal:
          break;
      }
      if (st.contains('시험') || st.contains('사전조건') || st.contains('통과')) {
        ensure('normalState');
        ensure('controlProcedure');
      }
      if (st.contains('고장') || st.contains('장애') || st.contains('오류')) {
        ensure('faultCases');
      }
      if (st.contains('설치') || st.contains('배선')) {
        ensure('installWiring');
      }
      if (st.contains('공식') || st.contains('계산') || st.contains('지표')) {
        ensure('calculation');
      }
      if (st.contains('구성') || st.contains('계층') || st.contains('요소')) {
        ensure('components');
        ensure('principle');
      }
    }

    // Structural bonuses (not length).
    var bonus = 0;
    if (content.sections.length >= 8) bonus += 1;
    if (content.sections.any(
      (s) => s.copyText != null && s.copyText!.isNotEmpty,
    )) {
      bonus += 1;
    }
    if (content.sourceIds.isNotEmpty) bonus += 1;
    if (content.relatedIds.length >= 2) bonus += 1;
    if (content.sections.any(
      (s) =>
          s.kind == SectionKind.safety ||
          s.kind == SectionKind.danger ||
          s.kind == SectionKind.fieldValidation ||
          s.kind == SectionKind.manufacturer,
    )) {
      bonus += 1;
    }
    if (content.difficulty == Difficulty.practical ||
        content.difficulty == Difficulty.expert) {
      bonus += 1;
    }

    final score = matched.length + bonus;
    // Thresholds require breadth of criteria, not only bonus.
    final String grade;
    if (matched.length >= 11 && score >= 14) {
      grade = 'A';
    } else if (matched.length >= 8 && score >= 10) {
      grade = 'B';
    } else if (matched.length >= 5) {
      grade = 'C';
    } else {
      grade = 'D';
    }

    return ContentQualityGrade(
      id: content.id,
      grade: grade,
      score: score,
      matchedCriteria: matched,
      missingCriteria: missing,
    );
  }

  static Map<String, int> summarize(Iterable<SmartFarmContent> contents) {
    final counts = {'A': 0, 'B': 0, 'C': 0, 'D': 0};
    for (final c in contents) {
      final g = grade(c).grade;
      counts[g] = (counts[g] ?? 0) + 1;
    }
    return counts;
  }
}
