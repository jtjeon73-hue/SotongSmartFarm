import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/theme/app_theme.dart';
import '../models/smart_farm_content.dart';

class DifficultyBadge extends StatelessWidget {
  const DifficultyBadge({super.key, required this.difficulty});

  final Difficulty difficulty;

  Color get _color {
    switch (difficulty) {
      case Difficulty.beginner:
        return AppColors.teal;
      case Difficulty.basic:
        return AppColors.farmGreen;
      case Difficulty.practical:
        return AppColors.warning;
      case Difficulty.expert:
        return AppColors.expert;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _color.withValues(alpha: 0.35)),
      ),
      child: Text(
        difficulty.label,
        style: TextStyle(
          color: _color,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}

class MetaChip extends StatelessWidget {
  const MetaChip({super.key, required this.label, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: icon == null ? null : Icon(icon, size: 16),
      label: Text(label),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

class CalloutBox extends StatelessWidget {
  const CalloutBox({
    super.key,
    required this.title,
    required this.body,
    required this.kind,
    this.bullets = const [],
    this.copyText,
  });

  final String title;
  final String body;
  final SectionKind kind;
  final List<String> bullets;
  final String? copyText;

  Color get _color {
    switch (kind) {
      case SectionKind.important:
        return AppColors.teal;
      case SectionKind.safety:
      case SectionKind.danger:
        return AppColors.danger;
      case SectionKind.fieldCheck:
      case SectionKind.fieldValidation:
        return AppColors.field;
      case SectionKind.expertNote:
        return AppColors.expert;
      case SectionKind.flow:
      case SectionKind.practical:
        return AppColors.farmGreen;
      case SectionKind.caution:
        return AppColors.warning;
      case SectionKind.manufacturer:
        return const Color(0xFF5B4B8A);
      case SectionKind.normal:
        return AppColors.deepNavy;
    }
  }

  IconData get _icon {
    switch (kind) {
      case SectionKind.important:
        return Icons.lightbulb_outline;
      case SectionKind.safety:
      case SectionKind.danger:
        return Icons.warning_amber_rounded;
      case SectionKind.fieldCheck:
      case SectionKind.fieldValidation:
        return Icons.fact_check_outlined;
      case SectionKind.expertNote:
        return Icons.biotech_outlined;
      case SectionKind.flow:
        return Icons.account_tree_outlined;
      case SectionKind.practical:
        return Icons.handyman_outlined;
      case SectionKind.caution:
        return Icons.report_problem_outlined;
      case SectionKind.manufacturer:
        return Icons.menu_book_outlined;
      case SectionKind.normal:
        return Icons.article_outlined;
    }
  }

  String get _kindLabel {
    switch (kind) {
      case SectionKind.important:
        return '핵심';
      case SectionKind.safety:
        return '주의';
      case SectionKind.danger:
        return '위험';
      case SectionKind.fieldCheck:
        return '현장 확인';
      case SectionKind.fieldValidation:
        return '현장 검증';
      case SectionKind.expertNote:
        return '전문가 메모';
      case SectionKind.flow:
        return '기술 흐름';
      case SectionKind.practical:
        return '실무';
      case SectionKind.caution:
        return '주의';
      case SectionKind.manufacturer:
        return '제조사 확인';
      case SectionKind.normal:
        return '설명';
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _color;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: color, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(_icon, color: color, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.deepNavy,
                  ),
                ),
              ),
              Text(
                _kindLabel,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(body, style: const TextStyle(height: 1.55)),
          if (bullets.isNotEmpty) ...[
            const SizedBox(height: 10),
            ...bullets.map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• ', style: TextStyle(color: color)),
                    Expanded(
                      child: Text(b, style: const TextStyle(height: 1.45)),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (copyText != null && copyText!.trim().isNotEmpty) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SelectableText(
                copyText!,
                style: const TextStyle(fontFamily: 'monospace', height: 1.45),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton.icon(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: copyText!));
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('코드·공식·절차를 복사했습니다.'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: const Icon(Icons.copy, size: 18),
                label: const Text('공식·코드 복사'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class FlowSteps extends StatelessWidget {
  const FlowSteps({super.key, required this.steps});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.farmGreen.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.farmGreen.withValues(alpha: 0.25),
              ),
            ),
            child: Text(
              '${i + 1}. ${steps[i]}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          if (i < steps.length - 1)
            const Icon(Icons.arrow_forward, size: 16, color: AppColors.teal),
        ],
      ],
    );
  }
}

class TechCard extends StatelessWidget {
  const TechCard({
    super.key,
    required this.title,
    required this.body,
    this.onTap,
  });

  final String title;
  final String body;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black.withValues(alpha: 0.06)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.deepNavy,
                ),
              ),
              const SizedBox(height: 8),
              Text(body, style: const TextStyle(height: 1.45)),
            ],
          ),
        ),
      ),
    );
  }
}
