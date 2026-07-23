class GlossaryTerm {
  const GlossaryTerm({
    required this.id,
    required this.term,
    required this.easyExplanation,
    required this.technicalExplanation,
    required this.usageExample,
    required this.relatedTerms,
    required this.fields,
    this.category = '일반',
    this.keywords = const [],
  });

  final String id;
  final String term;
  final String easyExplanation;
  final String technicalExplanation;
  final String usageExample;
  final List<String> relatedTerms;
  final List<String> fields;
  final String category;
  final List<String> keywords;
}
