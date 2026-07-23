// ignore_for_file: avoid_print

import 'package:sotong_smart_farm/core/quality/content_quality_grader.dart';
import 'package:sotong_smart_farm/data/content_catalog.dart';
import 'package:sotong_smart_farm/models/smart_farm_content.dart';

void main() {
  final grades = ContentQualityGrader.summarize(ContentCatalog.allContents);
  print('TOTAL=${ContentCatalog.allContents.length}');
  print('A=${grades['A']} B=${grades['B']} C=${grades['C']} D=${grades['D']}');
  print('CLOSURE=${ContentCatalog.phaseClosureEnrichedCount}');
  print('FIELD_APP=${ContentCatalog.fieldValidationRequiredContentCount}');
  final apps = ContentCatalog.applicationValidationCounts();
  for (final e in apps.entries) {
    print('APP_${e.key.name}=${e.value}');
  }
  final src = <VerificationStatus, int>{};
  for (final s in ContentCatalog.sources) {
    src[s.status] = (src[s.status] ?? 0) + 1;
  }
  for (final e in src.entries) {
    print('SRC_${e.key.name}=${e.value}');
  }
  print('CLOSURE_IDS=${ContentCatalog.phaseClosureEnrichedIds.join(',')}');
  for (final id in ContentCatalog.phaseClosureEnrichedIds) {
    final c = ContentCatalog.byId(id)!;
    final g = ContentQualityGrader.grade(c);
    print('ENRICHED $id ${g.grade} missing=${g.missingCriteria.join('|')}');
  }
}
