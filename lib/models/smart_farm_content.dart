enum Difficulty {
  beginner,
  basic,
  practical,
  expert;

  String get label {
    switch (this) {
      case Difficulty.beginner:
        return '입문';
      case Difficulty.basic:
        return '기초';
      case Difficulty.practical:
        return '실무';
      case Difficulty.expert:
        return '전문가';
    }
  }
}

enum ContentType {
  concept,
  technology,
  procedure,
  caseStudy,
  checklist,
  troubleshooting,
  glossary,
  officialSource;

  String get label {
    switch (this) {
      case ContentType.concept:
        return '개념';
      case ContentType.technology:
        return '기술';
      case ContentType.procedure:
        return '절차';
      case ContentType.caseStudy:
        return '사례';
      case ContentType.checklist:
        return '체크리스트';
      case ContentType.troubleshooting:
        return '고장진단';
      case ContentType.glossary:
        return '용어';
      case ContentType.officialSource:
        return '공식자료';
    }
  }
}

enum FarmType {
  greenhouse,
  openField,
  orchard,
  hydroponics,
  mushroom,
  livestock,
  storage,
  general;

  String get label {
    switch (this) {
      case FarmType.greenhouse:
        return '시설원예';
      case FarmType.openField:
        return '노지';
      case FarmType.orchard:
        return '과수';
      case FarmType.hydroponics:
        return '수경재배';
      case FarmType.mushroom:
        return '버섯';
      case FarmType.livestock:
        return '축산';
      case FarmType.storage:
        return '저장·선별';
      case FarmType.general:
        return '공통';
    }
  }
}

enum VerificationStatus {
  verified,
  versionDependent,
  needsReview,
  manufacturerManualRequired,

  /// Deprecated on sources. On legacy content rows, catalog maps this to
  /// [ApplicationValidationStatus.fieldValidationRequired].
  fieldValidationRequired,
  educationalExample;

  String get label {
    switch (this) {
      case VerificationStatus.verified:
        return 'verified';
      case VerificationStatus.versionDependent:
        return 'versionDependent';
      case VerificationStatus.needsReview:
        return 'needsReview';
      case VerificationStatus.manufacturerManualRequired:
        return 'manufacturerManualRequired';
      case VerificationStatus.fieldValidationRequired:
        return 'fieldValidationRequired(legacy)';
      case VerificationStatus.educationalExample:
        return 'educationalExample';
    }
  }
}

/// How the *content application* was validated (separate from source status).
enum ApplicationValidationStatus {
  notApplicable,
  deskReviewed,
  calculationValidated,
  compileValidated,
  labValidationRequired,
  fieldValidationRequired,
  fieldValidated;

  String get label {
    switch (this) {
      case ApplicationValidationStatus.notApplicable:
        return 'notApplicable';
      case ApplicationValidationStatus.deskReviewed:
        return 'deskReviewed';
      case ApplicationValidationStatus.calculationValidated:
        return 'calculationValidated';
      case ApplicationValidationStatus.compileValidated:
        return 'compileValidated';
      case ApplicationValidationStatus.labValidationRequired:
        return 'labValidationRequired';
      case ApplicationValidationStatus.fieldValidationRequired:
        return 'fieldValidationRequired';
      case ApplicationValidationStatus.fieldValidated:
        return 'fieldValidated';
    }
  }
}

enum SectionKind {
  normal,
  important,
  safety,
  fieldCheck,
  expertNote,
  flow,
  practical,
  caution,
  danger,
  manufacturer,
  fieldValidation,
}

class ContentSection {
  const ContentSection({
    required this.title,
    required this.body,
    this.bullets = const [],
    this.kind = SectionKind.normal,
    this.copyText,
    this.codeLanguage,
  });

  final String title;
  final String body;
  final List<String> bullets;
  final SectionKind kind;

  /// Optional formula/code/procedure text for one-tap copy.
  final String? copyText;
  final String? codeLanguage;
}

class SmartFarmContent {
  const SmartFarmContent({
    required this.id,
    required this.title,
    required this.summary,
    required this.category,
    required this.difficulty,
    required this.contentType,
    this.farmTypes = const [FarmType.general],
    this.sections = const [],
    this.keywords = const [],
    this.relatedIds = const [],
    this.sourceIds = const [],
    this.verificationStatus = VerificationStatus.educationalExample,
    this.applicationValidationStatus = ApplicationValidationStatus.deskReviewed,
    this.checkedAt,
    this.qualityGrade,
    this.tocTitles = const [],
  });

  final String id;
  final String title;
  final String summary;
  final String category;
  final Difficulty difficulty;
  final ContentType contentType;
  final List<FarmType> farmTypes;
  final List<ContentSection> sections;
  final List<String> keywords;
  final List<String> relatedIds;
  final List<String> sourceIds;
  final VerificationStatus verificationStatus;

  /// Application/field validation — not the same as sourceVerificationStatus.
  final ApplicationValidationStatus applicationValidationStatus;
  final String? checkedAt;

  /// Optional phase-2 editorial grade: A/B/C/D.
  final String? qualityGrade;
  final List<String> tocTitles;

  String get searchableText {
    final buffer = StringBuffer()
      ..write(title)
      ..write(' ')
      ..write(summary)
      ..write(' ')
      ..write(keywords.join(' '));
    for (final section in sections) {
      buffer
        ..write(' ')
        ..write(section.title)
        ..write(' ')
        ..write(section.body)
        ..write(' ')
        ..write(section.bullets.join(' '));
      if (section.copyText != null) {
        buffer
          ..write(' ')
          ..write(section.copyText);
      }
    }
    return buffer.toString();
  }

  /// Normalize legacy verificationStatus.fieldValidationRequired onto application.
  SmartFarmContent normalizedValidation() {
    if (verificationStatus != VerificationStatus.fieldValidationRequired) {
      return this;
    }
    return SmartFarmContent(
      id: id,
      title: title,
      summary: summary,
      category: category,
      difficulty: difficulty,
      contentType: contentType,
      farmTypes: farmTypes,
      sections: sections,
      keywords: keywords,
      relatedIds: relatedIds,
      sourceIds: sourceIds,
      verificationStatus: VerificationStatus.educationalExample,
      applicationValidationStatus:
          ApplicationValidationStatus.fieldValidationRequired,
      checkedAt: checkedAt,
      qualityGrade: qualityGrade,
      tocTitles: tocTitles,
    );
  }
}
