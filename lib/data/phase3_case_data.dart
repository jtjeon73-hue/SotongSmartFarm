import '../models/case_study.dart';
import '../models/smart_farm_content.dart';

/// Phase-3 expert deep-dive overlays for existing educational cases.
const Map<String, Map<String, List<String>>> phase3CaseDeepDive = {
  'case-small-greenhouse-monitor': {
    '요구사항': ['감시 중심', '필수제어는 수동/기존설비 유지', '로컬 저장 우선'],
    '시스템 경계': ['센서~수집기~로컬DB~조회앱', '클라우드 백업은 선택'],
    '아키텍처': ['물리환경→센서→게이트웨이→현장저장→웹'],
    '인터록·안전': ['원격쓰기 비활성', '전기작업은 자격자'],
    '시험': ['교정비교', '의도적 회선차단 후 로컬기록'],
    'KPI': ['데이터유효률', '결측률', '지연'],
    '비용 항목': ['센서', '수집기', '설치', '유지(교정)'],
    '검증 상태': ['educationalExample', 'fieldValidationRequired'],
  },
  'case-temp-fan-control': {
    '요구사항': ['온도기반 팬 자동/수동', 'E-stop·수동우선'],
    '제어 시퀀스': ['조건충족→기동→최소운전→정지', '히스테리시스'],
    '인터록': ['수동우선', '과전류(가능시)', '센서불량시 안전측'],
    '시험': ['정상시작정지', '센서단선', 'E-stop', '정전복구'],
    '보안': ['원격기동은 승인기능 있을 때만'],
    '검증 상태': ['educationalExample', 'manufacturerManualRequired'],
  },
  'case-soil-irrigation': {
    '요구사항': ['수분추세 보조 또는 검증후 자동관수'],
    '인터록': ['최대관수시간', '최소휴지', '센서불량시 자동금지'],
    '시험': ['수동개폐', '타이머상한', '센서불량모의'],
    '검증 상태': ['educationalExample', 'fieldValidationRequired'],
  },
  'case-nutrient-ph-ec': {
    '요구사항': ['pH/EC 감시와 제한적 주입보조'],
    '안전': ['과주입 상한', 'PPE', '누출대응'],
    '시험': ['표준액점검', '주입상한', '밸브피드백불일치'],
    '검증 상태': ['educationalExample', 'fieldValidationRequired'],
  },
  'case-livestock-climate': {
    '요구사항': ['필수환기 로컬유지', '인터넷독립'],
    '안전': ['정전·통신장애시 비상환기', '동물복지 우선'],
    '시험': ['전원차단모의', '팬장애', '원격명령충돌'],
    '검증 상태': ['educationalExample', 'fieldValidationRequired'],
  },
  'case-power-monitor': {
    '요구사항': ['전력·가동시간 감시', '미측정 절감률 표시금지'],
    'KPI': ['kWh/면적', '장비가동률', '데이터유효률'],
    '검증 상태': ['educationalExample'],
  },
  'case-plc-mfc': {
    '요구사항': ['PLC 상태 조회 + MFC/HMI', '쓰기권한 최소화'],
    '통신': ['타임아웃·재연결 상태머신'],
    '보안': ['계정분리', '감사로그'],
    '검증 상태': ['educationalExample', 'manufacturerManualRequired'],
  },
  'case-sensor-fault': {
    '요구사항': ['센서고장 탐지·대체·알람'],
    '진단': ['단선', '고정값', '범위외', '교차검증'],
    '제어': ['자동금지 또는 보수값(문서화)', '수동우선'],
    '검증 상태': ['educationalExample', 'fieldValidationRequired'],
  },
  'case-camera-growth': {
    '요구사항': ['생육 영상 보조분석', '질병 확정 금지'],
    '평가': ['환경별 오탐', '클래스불균형', '현장시범'],
    'AI 안전계층': ['추천→규칙→운영자→기록'],
    '검증 상태': ['educationalExample', 'fieldValidationRequired'],
  },
};

CaseStudy applyPhase3CaseDeepDive(CaseStudy base) {
  final extra = phase3CaseDeepDive[base.id];
  if (extra == null) return base;
  return CaseStudy(
    id: base.id,
    title: base.title,
    purpose: base.purpose,
    targetFarm: base.targetFarm,
    sensors: base.sensors,
    controllers: base.controllers,
    communication: base.communication,
    software: base.software,
    dataFlow: base.dataFlow,
    basicControl: base.basicControl,
    risks: base.risks,
    expectedFailures: base.expectedFailures,
    verification: base.verification,
    extensions: base.extensions,
    difficulty: Difficulty.practical,
    farmTypes: base.farmTypes,
    relatedIds: base.relatedIds,
    keywords: base.keywords,
    isEducational: base.isEducational,
    expertDeepDive: extra,
  );
}
