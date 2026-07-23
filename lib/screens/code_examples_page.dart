import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../core/utils/clipboard_utils.dart';
import '../data/code_example_data.dart';
import '../models/smart_farm_content.dart';
import '../widgets/content_widgets.dart';

class CodeExamplesPage extends StatelessWidget {
  const CodeExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = educationalCodeExamples;
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
                  '검증 상태 표시 코드 예제',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 8),
                const CalloutBox(
                  title: '상태 라벨',
                  body:
                      'runnable / compileValidated / staticValidated / '
                      'pseudocode / educationalExample / '
                      'manufacturerReviewRequired / fieldValidationRequired. '
                      'MFC·PLC는 본 환경에서 컴파일하지 않았습니다.',
                  kind: SectionKind.caution,
                ),
                ...items.map((e) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ExpansionTile(
                      title: Text('${e.language} · ${e.title}'),
                      subtitle: Text('${e.status.name} — ${e.summary}'),
                      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      children: [
                        SelectableText(e.code),
                        if (e.notes.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          ...e.notes.map((n) => Text('· $n')),
                        ],
                        OutlinedButton.icon(
                          onPressed: () => copyToClipboard(
                            context,
                            e.code,
                            message: '코드를 복사했습니다.',
                          ),
                          icon: const Icon(Icons.copy),
                          label: const Text('코드 복사'),
                        ),
                      ],
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
