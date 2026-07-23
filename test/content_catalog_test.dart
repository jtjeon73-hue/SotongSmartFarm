import 'package:flutter_test/flutter_test.dart';
import 'package:sotong_smart_farm/app/navigation.dart';
import 'package:sotong_smart_farm/data/content_catalog.dart';
import 'package:sotong_smart_farm/models/smart_farm_content.dart';

void main() {
  test('메뉴 그룹과 항목이 구성되어 있다', () {
    expect(AppNavigation.groups.length, greaterThanOrEqualTo(12));
    expect(AppNavigation.allItems, isNotEmpty);
  });

  test('모든 content 라우트에 contentId가 연결된다', () {
    for (final item in AppNavigation.allItems) {
      if (item.contentId == null) continue;
      expect(
        ContentCatalog.byId(item.contentId!),
        isNotNull,
        reason: 'missing ${item.contentId} for ${item.route}',
      );
    }
  });

  test('중복 ID가 없다', () {
    expect(ContentCatalog.duplicateIds(), isEmpty);
  });

  test('빈 제목·본문이 없다', () {
    expect(ContentCatalog.emptyTitles(), isEmpty);
  });

  test('관련 콘텐츠·출처 ID가 유효하다', () {
    expect(ContentCatalog.brokenRelatedIds(), isEmpty);
  });

  test('검색과 필터가 동작한다', () {
    final all = ContentCatalog.search();
    expect(all, isNotEmpty);
    final filtered = ContentCatalog.search(
      difficulty: Difficulty.beginner,
      farmType: FarmType.greenhouse,
    );
    expect(filtered.every((e) => e.difficulty == Difficulty.beginner), isTrue);
    final q = ContentCatalog.search(query: '센서');
    expect(q, isNotEmpty);
  });

  test('사례·프롬프트·용어·출처 최소 수량을 충족한다', () {
    expect(ContentCatalog.cases.length, greaterThanOrEqualTo(10));
    expect(ContentCatalog.prompts.length, greaterThanOrEqualTo(15));
    expect(ContentCatalog.terms.length, greaterThanOrEqualTo(20));
    expect(ContentCatalog.sources, isNotEmpty);
  });

  test('공식 URL 형식이 http(s)이다', () {
    for (final src in ContentCatalog.sources) {
      expect(
        src.url.startsWith('https://') || src.url.startsWith('http://'),
        isTrue,
        reason: src.id,
      );
    }
  });

  test('완료보고 Markdown이 생성된다', () {
    final md = ContentCatalog.report.toMarkdown();
    expect(md.contains('SotongSmartFarm'), isTrue);
    expect(md.contains('Firebase Project ID'), isTrue);
  });
}
