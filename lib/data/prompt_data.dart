import '../models/prompt_template.dart';

/// 복사해 바로 쓸 수 있는 한국어 프롬프트 템플릿.
const List<PromptTemplate> promptTemplates = [
  PromptTemplate(
    id: 'prompt-requirements',
    title: '스마트팜 요구사항 정리',
    category: '요구사항',
    purpose: '목적·범위·성공기준·비범위를 문서로 정리',
    requiredInputs: ['시설유형', '작물또는축종', '예산범위', '인력', '필수감시항목'],
    prompt: '''
당신은 스마트농업 시스템 기획 보조자다. 과장·허위 공식설정값·특정 PLC 제조사 주소를 만들지 마라.
아래 입력을 바탕으로 요구사항 초안을 작성하라.

시설유형: {{시설유형}}
작물/축종: {{작물또는축종}}
예산범위: {{예산범위}}
운영인력: {{인력}}
필수 감시 항목: {{필수감시항목}}

출력 형식:
1) 목적 한 문장
2) 범위 / 비범위
3) 기능 요구 (감시/제어/알람/기록)
4) 비기능 (오프라인, 보안, 가용성)
5) 성공 기준(측정 가능)
6) 위험과 가정
7) 다음 질문 5개
인터넷 단절 시에도 로컬 필수 운전이 가능해야 함을 명시하라.
''',
    replaceItems: ['시설유형', '작물또는축종', '예산범위', '인력', '필수감시항목'],
    doNotGuess: ['공식 적온·적습 수치', '제조사 레지스터 맵', '보장 ROI'],
    preserveFeatures: ['로컬 우선', '교육용 단서'],
    safetyConditions: ['원격 제어는 기본 비범위로 두거나 별도 안전 요구로 분리'],
    checkConditions: ['비범위가 있는가', '성공기준이 측정 가능한가'],
    expectedResult: '1~2페이지 분량 요구사항 초안',
  ),
  PromptTemplate(
    id: 'prompt-site-survey',
    title: '현장조사 체크리스트 생성',
    category: '현장조사',
    purpose: '전원·통신·환경·동선 조사 항목 작성',
    requiredInputs: ['농장주소또는구역', '기존설비목록', '통신환경메모'],
    prompt: '''
스마트팜 현장조사 체크리스트를 작성하라. 입력을 넘어서는 사실 단정 금지.

구역: {{농장주소또는구역}}
기존 설비: {{기존설비목록}}
통신 메모: {{통신환경메모}}

항목을 전원/접지, 배선경로, 수분·분진, 무선음영, 안전, 사진촬영 포인트로 구분해 체크박스 형태로 제시하라.
''',
    replaceItems: ['농장주소또는구역', '기존설비목록', '통신환경메모'],
    doNotGuess: ['실측 거리', '접지저항 값'],
    preserveFeatures: ['사진·메모 칸'],
    safetyConditions: ['활선 작업은 자격자 전제'],
    checkConditions: ['무선과 유선을 모두 점검하는가'],
    expectedResult: '현장조사 체크리스트',
  ),
  PromptTemplate(
    id: 'prompt-sensor-select',
    title: '센서 선정 비교표',
    category: '센서선정',
    purpose: '측정 목적에 맞는 센서 후보 비교',
    requiredInputs: ['측정항목', '설치환경', '통신방식선호', '교정가능여부'],
    prompt: '''
측정항목 {{측정항목}}에 대해 센서 선정 비교표를 만들어라.
환경: {{설치환경}}
통신 선호: {{통신방식선호}}
교정: {{교정가능여부}}

열: 후보유형, 신호방식, 장점, 한계, 설치주의, 유지보수, 확인해야 할 매뉴얼 항목.
특정 브랜드 성능을 단정하거나 가짜 스펙을 만들지 마라. “제조사 데이터시트 확인”을 명시하라.
''',
    replaceItems: ['측정항목', '설치환경', '통신방식선호', '교정가능여부'],
    doNotGuess: ['정확도 수치', '수명 보장'],
    preserveFeatures: ['매뉴얼 확인 열'],
    safetyConditions: ['방폭·내화학 필요 시 별도 표기'],
    checkConditions: ['설치 위치가 포함되는가'],
    expectedResult: '비교표 + 선정 질문',
  ),
  PromptTemplate(
    id: 'prompt-plc-design',
    title: 'PLC 제어 설계 골격',
    category: 'PLC설계',
    purpose: '입출력·모드·인터록 골격 설계',
    requiredInputs: ['제어대상', '입력목록', '출력목록', '수동자동요구'],
    prompt: '''
교육용 PLC 제어 설계 골격을 작성하라. 특정 제조사 주소/명령어를 지어내지 마라.

제어 대상: {{제어대상}}
입력: {{입력목록}}
출력: {{출력목록}}
수동/자동: {{수동자동요구}}

포함: I/O 목록(논리명), 운전모드, 인터록, 실패시 안전측, 알람, 시운전 순서.
레지스터 주소는 “현장 매뉴얼·설정표로 확정”이라고만 적어라.
''',
    replaceItems: ['제어대상', '입력목록', '출력목록', '수동자동요구'],
    doNotGuess: ['PLC 제조사 주소', '래더 니모닉 단정'],
    preserveFeatures: ['수동 우선', '인터록'],
    safetyConditions: ['원격 쓰기 기본 잠금'],
    checkConditions: ['센서고장시 동작이 있는가'],
    expectedResult: '제어 설계 초안',
  ),
  PromptTemplate(
    id: 'prompt-comm-design',
    title: '통신 방식 선정',
    category: '통신',
    purpose: '유선/무선/게이트웨이 선택 근거',
    requiredInputs: ['거리', '데이터량', '전원조건', '필수제어여부'],
    prompt: '''
스마트팜 통신 후보를 비교하라.
거리: {{거리}}
데이터량: {{데이터량}}
전원: {{전원조건}}
필수제어 포함: {{필수제어여부}}

RS-485/Modbus, 이더넷/Modbus TCP, Wi-Fi, LoRa, MQTT 게이트웨이를 표로 비교하고,
무선이 항상 우월하거나 유선이 절대 고장 안 난다는 식의 주장을 하지 마라.
필수 제어는 인터넷 단절 시 로컬 유지 방안을 반드시 포함하라.
''',
    replaceItems: ['거리', '데이터량', '전원조건', '필수제어여부'],
    doNotGuess: ['보장 커버리지 km'],
    preserveFeatures: ['오프라인 로컬'],
    safetyConditions: ['제어망 노출 금지 원칙'],
    checkConditions: ['장애 모드가 있는가'],
    expectedResult: '통신 선정 권고(조건부)',
  ),
  PromptTemplate(
    id: 'prompt-data-model',
    title: '데이터 모델 정의',
    category: '데이터모델',
    purpose: '태그·품질·알람 필드 설계',
    requiredInputs: ['농장ID', '구역목록', '센서유형목록'],
    prompt: '''
아래 필드를 포함한 스마트팜 데이터 모델을 제안하라.
필수 개념 필드: timestamp, farmId, zoneId, deviceId, sensorType, value, unit, quality, alarmState, controlMode, outputState
농장ID: {{농장ID}}
구역: {{구역목록}}
센서유형: {{센서유형목록}}

quality 상태(good/suspect/bad/stale/missing) 의미와 예시 레코드 JSON을 제시하라.
AI 예측값을 곧 PLC 출력으로 쓰지 않도록 모델에 승인/한도 필드를 분리하라.
''',
    replaceItems: ['농장ID', '구역목록', '센서유형목록'],
    doNotGuess: ['실제 장비 ID'],
    preserveFeatures: ['quality', 'controlMode'],
    safetyConditions: ['명령과 측정의 스키마 분리'],
    checkConditions: ['단위 필드가 있는가'],
    expectedResult: '스키마 + 예시 JSON',
  ),
  PromptTemplate(
    id: 'prompt-monitor-ui',
    title: '모니터링 화면 정보구조',
    category: '모니터링화면',
    purpose: '대시보드 IA·상태표시 정의',
    requiredInputs: ['사용자역할', '구역수', '중요알람유형'],
    prompt: '''
스마트팜 모니터링 화면 정보구조를 설계하라.
역할: {{사용자역할}}
구역 수: {{구역수}}
중요 알람: {{중요알람유형}}

포함: 첫 화면 우선순위, 품질/통신상태 표시, 단절 배지, 알람 확인 흐름.
장식용 카드·가짜 KPI로 채우지 말고, 판단에 필요한 정보만 배치하라.
''',
    replaceItems: ['사용자역할', '구역수', '중요알람유형'],
    doNotGuess: ['실제 수확량 KPI'],
    preserveFeatures: ['품질 표시', '단절 배지'],
    safetyConditions: ['위험 알람을 장식보다 위'],
    checkConditions: ['최종수신시각이 보이는가'],
    expectedResult: '화면 목차 + 위젯 목록',
  ),
  PromptTemplate(
    id: 'prompt-flutter-app',
    title: 'Flutter 앱 기능 명세',
    category: 'Flutter앱',
    purpose: '모바일/웹 모니터 앱 기능 목록',
    requiredInputs: ['플랫폼', '오프라인필요', '인증방식'],
    prompt: '''
SotongSmartFarm류 Flutter 앱 기능 명세를 작성하라.
플랫폼: {{플랫폼}}
오프라인: {{오프라인필요}}
인증: {{인증방식}}

에픽: 조회, 알람, 검색, 교육콘텐츠, 설정, (선택) 제어요청.
제어요청이 있으면 승인·인터록·감사로그를 필수 이야기로 넣어라.
비밀키·가짜 Firebase 설정을 코드에 하드코딩하는 예시는 금지.
''',
    replaceItems: ['플랫폼', '오프라인필요', '인증방식'],
    doNotGuess: ['실제 API 키'],
    preserveFeatures: ['오프라인 캐시'],
    safetyConditions: ['기본 읽기 전용'],
    checkConditions: ['권한별 메뉴가 있는가'],
    expectedResult: '유저스토리 목록',
  ),
  PromptTemplate(
    id: 'prompt-mfc',
    title: 'MFC 수집 프로그램 설계',
    category: 'MFC',
    purpose: 'C++/MFC 수집·표시 설계',
    requiredInputs: ['통신종류', '저장방식', '표시주기'],
    prompt: '''
Windows MFC/C++ 데이터 수집 프로그램 설계를 작성하라.
통신: {{통신종류}}
저장: {{저장방식}}
표시 주기: {{표시주기}}

스레드/타이머, 타임아웃, 로그, UI 갱신, 읽기전용 기본값을 포함하라.
Modbus 주소는 예시 플레이스홀더만 쓰고 “매뉴얼 확인”을 명시하라.
''',
    replaceItems: ['통신종류', '저장방식', '표시주기'],
    doNotGuess: ['특정 PLC 주소 맵'],
    preserveFeatures: ['읽기전용 기본'],
    safetyConditions: ['쓰기 메뉴 분리'],
    checkConditions: ['타임아웃 처리가 있는가'],
    expectedResult: '모듈 구조 + 시퀀스',
  ),
  PromptTemplate(
    id: 'prompt-anomaly',
    title: '이상감지 규칙 초안',
    category: '이상감지',
    purpose: '규칙 기반 이상·품질 알람 설계',
    requiredInputs: ['태그목록', '샘플주기', '운영자대응가능시간'],
    prompt: '''
센서 이상감지 규칙 초안을 작성하라. AI 만능을 주장하지 마라.
태그: {{태그목록}}
샘플주기: {{샘플주기}}
대응가능시간: {{운영자대응가능시간}}

규칙: 범위, 변화율, stale, 평탄(고장의심). 각 규칙에 오탐 완화(지속시간)를 넣어라.
자동제어 차단 조건과 “사람 확인” 단계를 명시하라.
''',
    replaceItems: ['태그목록', '샘플주기', '운영자대응가능시간'],
    doNotGuess: ['작물 공식 임계값'],
    preserveFeatures: ['품질 상태'],
    safetyConditions: ['이상 시 자동쓰기 금지 옵션'],
    checkConditions: ['오탐 완화가 있는가'],
    expectedResult: '규칙표',
  ),
  PromptTemplate(
    id: 'prompt-ai-review',
    title: 'AI 도입 타당성 검토',
    category: 'AI검토',
    purpose: '데이터·목적·한계 관점 검토',
    requiredInputs: ['희망AI기능', '보유데이터기간', '라벨유무'],
    prompt: '''
스마트팜 AI 기능 도입 타당성을 검토하라. 효과를 과장하지 마라.
희망 기능: {{희망AI기능}}
데이터 기간: {{보유데이터기간}}
라벨: {{라벨유무}}

출력: 적합한 기법, 필요 데이터품질, 실패 조건, 그림자모드 평가계획,
그리고 “예측→PLC 직접출력” 금지 및 한도·승인·인터록 요구.
''',
    replaceItems: ['희망AI기능', '보유데이터기간', '라벨유무'],
    doNotGuess: ['정확도 % 보장'],
    preserveFeatures: ['그림자 모드'],
    safetyConditions: ['PLC 직접연결 금지'],
    checkConditions: ['데이터 파이프라인 1-14 언급'],
    expectedResult: 'Go/No-Go와 조건부 권고',
  ),
  PromptTemplate(
    id: 'prompt-safety-review',
    title: '안전·보안 검토',
    category: '안전검토',
    purpose: '전기·기계·원격·계정 점검',
    requiredInputs: ['시스템구성요약', '원격제어여부', '외부접속여부'],
    prompt: '''
다음 구성의 안전·보안 검토 체크리스트를 작성하라.
구성: {{시스템구성요약}}
원격제어: {{원격제어여부}}
외부접속: {{외부접속여부}}

문서만 있고 미구현인 항목을 “안전함”으로 표시하지 말고, 구현·시험·훈련 여부를 구분하라.
공식 규정 문구는 출처 확인이 필요하다고 표시하라.
''',
    replaceItems: ['시스템구성요약', '원격제어여부', '외부접속여부'],
    doNotGuess: ['법적 적합 단정'],
    preserveFeatures: ['구현/시험/훈련 구분'],
    safetyConditions: ['비상·로컬수동'],
    checkConditions: ['계정·백업·망분리가 있는가'],
    expectedResult: '위험목록 + 조치',
  ),
  PromptTemplate(
    id: 'prompt-fault-diag',
    title: '고장진단 스크립트',
    category: '고장진단',
    purpose: '통신·센서·제어 이상 진단 순서',
    requiredInputs: ['증상', '최근변경', '관련장비'],
    prompt: '''
현장 고장진단 스크립트를 작성하라.
증상: {{증상}}
최근 변경: {{최근변경}}
장비: {{관련장비}}

물리→링크→프로토콜→애플리케이션 순. 각 단계 합격/불합격 기준과 기록 칸을 둬라.
추측으로 설정값을 바꾸지 말고 백업 후 변경하라고 하라.
''',
    replaceItems: ['증상', '최근변경', '관련장비'],
    doNotGuess: ['원인 단정'],
    preserveFeatures: ['단계적 분리'],
    safetyConditions: ['전원·기계 안전 먼저'],
    checkConditions: ['변경 롤백 방법이 있는가'],
    expectedResult: '진단 절차서',
  ),
  PromptTemplate(
    id: 'prompt-test-plan',
    title: '테스트·시운전 계획',
    category: '테스트',
    purpose: '통합·장애주입 시험 항목',
    requiredInputs: ['기능목록', '안전인터록목록'],
    prompt: '''
시운전/테스트 계획을 작성하라.
기능: {{기능목록}}
인터록: {{안전인터록목록}}

정상 시나리오, 센서고장, 통신단절, 권한거부, 복구 후 동기화를 포함하라.
합격기준을 관측 가능하게 적어라.
''',
    replaceItems: ['기능목록', '안전인터록목록'],
    doNotGuess: ['미정의 설정값'],
    preserveFeatures: ['장애주입'],
    safetyConditions: ['사람·설비 안전 확보 후 시험'],
    checkConditions: ['오프라인 시험이 있는가'],
    expectedResult: '테스트 케이스 표',
  ),
  PromptTemplate(
    id: 'prompt-deploy-ops',
    title: '배포·운영 런북',
    category: '배포운영',
    purpose: '배포, 비밀설정, 모니터링, 롤백',
    requiredInputs: ['호스팅', 'CI경로', '비밀항목목록'],
    prompt: '''
Flutter/Web 스마트팜 앱 배포·운영 런북을 작성하라.
호스팅: {{호스팅}}
CI: {{CI경로}}
비밀항목: {{비밀항목목록}}

포함: 빌드, 환경변수/시크릿(저장소 커밋 금지), 스모크테스트, 롤백, 장애연락.
커밋 해시·버전을 기록하는 배포 체크리스트를 붙여라.
''',
    replaceItems: ['호스팅', 'CI경로', '비밀항목목록'],
    doNotGuess: ['실제 시크릿 값'],
    preserveFeatures: ['롤백', '시크릿 분리'],
    safetyConditions: ['운영 쓰기 키 최소화'],
    checkConditions: ['스모크 테스트가 있는가'],
    expectedResult: '운영 런북',
  ),
  PromptTemplate(
    id: 'prompt-cost-phase',
    title: '단계적 도입 계획',
    category: '요구사항',
    purpose: '모니터링→제어→분석 단계화',
    requiredInputs: ['현재수준', '목표', '제약'],
    prompt: '''
장비를 목적 전에 구매하지 않도록, 단계적 도입 로드맵을 작성하라.
현재: {{현재수준}}
목표: {{목표}}
제약: {{제약}}

1단계 감시, 2단계 안전제어, 3단계 분석/AI권고 순으로 나누고 각 단계 산출물·중단기준을 제시하라.
''',
    replaceItems: ['현재수준', '목표', '제약'],
    doNotGuess: ['투자회수 보장'],
    preserveFeatures: ['목적 선행'],
    safetyConditions: ['2단계에 인터록 필수'],
    checkConditions: ['구매 전 산출물이 있는가'],
    expectedResult: '3단계 로드맵',
  ),
];
