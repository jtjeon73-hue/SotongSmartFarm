import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../core/utils/clipboard_utils.dart';
import '../data/content_catalog.dart';
import '../data/fatsat_data.dart';
import '../models/smart_farm_content.dart';
import '../widgets/content_widgets.dart';

class FatSatPage extends StatelessWidget {
  const FatSatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ContentCatalog.fatSatItems;
    final fat = items.where((e) => e.phase == 'FAT').toList();
    final sat = items.where((e) => e.phase == 'SAT').toList();
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
                  'FAT · SAT 템플릿',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 8),
                const CalloutBox(
                  title: '미실시 합격 금지',
                  body:
                      '실제 시험·증거 없이 합격으로 표시하지 마세요. '
                      '합부·결함·조치·승인은 현장 기록으로만 확정합니다.',
                  kind: SectionKind.caution,
                ),
                Text('FAT ${fat.length} · SAT ${sat.length}'),
                const SizedBox(height: 12),
                Text(
                  'FAT (공장/시뮬)',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 8),
                ...fat.map((t) => _tile(context, t)),
                const SizedBox(height: 16),
                Text(
                  'SAT (현장)',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 8),
                ...sat.map((t) => _tile(context, t)),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () {
                    final md = items
                        .map(
                          (t) =>
                              '| ${t.id} | ${t.phase} | ${t.requirement} | ${t.preconditions} | ${t.procedure} | ${t.expected} | ${t.evidenceHint} | 미실시 |',
                        )
                        .join('\n');
                    copyToClipboard(
                      context,
                      '시험ID|단계|요구사항|사전조건|절차|예상|증거힌트|결과\n$md',
                      message: 'FAT·SAT 체크리스트를 복사했습니다.',
                    );
                  },
                  icon: const Icon(Icons.checklist),
                  label: const Text('전체 체크리스트 Markdown 복사'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tile(BuildContext context, TestCaseItem t) {
    final md =
        '''
### ${t.id} (${t.phase})
- 요구사항: ${t.requirement}
- 사전조건: ${t.preconditions}
- 절차: ${t.procedure}
- 예상결과: ${t.expected}
- 증거힌트: ${t.evidenceHint}
- 결과: 미실시
'''
            .trim();
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ExpansionTile(
        title: Text('${t.id} · ${t.requirement}'),
        subtitle: Text(t.phase),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: [
          Text('사전조건: ${t.preconditions}'),
          Text('절차: ${t.procedure}'),
          Text('예상: ${t.expected}'),
          Text('증거힌트: ${t.evidenceHint}'),
          const MetaChip(label: '결과: 미실시'),
          OutlinedButton.icon(
            onPressed: () =>
                copyToClipboard(context, md, message: '시험 항목을 복사했습니다.'),
            icon: const Icon(Icons.copy),
            label: const Text('항목 복사'),
          ),
        ],
      ),
    );
  }
}
