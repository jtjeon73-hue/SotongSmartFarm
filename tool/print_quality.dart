import 'package:sotong_smart_farm/core/quality/content_quality_grader.dart';
import 'package:sotong_smart_farm/data/content_catalog.dart';
import 'package:sotong_smart_farm/data/phase3_report_builder.dart';
import 'package:sotong_smart_farm/models/smart_farm_content.dart';

void main() {
  final grades = ContentQualityGrader.summarize(ContentCatalog.allContents);
  final sources = countSourceStatuses();
  print('TOTAL_CONTENTS=${ContentCatalog.allContents.length}');
  print('A=${grades['A']} B=${grades['B']} C=${grades['C']} D=${grades['D']}');
  print('PHASE2=${ContentCatalog.phase2EnrichedCount}');
  print('PHASE3_EXPERT=${ContentCatalog.phase3ExpertCount}');
  print('PROMPTS=${ContentCatalog.prompts.length}');
  print('FMEA=${ContentCatalog.fmeaRows.length}');
  print('RUNBOOKS=${ContentCatalog.runbooks.length}');
  print('FATSAT=${ContentCatalog.fatSatItems.length}');
  print('CASES=${ContentCatalog.cases.length}');
  print('SOURCES=${ContentCatalog.sources.length}');
  for (final s in VerificationStatus.values) {
    print('SRC_${s.name}=${sources[s] ?? 0}');
  }

  // Sample manual review candidates (A and D extremes)
  final graded = ContentCatalog.allContents
      .map(ContentQualityGrader.grade)
      .toList();
  final aSamples = graded.where((g) => g.grade == 'A').take(5).map((g) => g.id);
  final dSamples = graded.where((g) => g.grade == 'D').take(5).map((g) => g.id);
  print('A_SAMPLES=${aSamples.join(',')}');
  print('D_SAMPLES=${dSamples.join(',')}');
}
