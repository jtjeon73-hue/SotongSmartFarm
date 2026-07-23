import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/navigation.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';
import '../data/content_catalog.dart';
import '../widgets/content_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF16324F),
                        Color(0xFF1F7A8C),
                        Color(0xFF2F6F4E),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppConstants.appName,
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '스마트농업의 센서·PLC·통신·소프트웨어·AI·안전 운영을\n과장 없이, 현장 중심으로 정리한 기술정보 사이트입니다.',
                        style: TextStyle(
                          color: Colors.white,
                          height: 1.55,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          FilledButton.tonal(
                            onPressed: () =>
                                context.go('/overview/what-is-smart-farm'),
                            child: const Text('스마트팜 이해부터 시작'),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white70),
                            ),
                            onPressed: () => context.go('/search'),
                            child: const Text('검색·필터'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '핵심 기술 흐름',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 10),
                const FlowSteps(
                  steps: [
                    '환경',
                    '센서',
                    '수집',
                    '저장',
                    '분석',
                    '판단',
                    '제어 명령',
                    '구동기',
                    '재측정',
                    '관리자 확인',
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  '학습 메뉴',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final cross = constraints.maxWidth > 900
                        ? 3
                        : constraints.maxWidth > 600
                        ? 2
                        : 1;
                    return GridView.count(
                      crossAxisCount: cross,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.55,
                      children: AppNavigation.groups.take(12).map((g) {
                        final first = g.items.first;
                        return TechCard(
                          title: g.title,
                          body: '${g.items.length}개 주제 · ${first.title}부터',
                          onTap: () => context.go(first.route),
                        );
                      }).toList(),
                    );
                  },
                ),
                const SizedBox(height: 24),
                Text(
                  '1단계 범위',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 10),
                TechCard(
                  title: '콘텐츠 · 검색 · 배포 기반',
                  body:
                      '콘텐츠 ${ContentCatalog.allContents.length}개, 교육 사례 ${ContentCatalog.cases.length}개, '
                      '용어 ${ContentCatalog.terms.length}개, 프롬프트 ${ContentCatalog.prompts.length}개. '
                      'AI 예측을 PLC에 직접 연결하지 않으며, 수동운전·인터록·비상정지를 함께 설명합니다.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
