import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/navigation.dart';
import '../core/theme/app_theme.dart';
import '../data/content_catalog.dart';
import '../models/smart_farm_content.dart';
import '../widgets/content_widgets.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key, required this.contentId});

  final String contentId;

  @override
  Widget build(BuildContext context) {
    final content = ContentCatalog.byId(contentId);
    if (content == null) {
      return const _ScrollBody(child: Text('콘텐츠를 찾을 수 없습니다.'));
    }

    final nav = AppNavigation.findByRoute(GoRouterState.of(context).uri.path);
    final neighbors = AppNavigation.neighbors(
      nav?.route ?? GoRouterState.of(context).uri.path,
    );

    return _ScrollBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Breadcrumb(category: content.category, title: content.title),
          const SizedBox(height: 12),
          Text(
            content.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.deepNavy,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content.summary,
            style: const TextStyle(height: 1.55, fontSize: 16),
          ),
          const SizedBox(height: 14),
          if (content.qualityGrade != null)
            MetaChip(label: '품질 ${content.qualityGrade}'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              DifficultyBadge(difficulty: content.difficulty),
              MetaChip(label: content.contentType.label),
              ...content.farmTypes.map((f) => MetaChip(label: f.label)),
              MetaChip(label: content.verificationStatus.label),
              if (content.checkedAt != null)
                MetaChip(label: '확인일 ${content.checkedAt}'),
            ],
          ),
          if (content.sections.length >= 4) ...[
            const SizedBox(height: 16),
            Text(
              '목차',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.deepNavy,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var i = 0; i < content.sections.length; i++)
                  MetaChip(label: '${i + 1}. ${content.sections[i].title}'),
              ],
            ),
          ],
          const SizedBox(height: 20),
          ...content.sections.map((s) {
            final box = CalloutBox(
              title: s.title,
              body: s.body,
              kind: s.kind,
              bullets: s.bullets,
              copyText: s.copyText,
            );
            final expertLayer =
                s.kind == SectionKind.expertNote ||
                s.kind == SectionKind.danger ||
                s.kind == SectionKind.manufacturer ||
                s.kind == SectionKind.fieldValidation ||
                s.title.contains('전문가') ||
                s.title.contains('설계 판단') ||
                s.title.contains('위험') ||
                s.title.contains('검증') ||
                s.title.contains('현장');
            if (content.difficulty == Difficulty.expert || !expertLayer) {
              return box;
            }
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                title: Text('전문가 영역 · ${s.title}'),
                subtitle: const Text('접기/펼치기 — 초보 학습은 쉬운 설명부터'),
                childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                children: [box],
              ),
            );
          }),
          if (content.sourceIds.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              '출처와 확인',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.deepNavy,
              ),
            ),
            const SizedBox(height: 10),
            ...content.sourceIds.map((id) {
              final src = ContentCatalog.sourceById(id);
              if (src == null) {
                return Text('출처 ID 미확인: $id');
              }
              return Card(
                child: ListTile(
                  title: Text(src.title),
                  subtitle: Text(
                    '${src.organization} · ${src.yearOrVersion} · ${src.status.label}\n확인일 ${src.checkedAt}\n${src.confirmedContent}',
                  ),
                  isThreeLine: true,
                ),
              );
            }),
          ],
          if (content.relatedIds.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              '연관 콘텐츠',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.deepNavy,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: content.relatedIds.map((id) {
                final related = ContentCatalog.byId(id);
                final route = AppNavigation.allItems
                    .where((e) => e.contentId == id)
                    .map((e) => e.route)
                    .cast<String?>()
                    .firstWhere((e) => e != null, orElse: () => null);
                return ActionChip(
                  label: Text(related?.title ?? id),
                  onPressed: route == null ? null : () => context.go(route),
                );
              }).toList(),
            ),
          ],
          const SizedBox(height: 24),
          Row(
            children: [
              if (neighbors.$1 != null)
                OutlinedButton.icon(
                  onPressed: () => context.go(neighbors.$1!.route),
                  icon: const Icon(Icons.arrow_back),
                  label: Text('이전: ${neighbors.$1!.title}'),
                ),
              const Spacer(),
              if (neighbors.$2 != null)
                FilledButton.icon(
                  onPressed: () => context.go(neighbors.$2!.route),
                  icon: const Icon(Icons.arrow_forward),
                  label: Text('다음: ${neighbors.$2!.title}'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Breadcrumb extends StatelessWidget {
  const _Breadcrumb({required this.category, required this.title});

  final String category;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TextButton(onPressed: () => context.go('/'), child: const Text('홈')),
        const Text(' / '),
        Text(category, style: const TextStyle(color: AppColors.teal)),
        const Text(' / '),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _ScrollBody extends StatelessWidget {
  const _ScrollBody({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: child,
          ),
        ),
      ),
    );
  }
}
