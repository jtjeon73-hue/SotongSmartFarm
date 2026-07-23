import '../models/case_study.dart';
import '../models/glossary_term.dart';
import '../models/prompt_template.dart';
import '../models/project_report.dart';
import '../models/smart_farm_content.dart';
import '../models/source_ref.dart';
import 'ai_analytics_data.dart';
import 'case_study_data.dart';
import 'communication_data.dart';
import 'control_plc_data.dart';
import 'farming_environment_data.dart';
import 'glossary_data.dart';
import 'hardware_data.dart';
import 'operations_data.dart';
import 'overview_data.dart';
import 'project_report_data.dart';
import 'prompt_data.dart';
import 'safety_security_data.dart';
import 'sensor_data.dart';
import 'software_data.dart';
import 'source_data.dart';

class ContentCatalog {
  ContentCatalog._();

  static final List<SmartFarmContent> allContents = [
    ...overviewContents,
    ...farmingEnvironmentContents,
    ...sensorContents,
    ...controlPlcContents,
    ...hardwareContents,
    ...communicationContents,
    ...softwareContents,
    ...aiContents,
    ...operationsContents,
    ...safetyContents,
    ...glossaryContents,
  ];

  static final Map<String, SmartFarmContent> _byId = {
    for (final item in allContents) item.id: item,
  };

  static SmartFarmContent? byId(String id) => _byId[id];

  static List<CaseStudy> get cases => caseStudies;

  static CaseStudy? caseById(String id) {
    for (final item in caseStudies) {
      if (item.id == id) return item;
    }
    return null;
  }

  static List<PromptTemplate> get prompts => promptTemplates;

  static List<GlossaryTerm> get terms => glossaryTerms;

  static List<SourceRef> get sources => sourceRefs;

  static SourceRef? sourceById(String id) {
    for (final item in sourceRefs) {
      if (item.id == id) return item;
    }
    return null;
  }

  static ProjectReport get report => currentProjectReport;

  static List<SmartFarmContent> search({
    String query = '',
    Difficulty? difficulty,
    ContentType? contentType,
    FarmType? farmType,
    String? category,
  }) {
    final q = query.trim().toLowerCase();
    return allContents
        .where((item) {
          if (difficulty != null && item.difficulty != difficulty) {
            return false;
          }
          if (contentType != null && item.contentType != contentType) {
            return false;
          }
          if (farmType != null && !item.farmTypes.contains(farmType)) {
            return false;
          }
          if (category != null &&
              category.isNotEmpty &&
              item.category != category) {
            return false;
          }
          if (q.isEmpty) return true;
          return item.searchableText.toLowerCase().contains(q);
        })
        .toList(growable: false);
  }

  static List<String> duplicateIds() {
    final seen = <String>{};
    final dupes = <String>[];
    for (final item in allContents) {
      if (!seen.add(item.id)) dupes.add(item.id);
    }
    for (final item in caseStudies) {
      if (!seen.add(item.id)) dupes.add(item.id);
    }
    for (final item in promptTemplates) {
      if (!seen.add(item.id)) dupes.add(item.id);
    }
    for (final item in glossaryTerms) {
      if (!seen.add(item.id)) dupes.add(item.id);
    }
    for (final item in sourceRefs) {
      if (!seen.add(item.id)) dupes.add(item.id);
    }
    return dupes;
  }

  static List<String> emptyTitles() {
    final bad = <String>[];
    for (final item in allContents) {
      if (item.title.trim().isEmpty || item.summary.trim().isEmpty) {
        bad.add(item.id);
      }
      for (final section in item.sections) {
        if (section.title.trim().isEmpty || section.body.trim().isEmpty) {
          bad.add('${item.id}:${section.title}');
        }
      }
    }
    return bad;
  }

  static List<String> brokenRelatedIds() {
    final bad = <String>[];
    for (final item in allContents) {
      for (final related in item.relatedIds) {
        if (!_byId.containsKey(related) &&
            caseById(related) == null &&
            sourceById(related) == null &&
            !glossaryTerms.any((t) => t.id == related) &&
            !promptTemplates.any((p) => p.id == related)) {
          bad.add('${item.id}->$related');
        }
      }
      for (final sourceId in item.sourceIds) {
        if (sourceById(sourceId) == null) {
          bad.add('${item.id}=>source:$sourceId');
        }
      }
    }
    return bad;
  }
}
