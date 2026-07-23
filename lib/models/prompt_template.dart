class PromptTemplate {
  const PromptTemplate({
    required this.id,
    required this.title,
    required this.category,
    required this.purpose,
    required this.requiredInputs,
    required this.prompt,
    required this.replaceItems,
    required this.doNotGuess,
    required this.preserveFeatures,
    required this.safetyConditions,
    required this.checkConditions,
    required this.expectedResult,
  });

  final String id;
  final String title;
  final String category;
  final String purpose;
  final List<String> requiredInputs;
  final String prompt;
  final List<String> replaceItems;
  final List<String> doNotGuess;
  final List<String> preserveFeatures;
  final List<String> safetyConditions;
  final List<String> checkConditions;
  final String expectedResult;
}
