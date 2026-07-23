import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../core/utils/clipboard_utils.dart';
import '../data/content_catalog.dart';
import '../models/smart_farm_content.dart';
import '../widgets/content_widgets.dart';

class PromptsPage extends StatelessWidget {
  const PromptsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prompts = ContentCatalog.prompts;
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
                  '프롬프트 라이브러리',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '스마트팜 설계·개발에 사용할 수 있는 대표 프롬프트입니다. '
                  '현장 수치·제조사 주소·법령은 AI가 추측하지 않도록 입력값을 명시하세요.',
                ),
                const SizedBox(height: 16),
                ...prompts.map((p) {
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
                                  p.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              MetaChip(label: p.category),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('목적: ${p.purpose}'),
                          const SizedBox(height: 8),
                          const Text(
                            '필요한 입력정보',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          ...p.requiredInputs.map((e) => Text('• $e')),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SelectableText(p.prompt),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FilledButton.icon(
                              onPressed: () => copyToClipboard(
                                context,
                                p.prompt,
                                message: '프롬프트를 복사했습니다.',
                              ),
                              icon: const Icon(Icons.copy),
                              label: const Text('프롬프트 복사'),
                            ),
                          ),
                          const SizedBox(height: 8),
                          CalloutBox(
                            title: '바꿀 항목',
                            body: p.replaceItems.join(' / '),
                            kind: SectionKind.normal,
                          ),
                          CalloutBox(
                            title: 'AI가 추측하면 안 되는 정보',
                            body: p.doNotGuess.join(' / '),
                            kind: SectionKind.safety,
                          ),
                          CalloutBox(
                            title: '보존할 기능 · 안전 · 검사',
                            body:
                                '보존: ${p.preserveFeatures.join(', ')}\n'
                                '안전: ${p.safetyConditions.join(', ')}\n'
                                '검사: ${p.checkConditions.join(', ')}',
                            kind: SectionKind.fieldCheck,
                          ),
                          Text('완료 결과: ${p.expectedResult}'),
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
