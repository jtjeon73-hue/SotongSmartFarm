import 'smart_farm_content.dart';

class SourceRef {
  const SourceRef({
    required this.id,
    required this.organization,
    required this.title,
    required this.url,
    required this.confirmedContent,
    required this.yearOrVersion,
    required this.checkedAt,
    required this.status,
  });

  final String id;
  final String organization;
  final String title;
  final String url;
  final String confirmedContent;
  final String yearOrVersion;
  final String checkedAt;
  final VerificationStatus status;
}
