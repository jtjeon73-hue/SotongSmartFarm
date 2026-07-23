// ignore_for_file: avoid_print

import 'package:sotong_smart_farm/core/quality/content_quality_grader.dart';
import 'package:sotong_smart_farm/data/content_catalog.dart';

void main() {
  for (final c in ContentCatalog.phase3ExpertPages) {
    final g = ContentQualityGrader.grade(c);
    print('${c.id} ${g.grade} matched=${g.matchedCriteria.length}');
  }
}
