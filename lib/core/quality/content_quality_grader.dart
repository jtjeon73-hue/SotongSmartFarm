import '../../models/smart_farm_content.dart';

/// Content-type-aware quality grading.
/// Does not award A by character count alone.
/// Does not require FMEA/runbook depth on glossary pages.
class ContentQualityGrade {
  const ContentQualityGrade({
    required this.id,
    required this.grade,
    required this.score,
    required this.matchedCriteria,
    required this.missingCriteria,
    required this.requiredCriteria,
    required this.contentType,
  });

  final String id;
  final String grade;
  final int score;
  final List<String> matchedCriteria;
  final List<String> missingCriteria;
  final List<String> requiredCriteria;
  final ContentType contentType;
}

class ContentQualityGrader {
  static const allCriteria = <String, List<String>>{
    'easyConcept': ['쉬운', '한 줄', '입문', '개념', '요약', '안내'],
    'principle': ['원리', '이론', '구조', '스캔', '계층', '모델', '정의'],
    'components': ['구성', '요소', '부품', '모듈', '장치', '역할'],
    'dataFlow': ['데이터 흐름', '흐름', '파이프라인', '수집', '저장', '전달'],
    'installWiring': ['설치', '배선', '케이블', '결선', '위치'],
    'configuration': ['설정', '주소', '스케일', '파라미터', '모드', '권한'],
    'calculation': ['공식', '계산', '스케일링', '알고리즘', '지표', 'CRC'],
    'controlProcedure': ['시퀀스', '절차', '상태', '시작조건', '정지조건', '순서'],
    'normalState': ['정상', '정상상태', '통과', '기대'],
    'faultCases': ['고장', '오류', '장애', '이상', '실패', '잘못된'],
    'diagnosis': ['진단', '점검', '원인', '확인', '검증'],
    'safety': ['안전', '비상', '인터록', '위험', '감전', '금지'],
    'operations': ['유지관리', '운영', '점검', '교정', '백업', '기록'],
    'limits': ['한계', '제한', '주의', '현장 적용', '매뉴얼', '교육용'],
    'sourcesLinked': [], // structural
    'relatedLinked': [], // structural
  };

  /// Required criteria by content type (not the full 14 for every page).
  static List<String> requiredFor(ContentType type) {
    switch (type) {
      case ContentType.glossary:
        return [
          'easyConcept',
          'principle',
          'components',
          'limits',
          'relatedLinked',
        ];
      case ContentType.officialSource:
        return [
          'easyConcept',
          'limits',
          'sourcesLinked',
          'diagnosis',
          'relatedLinked',
        ];
      case ContentType.concept:
        return [
          'easyConcept',
          'principle',
          'components',
          'limits',
          'relatedLinked',
          'faultCases',
        ];
      case ContentType.technology:
        return [
          'easyConcept',
          'principle',
          'components',
          'configuration',
          'faultCases',
          'diagnosis',
          'safety',
          'limits',
        ];
      case ContentType.procedure:
        return [
          'easyConcept',
          'controlProcedure',
          'normalState',
          'faultCases',
          'diagnosis',
          'safety',
          'operations',
          'limits',
        ];
      case ContentType.checklist:
        return [
          'easyConcept',
          'controlProcedure',
          'normalState',
          'diagnosis',
          'limits',
          'safety',
        ];
      case ContentType.troubleshooting:
        return [
          'easyConcept',
          'faultCases',
          'diagnosis',
          'controlProcedure',
          'safety',
          'operations',
          'limits',
        ];
      case ContentType.caseStudy:
        return [
          'easyConcept',
          'components',
          'dataFlow',
          'controlProcedure',
          'faultCases',
          'safety',
          'limits',
          'relatedLinked',
        ];
    }
  }

  static ContentQualityGrade grade(SmartFarmContent content) {
    final text = content.searchableText.toLowerCase();
    final matched = <String>[];
    final missingAll = <String>[];

    for (final entry in allCriteria.entries) {
      if (entry.key == 'sourcesLinked') {
        if (content.sourceIds.isNotEmpty) {
          matched.add(entry.key);
        } else {
          missingAll.add(entry.key);
        }
        continue;
      }
      if (entry.key == 'relatedLinked') {
        if (content.relatedIds.length >= 2) {
          matched.add(entry.key);
        } else {
          missingAll.add(entry.key);
        }
        continue;
      }
      final hit = entry.value.any((k) => text.contains(k.toLowerCase()));
      if (hit) {
        matched.add(entry.key);
      } else {
        missingAll.add(entry.key);
      }
    }

    void ensure(String key) {
      if (!matched.contains(key)) {
        matched.add(key);
        missingAll.remove(key);
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
      if (st.contains('고장') ||
          st.contains('장애') ||
          st.contains('오류') ||
          st.contains('잘못된')) {
        ensure('faultCases');
      }
      if (st.contains('설치') || st.contains('배선')) {
        ensure('installWiring');
      }
      if (st.contains('공식') || st.contains('계산') || st.contains('지표')) {
        ensure('calculation');
      }
      if (st.contains('구성') ||
          st.contains('계층') ||
          st.contains('요소') ||
          st.contains('역할')) {
        ensure('components');
        ensure('principle');
      }
      if (st.contains('쉬운') || st.contains('개념') || st.contains('요약')) {
        ensure('easyConcept');
      }
    }

    final required = requiredFor(content.contentType);
    final matchedRequired = required.where(matched.contains).toList();
    final missingRequired = required
        .where((r) => !matched.contains(r))
        .toList();

    var bonus = 0;
    if (content.sections.length >= 6) bonus += 1;
    if (content.sections.any(
      (s) => s.copyText != null && s.copyText!.isNotEmpty,
    )) {
      bonus += 1;
    }
    if (content.sections.any(
      (s) =>
          s.kind == SectionKind.safety ||
          s.kind == SectionKind.danger ||
          s.kind == SectionKind.fieldValidation ||
          s.kind == SectionKind.manufacturer ||
          s.kind == SectionKind.caution,
    )) {
      bonus += 1;
    }
    if (content.difficulty == Difficulty.practical ||
        content.difficulty == Difficulty.expert) {
      bonus += 1;
    }

    final reqCount = required.length;
    final reqHit = matchedRequired.length;
    final ratio = reqCount == 0 ? 0.0 : reqHit / reqCount;
    final score = reqHit + bonus;

    // Thresholds relative to type-required set (strict, not loosened).
    final String grade;
    if (ratio >= 0.9 && score >= (reqCount + 2).clamp(6, 14)) {
      grade = 'A';
    } else if (ratio >= 0.75 && score >= (reqCount).clamp(5, 12)) {
      grade = 'B';
    } else if (ratio >= 0.5) {
      grade = 'C';
    } else {
      grade = 'D';
    }

    return ContentQualityGrade(
      id: content.id,
      grade: grade,
      score: score,
      matchedCriteria: matchedRequired,
      missingCriteria: missingRequired,
      requiredCriteria: required,
      contentType: content.contentType,
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
