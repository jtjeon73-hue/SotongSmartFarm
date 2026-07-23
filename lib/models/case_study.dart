import 'smart_farm_content.dart';

class CaseStudy {
  const CaseStudy({
    required this.id,
    required this.title,
    required this.purpose,
    required this.targetFarm,
    required this.sensors,
    required this.controllers,
    required this.communication,
    required this.software,
    required this.dataFlow,
    required this.basicControl,
    required this.risks,
    required this.expectedFailures,
    required this.verification,
    required this.extensions,
    this.difficulty = Difficulty.basic,
    this.farmTypes = const [FarmType.greenhouse],
    this.relatedIds = const [],
    this.keywords = const [],
    this.isEducational = true,
    this.expertDeepDive = const {},
  });

  final String id;
  final String title;
  final String purpose;
  final String targetFarm;
  final List<String> sensors;
  final List<String> controllers;
  final List<String> communication;
  final List<String> software;
  final List<String> dataFlow;
  final List<String> basicControl;
  final List<String> risks;
  final List<String> expectedFailures;
  final List<String> verification;
  final List<String> extensions;
  final Difficulty difficulty;
  final List<FarmType> farmTypes;
  final List<String> relatedIds;
  final List<String> keywords;
  final bool isEducational;

  /// Optional expert sections: title -> bullet list (educational design).
  final Map<String, List<String>> expertDeepDive;
}
