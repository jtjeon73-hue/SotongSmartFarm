import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/theme/app_theme.dart';
import '../data/content_catalog.dart';
import '../models/smart_farm_content.dart';
import '../widgets/content_widgets.dart';

class CasesPage extends StatelessWidget {
  const CasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cases = ContentCatalog.cases;
    return SelectionArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '교육용 설계 사례',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '실제 현장 구축 실적이 아니라 학습용 설계 사례입니다. 가상 수익·성과를 제시하지 않습니다.',
                ),
                const SizedBox(height: 16),
                ...cases.map((c) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(c.title),
                      subtitle: Text(c.purpose),
                      trailing: DifficultyBadge(difficulty: c.difficulty),
                      onTap: () => context.go('/cases/${c.id}'),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CaseDetailPage extends StatelessWidget {
  const CaseDetailPage({super.key, required this.caseId});

  final String caseId;

  @override
  Widget build(BuildContext context) {
    final c = ContentCatalog.caseById(caseId);
    if (c == null) {
      return const Center(child: Text('사례를 찾을 수 없습니다.'));
    }

    Widget section(String title, List<String> items) {
      return CalloutBox(
        title: title,
        body: items.isEmpty ? '항목 없음' : items.first,
        bullets: items.length > 1 ? items.sublist(1) : const [],
        kind: SectionKind.normal,
      );
    }

    return SelectionArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (c.isEducational)
                  const MetaChip(label: '교육용 설계 사례', icon: Icons.school),
                const SizedBox(height: 10),
                Text(
                  c.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 8),
                Text('대상: ${c.targetFarm}'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    DifficultyBadge(difficulty: c.difficulty),
                    ...c.farmTypes.map((f) => MetaChip(label: f.label)),
                  ],
                ),
                const SizedBox(height: 16),
                CalloutBox(
                  title: '목적',
                  body: c.purpose,
                  kind: SectionKind.important,
                ),
                section('필요한 센서', c.sensors),
                section('필요한 제어기', c.controllers),
                section('통신', c.communication),
                section('소프트웨어', c.software),
                section('데이터 흐름', c.dataFlow),
                section('기본 제어', c.basicControl),
                CalloutBox(
                  title: '위험요소',
                  body: c.risks.isEmpty ? '-' : c.risks.first,
                  bullets: c.risks.length > 1 ? c.risks.sublist(1) : const [],
                  kind: SectionKind.safety,
                ),
                section('예상 장애', c.expectedFailures),
                CalloutBox(
                  title: '검증방법',
                  body: c.verification.isEmpty ? '-' : c.verification.first,
                  bullets: c.verification.length > 1
                      ? c.verification.sublist(1)
                      : const [],
                  kind: SectionKind.fieldCheck,
                ),
                section('확장 방향', c.extensions),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
