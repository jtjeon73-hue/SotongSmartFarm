import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sotong_smart_farm/app/app.dart';

void main() {
  testWidgets('홈과 주요 메뉴가 렌더링된다', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1440, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(SotongSmartFarmApp());
    await tester.pumpAndSettle();

    expect(find.textContaining('SotongSmartFarm'), findsWidgets);
    expect(find.text('스마트팜 이해'), findsWidgets);
    expect(find.byTooltip('검색'), findsOneWidget);
  });

  testWidgets('모바일에서 드로어 메뉴가 열린다', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(SotongSmartFarmApp());
    await tester.pumpAndSettle();

    expect(find.byTooltip('메뉴 열기'), findsOneWidget);
    await tester.tap(find.byTooltip('메뉴 열기'));
    await tester.pumpAndSettle();
    expect(find.text('센서와 계측'), findsWidgets);
  });
}
