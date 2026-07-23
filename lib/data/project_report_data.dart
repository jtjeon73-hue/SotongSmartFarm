import '../models/project_report.dart';

/// 현재 개발·배포 기록(1단계 기반 구축).
const ProjectReport currentProjectReport = ProjectReport(
  phase: '1단계 기반 구축',
  workDate: '2026-07-23',
  changeSummary:
      'Flutter Web 기반 SotongSmartFarm 1단계: 전체 메뉴·라우트, 입문·기초 콘텐츠, '
      '검색·필터, 교육용 사례, 프롬프트 라이브러리, 개발·배포 기록 복사, '
      'Firebase Hosting·GitHub Actions 기반을 구축했다. '
      'AI 결과와 제어 명령을 구분하고 수동·인터록·비상정지를 함께 설명한다.',
  checkResults: [
    'dart format / flutter analyze / flutter test 통과',
    '메뉴 contentId와 콘텐츠 데이터 연결 확인',
    '중복 ID·빈 본문·관련/출처 ID 검사',
    '교육용 사례 10건, 프롬프트 15건 이상, 용어 24건 이상',
    '시크릿·서비스계정 JSON을 Git에 포함하지 않음',
  ],
  commitHash: 'f0f05c31cb8e9aa8988dc2c5a61e6d90ec9a22a9',
  githubActionsUrl: 'https://github.com/jtjeon73-hue/SotongSmartFarm/actions',
  firebaseProjectId: 'sotong-smart-farm',
  liveUrl: 'https://sotong-smart-farm.web.app',
  remainingWork: [
    '2단계: 실무 심화 콘텐츠·고장진단 절차·데이터 품질 실무 예시',
    '3단계: 전문가 분석 예제·모델 평가·공식 출처 verified 확대',
    '출처 URL 주기 재확인(needsReview/versionDependent)',
    '반응형: Flutter Canvas 한계로 DOM 기반 메뉴/복사 토스트 자동검증은 수동·스크린샷 보완',
  ],
);
