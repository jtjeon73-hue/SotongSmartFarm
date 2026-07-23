import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../core/utils/clipboard_utils.dart';
import '../data/content_catalog.dart';
import '../models/smart_farm_content.dart';
import '../widgets/content_widgets.dart';

class RunbooksPage extends StatelessWidget {
  const RunbooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final books = ContentCatalog.runbooks;
    return SelectionArea(
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        itemCount: books.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 960),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '장애대응 런북',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.deepNavy,
                          ),
                    ),
                    const SizedBox(height: 8),
                    const CalloutBox(
                      title: '교육용 런북',
                      body:
                          '12단계 형식입니다. 진단보다 사람·동물·설비 안전을 우선하세요. '
                          '현장 절차·연락망은 농장 문서로 확정해야 합니다.',
                      kind: SectionKind.safety,
                    ),
                    Text('런북 ${books.length}건 · 목록은 필요할 때 펼칩니다'),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            );
          }

          final b = books[index - 1];
          final md = [
            '# ${b.title}',
            '',
            '## 증상',
            b.symptoms,
            '',
            '## 영향',
            b.impacts,
            '',
            '## 12단계',
            ...b.steps.map((s) => '- $s'),
          ].join('\n');

          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 960),
              child: Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ExpansionTile(
                  key: PageStorageKey<String>(b.id),
                  maintainState: false,
                  title: Text(b.title),
                  subtitle: Text(b.symptoms, maxLines: 2),
                  childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  children: [
                    Text('영향: ${b.impacts}'),
                    const SizedBox(height: 8),
                    ...b.steps.map(
                      (s) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(s),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => copyToClipboard(
                        context,
                        md,
                        message: '런북 Markdown을 복사했습니다.',
                      ),
                      icon: const Icon(Icons.copy),
                      label: const Text('Markdown 복사'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
