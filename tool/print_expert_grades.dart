import 'package:sotong_smart_farm/core/quality/content_quality_grader.dart';
import 'package:sotong_smart_farm/data/content_catalog.dart';

void main() {
  for (final c in ContentCatalog.phase3ExpertPages) {
    final g = ContentQualityGrader.grade(c);
    print('${c.id} ${g.grade} matched=${g.matchedCriteria.length}');
  }
  var phase2A = 0, phase2B = 0, phase2C = 0, phase2D = 0;
  for (final id in ContentCatalog.phase2EnrichedIds) {
    final c = ContentCatalog.byId(id)!;
    switch (ContentQualityGrader.grade(c).grade) {
      case 'A':
        phase2A++;
      case 'B':
        phase2B++;
      case 'C':
        phase2C++;
      case 'D':
        phase2D++;
    }
  }
  print('PHASE2_GRADES A=$phase2A B=$phase2B C=$phase2C D=$phase2D');
}
