import '../models/project_report.dart';

/// Phase closure quality remediation report (UTF-8).
const ProjectReport currentProjectReport = ProjectReport(
  phase: '3단계 마감 보정(품질·검증 공백 해소)',
  workDate: '2026-07-23',
  changeSummary:
      '핵심 D등급 20개 수동 보강, 콘텐츠 유형별 ContentQualityGrader, '
      '출처/적용 검증상태 분리, needsReview 출처 일부 재분류, '
      'tool Dart 정적분석 복원, /runbooks ListView 최적화, 반응형·품질 테스트 보강. '
      'Firebase Secret·자동배포 인증은 변경하지 않았다.',
  checkResults: [
    'type-aware ContentQualityGrader + unit tests',
    'phaseClosureOverrides 20 IDs to B+',
    'applicationValidationStatus separated from source status',
    'analyzer excludes only tool JS and responsive-results',
    'runbooks ListView.builder + Playwright poll/wait',
    'dart format / analyze / test / web release',
  ],
  commitHash: 'PENDING_AFTER_COMMIT',
  githubActionsUrl: 'https://github.com/jtjeon73-hue/SotongSmartFarm/actions',
  firebaseProjectId: 'sotong-smart-farm',
  liveUrl: 'https://sotong-smart-farm.web.app',
  remainingWork: [
    'manufacturerManualRequired: PLC 주소·RAW·타이머',
    'applicationValidationStatus=fieldValidationRequired 실설비 시험',
    'needsReview 출처의 개별 게시물 URL 연결',
    '잔여 C/D 입문·용어 페이지 선택 보강',
  ],
);
