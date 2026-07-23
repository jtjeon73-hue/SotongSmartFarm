import '../models/project_report.dart';

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
  commitHash: '950a446de1022e6c531839fe45aac9eaae53490b',
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
