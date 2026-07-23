import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';
import '../core/utils/clipboard_utils.dart';
import '../data/content_catalog.dart';
import '../models/smart_farm_content.dart';
import '../widgets/content_widgets.dart';

class ProjectReportPage extends StatelessWidget {
  const ProjectReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final report = ContentCatalog.report;
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
                  '개발·배포 기록',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('1단계에서는 로컬 정적 데이터로 표시합니다. 서버에 자동 저장되지 않습니다.'),
                const SizedBox(height: 16),
                TechCard(title: '작업 단계', body: report.phase),
                const SizedBox(height: 10),
                TechCard(title: '작업 일자', body: report.workDate),
                const SizedBox(height: 10),
                TechCard(title: '변경 요약', body: report.changeSummary),
                const SizedBox(height: 10),
                CalloutBox(
                  title: '검사 결과',
                  body: report.checkResults.isEmpty
                      ? '-'
                      : report.checkResults.first,
                  bullets: report.checkResults.length > 1
                      ? report.checkResults.sublist(1)
                      : const [],
                  kind: SectionKind.fieldCheck,
                ),
                TechCard(title: '커밋 해시', body: report.commitHash),
                const SizedBox(height: 10),
                TechCard(
                  title: 'GitHub Actions',
                  body: report.githubActionsUrl,
                ),
                const SizedBox(height: 10),
                TechCard(
                  title: 'Firebase Project ID',
                  body: report.firebaseProjectId,
                ),
                const SizedBox(height: 10),
                TechCard(title: '운영 주소', body: report.liveUrl),
                const SizedBox(height: 10),
                CalloutBox(
                  title: '남은 작업',
                  body: report.remainingWork.isEmpty
                      ? '-'
                      : report.remainingWork.first,
                  bullets: report.remainingWork.length > 1
                      ? report.remainingWork.sublist(1)
                      : const [],
                  kind: SectionKind.important,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    FilledButton.icon(
                      onPressed: () => copyToClipboard(
                        context,
                        report.toMarkdown(),
                        message: '작업 완료 보고를 복사했습니다.',
                      ),
                      icon: const Icon(Icons.copy_all),
                      label: const Text('전체 보고 복사'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => copyToClipboard(
                        context,
                        report.liveUrl,
                        message: '운영 주소를 복사했습니다.',
                      ),
                      icon: const Icon(Icons.link),
                      label: const Text('운영 주소 복사'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => copyToClipboard(
                        context,
                        report.commitHash,
                        message: '커밋 해시를 복사했습니다.',
                      ),
                      icon: const Icon(Icons.tag),
                      label: const Text('커밋 해시 복사'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  '참고: 패키지 ${AppConstants.packageName}, 저장소 ${AppConstants.githubRepo}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
