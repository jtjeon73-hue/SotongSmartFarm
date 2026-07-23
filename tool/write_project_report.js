const fs = require('fs');
const content = `import '../models/project_report.dart';

/// Phase-3 expert deepening report (UTF-8).
const ProjectReport currentProjectReport = ProjectReport(
  phase: '${'\\u0033\\uB2E8\\uACC4 \\uC804\\uBB38\\uAC00 \\uC2EC\\uD654\\u00B7\\uD488\\uC9C8 \\uC644\\uC131'}',
  workDate: '2026-07-23',
  changeSummary:
      '${'\\uC2E4\\uC81C ContentQualityGrader \\uAE30\\uBC18 A/B/C/D \\uBD84\\uC11D, \\uC804\\uBB38\\uAC00 \\uC544\\uD0A4\\uD14D\\uCC98\\u00B7\\uC81C\\uC5B4\\uAC80\\uC99D\\u00B7FMEA\\u00B7'}'
      '${'\\uC548\\uC804\\u00B7\\uBCF4\\uC548\\u00B7AI/MLOps\\u00B7\\uB514\\uC9C0\\uD138\\uD2B8\\uC708\\u00B7\\uC5D0\\uB108\\uC9C0\\u00B7\\uC2E0\\uB8B0\\uC131\\u00B7SLO\\u00B7\\uB85C\\uADF8\\u00B7\\uB7F0\\uBD81\\u00B7FAT/SAT\\u00B7\\uBCC0\\uACBD\\uAD00\\uB9AC '}'
      '${'\\uCF58\\uD150\\uCE20\\uC640 \\uC804\\uBB38\\uAC00 \\uB3C4\\uAD6C 12\\uC885, \\uD504\\uB86C\\uD504\\uD2B8 \\uD655\\uC7A5, \\uCD9C\\uCC98 \\uC815\\uBC00\\uD654, \\uC0AC\\uB840 \\uC2EC\\uD654\\uB97C \\uBC18\\uC601\\uD588\\uB2E4. '}'
      'Firebase Secret\\u00B7\\uC790\\uB3D9\\uBC30\\uD3EC \\uC778\\uC99D\\uC740 \\uC7AC\\uC0DD\\uC131\\uD558\\uC9C0 \\uC54A\\uC558\\uB2E4.',
  checkResults: [
    'ContentQualityGrader \\uAE30\\uC900 \\uB4F1\\uAE09(\\uAE00\\uC790\\uC218 \\uB2E8\\uB3C5 \\uBD80\\uC5EC \\uAE08\\uC9C0)',
    'phase3 expert contents 16 + FMEA/runbook/FAT-SAT/expert-tools/code-examples',
    'expert_calcs unit tests (availability, validity, alarm KPI, confusion, energy, RPN)',
    'dart format / analyze / test / web release',
    '\\uC804\\uCCB4 \\uBC18\\uC751\\uD615 Playwright \\uC7AC\\uAC80\\uC0AC(\\uC8FC\\uC694 \\uACBD\\uB85C)',
    'kept FIREBASE_SERVICE_ACCOUNT_SOTONG_SMART_FARM secret',
  ],
  commitHash: 'PENDING_AFTER_COMMIT',
  githubActionsUrl: 'https://github.com/jtjeon73-hue/SotongSmartFarm/actions',
  firebaseProjectId: 'sotong-smart-farm',
  liveUrl: 'https://sotong-smart-farm.web.app',
  remainingWork: [
    'manufacturerManualRequired: PLC \\uC8FC\\uC18C\\u00B7RAW\\u00B7\\uD0C0\\uC774\\uBA38 \\uD604\\uC7A5 \\uB9E4\\uB274\\uC5BC \\uD655\\uC778',
    'fieldValidationRequired: \\uC2E4\\uC124\\uBE44 FAT/SAT\\u00B7\\uC815\\uC804\\uBCF5\\uAD6C\\u00B7\\uCD95\\uC0AC\\uBE44\\uC0C1\\uD658\\uAE30 \\uC2DC\\uD5D8',
    'AI: \\uC2E4\\uC81C \\uB370\\uC774\\uD130\\uB85C\\uB9CC \\uC9C0\\uD45C \\uC0B0\\uCD9C, \\uB4DC\\uB9AC\\uD504\\uD2B8 \\uBAA8\\uB2C8\\uD130\\uB9C1 \\uC6B4\\uC601 \\uC808\\uCC28 \\uD655\\uC815',
    '\\uBC95\\uB839\\u00B7\\uC804\\uAE30\\uC548\\uC804 \\uC218\\uCE58\\uB294 \\uCD5C\\uC2E0 \\uACF5\\uC2DD\\uC790\\uB8CC \\uD655\\uC778 \\uD6C4 \\uD655\\uC815',
  ],
);
`;

// Decode unicode escapes in Dart string literals by evaluating via JSON for Korean parts.
// Simpler: write decoded UTF-8 Korean directly.
const dart = `import '../models/project_report.dart';

/// Phase-3 expert deepening report (UTF-8).
const ProjectReport currentProjectReport = ProjectReport(
  phase: '3단계 전문가 심화·품질 완성',
  workDate: '2026-07-23',
  changeSummary:
      '실제 ContentQualityGrader 기반 A/B/C/D 분석, 전문가 아키텍처·제어검증·FMEA·'
      '안전·보안·AI/MLOps·디지털트윈·에너지·신뢰성·SLO·로그·런북·FAT/SAT·변경관리 '
      '콘텐츠와 전문가 도구 12종, 프롬프트 확장, 출처 정밀화, 사례 심화를 반영했다. '
      'Firebase Secret·자동배포 인증은 재생성하지 않았다.',
  checkResults: [
    'ContentQualityGrader 기준 등급(글자수 단독 부여 금지)',
    'phase3 expert contents 16 + FMEA/runbook/FAT-SAT/expert-tools/code-examples',
    'expert_calcs unit tests (availability, validity, alarm KPI, confusion, energy, RPN)',
    'dart format / analyze / test / web release',
    '전체 반응형 Playwright 재검사(주요 경로)',
    'kept FIREBASE_SERVICE_ACCOUNT_SOTONG_SMART_FARM secret',
  ],
  commitHash: 'PENDING_AFTER_COMMIT',
  githubActionsUrl: 'https://github.com/jtjeon73-hue/SotongSmartFarm/actions',
  firebaseProjectId: 'sotong-smart-farm',
  liveUrl: 'https://sotong-smart-farm.web.app',
  remainingWork: [
    'manufacturerManualRequired: PLC 주소·RAW·타이머 현장 매뉴얼 확인',
    'fieldValidationRequired: 실설비 FAT/SAT·정전복구·축사비상환기 시험',
    'AI: 실제 데이터로만 지표 산출, 드리프트 모니터링 운영 절차 확정',
    '법령·전기안전 수치는 최신 공식자료 확인 후 확정',
  ],
);
`;
fs.writeFileSync('lib/data/project_report_data.dart', dart, { encoding: 'utf8' });
console.log('ok', Buffer.byteLength(dart, 'utf8'));
