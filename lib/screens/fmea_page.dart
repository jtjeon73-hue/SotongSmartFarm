import 'package:flutter/material.dart';

import '../core/calc/expert_calcs.dart';
import '../core/theme/app_theme.dart';
import '../core/utils/clipboard_utils.dart';
import '../data/content_catalog.dart';
import '../models/smart_farm_content.dart';
import '../widgets/content_widgets.dart';

class FmeaPage extends StatelessWidget {
  const FmeaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = ContentCatalog.fmeaRows;
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
                  '교육용 FMEA',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 8),
                const CalloutBox(
                  title: '교육용 · 절대 안전판정 아님',
                  body:
                      'S/O/D·RPN은 학습용 예시입니다. 조직·현장별 위험평가와 시험이 필요합니다. '
                      '이 화면은 안전승인·설계인증을 대신하지 않습니다.',
                  kind: SectionKind.caution,
                ),
                Text('사례 ${rows.length}건'),
                const SizedBox(height: 12),
                ...rows.map((r) {
                  final rpn = FmeaPriority.rpn(
                    severity: r.severity,
                    occurrence: r.occurrence,
                    detection: r.detectionScore,
                  );
                  final md =
                      '''
| 필드 | 값 |
|---|---|
| 설비 | ${r.asset} |
| 고장형태 | ${r.failureMode} |
| 원인 | ${r.cause} |
| 영향 | ${r.effect} |
| 검출 | ${r.detection} |
| 현재대책 | ${r.currentControls} |
| S/O/D | ${r.severity}/${r.occurrence}/${r.detectionScore} |
| RPN(교육) | $rpn |
| 개선 | ${r.action} |
| 담당 | ${r.role} |
| 검증 | ${r.verification} |
| 잔여위험 | ${r.residualNote} |
'''
                          .trim();
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ExpansionTile(
                      title: Text(r.asset),
                      subtitle: Text('${r.failureMode} · RPN(교육)=$rpn'),
                      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      children: [
                        Text('원인: ${r.cause}'),
                        Text('영향: ${r.effect}'),
                        Text('검출: ${r.detection}'),
                        Text('현재대책: ${r.currentControls}'),
                        Text('개선: ${r.action} · 담당: ${r.role}'),
                        Text('검증: ${r.verification}'),
                        Text('잔여위험: ${r.residualNote}'),
                        const SizedBox(height: 8),
                        OutlinedButton.icon(
                          onPressed: () => copyToClipboard(
                            context,
                            md,
                            message: 'FMEA Markdown을 복사했습니다.',
                          ),
                          icon: const Icon(Icons.copy),
                          label: const Text('Markdown 복사'),
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
