import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> copyToClipboard(
  BuildContext context,
  String text, {
  String message = '클립보드에 복사했습니다.',
}) async {
  await Clipboard.setData(ClipboardData(text: text));
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
  );
}

String difficultyLabel(String value) {
  switch (value) {
    case 'beginner':
      return '입문';
    case 'basic':
      return '기초';
    case 'practical':
      return '실무';
    case 'expert':
      return '전문가';
    default:
      return value;
  }
}

List<String> highlightParts(String source, String query) {
  if (query.trim().isEmpty) return [source];
  final lower = source.toLowerCase();
  final q = query.toLowerCase();
  final parts = <String>[];
  var start = 0;
  while (true) {
    final index = lower.indexOf(q, start);
    if (index < 0) {
      parts.add(source.substring(start));
      break;
    }
    if (index > start) parts.add(source.substring(start, index));
    parts.add(source.substring(index, index + q.length));
    start = index + q.length;
  }
  return parts;
}
