import 'package:flutter_test/flutter_test.dart';
import 'package:sotong_smart_farm/core/quality/content_quality_grader.dart';
import 'package:sotong_smart_farm/data/content_catalog.dart';
import 'package:sotong_smart_farm/models/smart_farm_content.dart';

SmartFarmContent _sample({
  required String id,
  required ContentType type,
  required List<ContentSection> sections,
  List<String> related = const ['a', 'b'],
  List<String> sources = const ['src-rda'],
}) {
  return SmartFarmContent(
    id: id,
    title: '샘플',
    summary: '쉬운 개념 요약',
    category: '시험',
    difficulty: Difficulty.basic,
    contentType: type,
    sections: sections,
    relatedIds: related,
    sourceIds: sources,
  );
}

void main() {
  test('용어 페이지는 FMEA 수준 절차를 요구하지 않는다', () {
    final c = _sample(
      id: 'g1',
      type: ContentType.glossary,
      sections: const [
        ContentSection(
          title: '쉬운 설명',
          body: '개념을 쉽게 안내한다. 역할과 정의를 정리한다.',
          kind: SectionKind.important,
        ),
        ContentSection(title: '구성 요소', body: '용어의 구성 요소와 관련 역할을 설명한다.'),
        ContentSection(
          title: '한계',
          body: '교육용이며 현장 매뉴얼을 대체하지 않는다.',
          kind: SectionKind.caution,
        ),
      ],
    );
    final g = ContentQualityGrader.grade(c);
    expect(g.requiredCriteria.contains('installWiring'), isFalse);
    expect(g.requiredCriteria.contains('calculation'), isFalse);
    expect(['A', 'B', 'C'].contains(g.grade), isTrue);
  });

  test('빈 콘텐츠는 D', () {
    final c = _sample(
      id: 'empty',
      type: ContentType.technology,
      sections: const [],
      related: const [],
      sources: const [],
    );
    expect(ContentQualityGrader.grade(c).grade, 'D');
  });

  test('섹션 kind 증거가 반영된다', () {
    final c = _sample(
      id: 'safe',
      type: ContentType.procedure,
      sections: const [
        ContentSection(
          title: '쉬운 설명',
          body: '절차 개념 요약',
          kind: SectionKind.important,
        ),
        ContentSection(
          title: '작업 순서',
          body: '시작조건과 정지조건, 정상상태를 확인하는 절차',
          kind: SectionKind.practical,
        ),
        ContentSection(
          title: '잘못된 사례',
          body: '오류·장애 시 진단 순서',
          kind: SectionKind.caution,
        ),
        ContentSection(
          title: '안전',
          body: '비상·인터록·위험 금지',
          kind: SectionKind.safety,
        ),
        ContentSection(
          title: '운영',
          body: '유지관리·백업·점검',
          kind: SectionKind.fieldCheck,
        ),
      ],
    );
    final g = ContentQualityGrader.grade(c);
    expect(g.matchedCriteria.contains('safety'), isTrue);
    expect(g.grade == 'A' || g.grade == 'B' || g.grade == 'C', isTrue);
  });

  test('형식적인 키워드만으로는 A가 되지 않는다', () {
    final c = _sample(
      id: 'kw',
      type: ContentType.technology,
      sections: const [
        ContentSection(title: '키워드', body: '원리 구성 설정 고장 진단 안전 한계'),
      ],
      related: const [],
      sources: const [],
    );
    final g = ContentQualityGrader.grade(c);
    expect(g.grade, isNot('A'));
  });

  test('집계 합계는 전체와 같다', () {
    final s = ContentQualityGrader.summarize(ContentCatalog.allContents);
    expect(
      s.values.fold<int>(0, (a, b) => a + b),
      ContentCatalog.allContents.length,
    );
  });

  test('마감 보강 20개는 B 이상', () {
    expect(ContentCatalog.phaseClosureEnrichedCount, 20);
    for (final id in ContentCatalog.phaseClosureEnrichedIds) {
      final g = ContentQualityGrader.grade(ContentCatalog.byId(id)!);
      expect(
        g.grade == 'A' || g.grade == 'B',
        isTrue,
        reason: '$id -> ${g.grade} missing ${g.missingCriteria}',
      );
    }
  });

  test('applicationValidationStatus 집계가 존재한다', () {
    expect(ContentCatalog.fieldValidationRequiredContentCount, greaterThan(0));
    expect(ContentCatalog.applicationValidationCounts(), isNotEmpty);
  });
}
