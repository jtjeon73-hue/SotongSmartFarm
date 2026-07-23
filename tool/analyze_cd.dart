import 'dart:convert';
import 'dart:io';

import 'package:sotong_smart_farm/core/quality/content_quality_grader.dart';
import 'package:sotong_smart_farm/data/content_catalog.dart';
import 'package:sotong_smart_farm/models/smart_farm_content.dart';

String reasonBucket(ContentQualityGrade g, SmartFarmContent c) {
  final m = g.missingCriteria.toSet();
  final reasons = <String>[];
  if (c.sections.length < 4) reasons.add('내용 부족');
  if (m.contains('principle') || m.contains('components')) {
    reasons.add('전문가 원리 부족');
  }
  if (m.contains('controlProcedure') || m.contains('configuration')) {
    reasons.add('실무 절차 부족');
  }
  if (m.contains('faultCases') || m.contains('diagnosis')) {
    reasons.add('오류·진단 부족');
  }
  if (m.contains('safety')) reasons.add('안전 부족');
  if (c.sourceIds.isEmpty) reasons.add('출처 부족');
  if (c.verificationStatus == VerificationStatus.educationalExample ||
      c.verificationStatus == VerificationStatus.needsReview) {
    reasons.add('검증상태 부족');
  }
  if (c.relatedIds.length < 2) reasons.add('관련 콘텐츠 부족');
  if (g.matchedCriteria.length < 5 && c.sections.length >= 5) {
    reasons.add('자동평가 키워드 불일치');
  }
  if (c.contentType == ContentType.glossary && g.grade == 'D') {
    reasons.add('데이터와 UI 구조 문제');
  }
  if (reasons.isEmpty) reasons.add('내용 부족');
  return reasons.join('; ');
}

void main() {
  final rows = <Map<String, Object>>[];
  for (final c in ContentCatalog.allContents) {
    final g = ContentQualityGrader.grade(c);
    if (g.grade != 'C' && g.grade != 'D') continue;
    rows.add({
      'grade': g.grade,
      'id': c.id,
      'title': c.title,
      'category': c.category,
      'contentType': c.contentType.name,
      'sections': c.sections.length,
      'matched': g.matchedCriteria.length,
      'missing': g.missingCriteria.join(','),
      'sources': c.sourceIds.length,
      'related': c.relatedIds.length,
      'verification': c.verificationStatus.name,
      'reasons': reasonBucket(g, c),
    });
  }
  rows.sort((a, b) {
    final g = (a['grade'] as String).compareTo(b['grade'] as String);
    if (g != 0) return -g; // D before C
    return (a['id'] as String).compareTo(b['id'] as String);
  });
  final out = File('docs/cd-content-analysis.json');
  out.writeAsStringSync(const JsonEncoder.withIndent('  ').convert(rows));
  stdout.writeln('C=${rows.where((r) => r['grade'] == 'C').length}');
  stdout.writeln('D=${rows.where((r) => r['grade'] == 'D').length}');
  stdout.writeln('wrote ${out.path}');
  for (final r in rows.where((r) => r['grade'] == 'D')) {
    stdout.writeln(
      'D\t${r['id']}\t${r['title']}\t${r['category']}\t${r['contentType']}\t${r['reasons']}',
    );
  }
}
