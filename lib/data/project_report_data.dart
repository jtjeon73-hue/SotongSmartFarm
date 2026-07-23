import '../models/project_report.dart';

/// Phase-2 practical enrichment report.
const ProjectReport currentProjectReport = ProjectReport(
  phase: '2단계 실무 콘텐츠 심화',
  workDate: '2026-07-23',
  changeSummary:
      '핵심 콘텐츠 32개를 실무 심화하고, 계산·시뮬레이터 8종, 체크리스트, '
      '프롬프트 30+ 확장, 목차·공식 복사 UI를 추가했다. '
      'Firebase Secret·자동배포 인증은 재생성하지 않았다.',
  checkResults: [
    'phase2 override 32 IDs enriched',
    'practical_calcs unit tests (4-20mA, CRC, quality, alarm, hysteresis)',
    'dart format / analyze / test / web release',
    'kept existing FIREBASE_SERVICE_ACCOUNT_SOTONG_SMART_FARM secret',
  ],
  commitHash: 'b71a110d59e5338df70788b783b3a29f79dddf52',
  githubActionsUrl: 'https://github.com/jtjeon73-hue/SotongSmartFarm/actions',
  firebaseProjectId: 'sotong-smart-farm',
  liveUrl: 'https://sotong-smart-farm.web.app',
  remainingWork: [
    'fieldValidationRequired field trials',
    'manufacturerManualRequired register/RAW checks',
    'phase3 architecture, model eval, security',
  ],
);
