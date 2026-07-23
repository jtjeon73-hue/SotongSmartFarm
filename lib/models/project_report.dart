class ProjectReport {
  const ProjectReport({
    required this.phase,
    required this.workDate,
    required this.changeSummary,
    required this.checkResults,
    required this.commitHash,
    required this.githubActionsUrl,
    required this.firebaseProjectId,
    required this.liveUrl,
    required this.remainingWork,
  });

  final String phase;
  final String workDate;
  final String changeSummary;
  final List<String> checkResults;
  final String commitHash;
  final String githubActionsUrl;
  final String firebaseProjectId;
  final String liveUrl;
  final List<String> remainingWork;

  String toMarkdown() {
    final checks = checkResults.map((e) => '- $e').join('\n');
    final remaining = remainingWork.map((e) => '- $e').join('\n');
    return '''
# SotongSmartFarm 개발·배포 기록

## 작업 단계
$phase

## 작업 일자
$workDate

## 변경 요약
$changeSummary

## 검사 결과
$checks

## 커밋 해시
$commitHash

## GitHub Actions
$githubActionsUrl

## Firebase Project ID
$firebaseProjectId

## 운영 주소
$liveUrl

## 남은 작업
$remaining
'''
        .trim();
  }
}
