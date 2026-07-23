import 'package:flutter_test/flutter_test.dart';
import 'package:sotong_smart_farm/core/quality/content_quality_grader.dart';
import 'package:sotong_smart_farm/data/content_catalog.dart';
import 'package:sotong_smart_farm/data/phase3_report_builder.dart';

void main() {
  test('품질등급은 A/B/C/D만 사용한다', () {
    for (final c in ContentCatalog.allContents) {
      final g = ContentQualityGrader.grade(c).grade;
      expect(['A', 'B', 'C', 'D'].contains(g), isTrue, reason: c.id);
    }
  });

  test('등급 요약 합계는 전체 콘텐츠 수와 같다', () {
    final s = ContentQualityGrader.summarize(ContentCatalog.allContents);
    final sum = s.values.fold<int>(0, (a, b) => a + b);
    expect(sum, ContentCatalog.allContents.length);
  });

  test('3단계 전문가 페이지·프롬프트·런북 최소량', () {
    expect(ContentCatalog.phase3ExpertCount, greaterThanOrEqualTo(16));
    expect(ContentCatalog.prompts.length, greaterThanOrEqualTo(50));
    expect(ContentCatalog.prompts.length, lessThanOrEqualTo(60));
    expect(ContentCatalog.fmeaRows.length, greaterThanOrEqualTo(12));
    expect(ContentCatalog.runbooks.length, greaterThanOrEqualTo(18));
    expect(ContentCatalog.fatSatItems.length, greaterThanOrEqualTo(20));
  });

  test('런북은 12단계', () {
    for (final r in ContentCatalog.runbooks) {
      expect(r.steps.length, 12, reason: r.id);
    }
  });

  test('3단계 보고 Markdown 생성', () {
    final md = buildPhase3FullReport(
      commitHash: 'test',
      gradeCounts: gradeSummaryNow(),
      sourceStatusCounts: countSourceStatuses(),
    );
    expect(md.contains('3단계 최종 완료 보고'), isTrue);
    expect(md.contains('ContentQualityGrader'), isTrue);
  });
}
