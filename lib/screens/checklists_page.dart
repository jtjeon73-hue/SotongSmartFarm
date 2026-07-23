import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../core/utils/clipboard_utils.dart';
import '../data/checklist_data.dart';
import '../models/smart_farm_content.dart';
import '../widgets/content_widgets.dart';

class ChecklistsPage extends StatelessWidget {
  const ChecklistsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  '실무 체크리스트',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 8),
                const CalloutBox(
                  title: '저장되지 않음',
                  body: '체크 상태는 서버에 저장되지 않습니다. 복사하여 현장 문서·이슈트래커에 붙여 사용하세요.',
                  kind: SectionKind.caution,
                ),
                ...practicalChecklists.map((c) {
                  final text = c.items.map((e) => e.toCopyBlock()).join('\n\n');
                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  c.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              MetaChip(label: c.category),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ...c.items.map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: CalloutBox(
                                title: item.what,
                                body:
                                    '방법: ${item.how}\n담당: ${item.role}\n증거: ${item.evidence}\n완료기준: ${item.doneCriteria}',
                                bullets: ['미완료 위험: ${item.riskIfSkipped}'],
                                kind: SectionKind.practical,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FilledButton.icon(
                              onPressed: () => copyToClipboard(
                                context,
                                '# ${c.title}\n\n$text',
                                message: '체크리스트를 복사했습니다.',
                              ),
                              icon: const Icon(Icons.copy),
                              label: const Text('체크리스트 복사'),
                            ),
                          ),
                        ],
                      ),
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
