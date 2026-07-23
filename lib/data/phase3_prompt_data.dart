import '../models/prompt_template.dart';

/// Phase-3 expert prompts (do not invent PLC addresses, crop setpoints, or accuracy %).
const List<PromptTemplate> phase3PromptTemplates = [
  PromptTemplate(
    id: 'prompt-arch-review',
    title: '스마트팜 아키텍처 검토',
    category: '아키텍처',
    purpose: '계층별 역할·장애영향·책임경계를 검토',
    requiredInputs: ['시설규모', '계층요약', '필수안전기능', '인터넷의존도메모'],
    prompt: '''
당신은 스마트팜 아키텍처 검토 보조자다. PLC 주소·작물 설정값·정확도 %를 추측하지 마라.

시설규모: {{시설규모}}
계층요약: {{계층요약}}
필수안전기능: {{필수안전기능}}
인터넷의존도: {{인터넷의존도메모}}

출력:
1) 13계층(물리~운영감사) 대응표
2) 소형/중형/다농장 적합도
3) 단일장애점과 로컬 독립운전 여부
4) 확인 필요 매뉴얼·현장항목
5) 롤백·개선 우선순위
없는 정보는 "현장/제조사 확인 필요"로 남겨라.
''',
    replaceItems: ['시설규모', '계층요약', '필수안전기능', '인터넷의존도메모'],
    doNotGuess: ['PLC 주소', '작물 적온·적습', '센서 정확도 %'],
    preserveFeatures: ['로컬 안전 우선', '교육용 표시'],
    safetyConditions: ['비상정지·인터록은 클라우드 독립'],
    checkConditions: ['계층별 책임경계가 있는가', '인터넷 단절 시 최소운전이 있는가'],
    expectedResult: '아키텍처 검토 메모',
  ),
  PromptTemplate(
    id: 'prompt-edge-cloud',
    title: 'Edge·Cloud 배치 판단',
    category: '아키텍처',
    purpose: '기능별 Edge/Gateway/Cloud 배치표 작성',
    requiredInputs: ['기능목록', '응답시간요구', '안전등급메모', '네트워크가용성'],
    prompt: '''
기능 배치 판단표를 작성하라. 주소·설정값·정확도를 지어내지 마라.

기능: {{기능목록}}
응답시간: {{응답시간요구}}
안전메모: {{안전등급메모}}
네트워크: {{네트워크가용성}}

열: 기능, 권장위치(Edge/GW/Cloud), 근거, 네트워크의존, 장애시동작, 확인항목.
E-stop·인터록은 현장 유지를 기본으로 하라.
''',
    replaceItems: ['기능목록', '응답시간요구', '안전등급메모', '네트워크가용성'],
    doNotGuess: ['PLC 레지스터', '작물 setpoint', '모델 정확도'],
    preserveFeatures: ['안전 로컬우선'],
    safetyConditions: ['원격만으로 안전정지 대체 금지'],
    checkConditions: ['각 기능의 장애시 동작이 있는가'],
    expectedResult: '배치 판단표',
  ),
  PromptTemplate(
    id: 'prompt-plc-review',
    title: 'PLC 로직 리뷰',
    category: 'PLC설계',
    purpose: '모드·인터록·타임아웃·피드백 리뷰 체크',
    requiredInputs: ['로직요약또는의사코드', '모드목록', '인터록목록', '피드백목록'],
    prompt: '''
교육용 PLC 로직 리뷰 체크리스트를 작성하라. 제조사 주소·니모닉을 단정하지 마라.

로직요약: {{로직요약또는의사코드}}
모드: {{모드목록}}
인터록: {{인터록목록}}
피드백: {{피드백목록}}

점검: 수동우선, permissive/trip, timeout, watchdog, 센서장애, 통신장애, 정전복구, 원격쓰기잠금.
주소는 "현장 설정표로 확정"만 적어라.
''',
    replaceItems: ['로직요약또는의사코드', '모드목록', '인터록목록', '피드백목록'],
    doNotGuess: ['PLC 주소', '타이머 확정초', '작물 임계값'],
    preserveFeatures: ['manufacturerReviewRequired'],
    safetyConditions: ['E-stop은 SW만으로 대체 금지'],
    checkConditions: ['피드백 타임아웃이 있는가', '원격이 수동을 덮지 않는가'],
    expectedResult: 'PLC 리뷰 체크리스트',
  ),
  PromptTemplate(
    id: 'prompt-control-stability',
    title: '제어 안정성 검토',
    category: '안전검토',
    purpose: 'debounce·hysteresis·min on/off·bumpless 검토',
    requiredInputs: ['제어루프목록', '관측불안정증상', '운전모드'],
    prompt: '''
제어 안정성 검토표를 작성하라. 게인·적온·정확도를 추측하지 마라.

루프: {{제어루프목록}}
증상: {{관측불안정증상}}
모드: {{운전모드}}

포함: debounce, hysteresis, minimum on/off, retry, fail-safe, bumpless transfer, 수동개입.
수치 확정은 "현장 튜닝·시험 필요"로 남겨라.
''',
    replaceItems: ['제어루프목록', '관측불안정증상', '운전모드'],
    doNotGuess: ['PID 게인', '작물 설정값', '정확도 %'],
    preserveFeatures: ['현장튜닝필요'],
    safetyConditions: ['불안정 시 자동→수동 전환 경로'],
    checkConditions: ['최소운전/정지시간이 있는가'],
    expectedResult: '안정성 검토표',
  ),
  PromptTemplate(
    id: 'prompt-fmea',
    title: 'FMEA 초안 작성',
    category: '안전검토',
    purpose: '교육용 FMEA 행 초안 생성',
    requiredInputs: ['설비목록', '운전환경', '현재보호대책메모'],
    prompt: '''
교육용 FMEA 표를 작성하라. 점수는 절대 안전판정이 아님을 명시하라.

설비: {{설비목록}}
환경: {{운전환경}}
현재대책: {{현재보호대책메모}}

열: 고장형태, 원인, 영향, 검출, 현재통제, S/O/D(1-10 교육용), 조치, 역할, 검증, 잔여위험.
PLC 주소·작물 setpoint·정확도를 만들지 마라.
''',
    replaceItems: ['설비목록', '운전환경', '현재보호대책메모'],
    doNotGuess: ['법적 SIL', '절대 RPN 임계', 'PLC 주소'],
    preserveFeatures: ['교육용점수표시'],
    safetyConditions: ['조직·현장별 재평가 필요'],
    checkConditions: ['잔여위험이 있는가', '검증방법이 있는가'],
    expectedResult: 'FMEA 초안 표',
  ),
  PromptTemplate(
    id: 'prompt-interlock-matrix',
    title: '인터록 매트릭스',
    category: '안전검토',
    purpose: '모드×명령 허용/금지 매트릭스',
    requiredInputs: ['모드목록', '명령목록', '위험시나리오'],
    prompt: '''
모드×명령 인터록 매트릭스를 만들어라. 주소·설정값을 지어내지 마라.

모드: {{모드목록}}
명령: {{명령목록}}
위험: {{위험시나리오}}

셀: 허용/조건부/금지 + 근거. 원격이 E-stop·현장수동을 덮지 못하게 하라.
''',
    replaceItems: ['모드목록', '명령목록', '위험시나리오'],
    doNotGuess: ['SIL 등급', 'PLC 주소', '작물 임계값'],
    preserveFeatures: ['모드별금지명령'],
    safetyConditions: ['하드웨어 인터록 검토 표시'],
    checkConditions: ['비상모드 복귀조건이 있는가'],
    expectedResult: '인터록 매트릭스',
  ),
  PromptTemplate(
    id: 'prompt-fat-sat',
    title: 'FAT·SAT 시험표',
    category: '테스트',
    purpose: '공장·현장 인수시험 템플릿 생성',
    requiredInputs: ['시험범위', '요구사항목록', '가용장비메모'],
    prompt: '''
FAT/SAT 시험표를 작성하라. 합격으로 표시하지 마라. 주소·설정값·정확도를 추측하지 마라.

범위: {{시험범위}}
요구: {{요구사항목록}}
장비메모: {{가용장비메모}}

필드: ID, 단계(FAT|SAT), 요구, 사전조건, 절차, 예상, 증거힌트, 실제결과(공란), 판정(미실시).
''',
    replaceItems: ['시험범위', '요구사항목록', '가용장비메모'],
    doNotGuess: ['합격 단정', 'PLC 주소', '정확도 %'],
    preserveFeatures: ['미실시표시'],
    safetyConditions: ['사람·설비 안전 확보 후 시험'],
    checkConditions: ['증거힌트가 있는가', '재시험칸이 있는가'],
    expectedResult: 'FAT·SAT 템플릿',
  ),
  PromptTemplate(
    id: 'prompt-ics-threat',
    title: '산업제어 위협 모델',
    category: '보안',
    purpose: '보호대상·위협·대책 매핑',
    requiredInputs: ['자산목록', '원격접속여부', '계정관리메모'],
    prompt: '''
스마트팜 ICS 위협 모델 표를 작성하라. 인증 충족을 주장하지 마라. 시크릿·주소를 만들지 마라.

자산: {{자산목록}}
원격: {{원격접속여부}}
계정메모: {{계정관리메모}}

열: 자산, 위협, 영향, 대책, 로컬비상운전, 확인항목.
IEC 62443은 개념 방향만 언급하라.
''',
    replaceItems: ['자산목록', '원격접속여부', '계정관리메모'],
    doNotGuess: ['법적 적합 단정', '실제 비밀번호', 'PLC 주소'],
    preserveFeatures: ['로컬비상운전'],
    safetyConditions: ['제어망 인터넷 직접노출 금지 원칙'],
    checkConditions: ['계정수명주기가 있는가'],
    expectedResult: '위협 모델 표',
  ),
  PromptTemplate(
    id: 'prompt-net-seg',
    title: '네트워크 분리 설계',
    category: '보안',
    purpose: '제어/운영/게스트 구역 분리안',
    requiredInputs: ['현재토폴로지메모', '원격필요기능', '무선사용여부'],
    prompt: '''
네트워크 구역 분리 초안을 작성하라. IP·VLAN ID·비밀번호를 지어내지 마라.

토폴로지: {{현재토폴로지메모}}
원격기능: {{원격필요기능}}
무선: {{무선사용여부}}

출력: 구역도(논리), 허용흐름, 차단원칙, VPN/방화벽 확인항목, 장애시 로컬운전.
''',
    replaceItems: ['현재토폴로지메모', '원격필요기능', '무선사용여부'],
    doNotGuess: ['실제 IP/VLAN', '방화벽 규칙 단정', 'PLC 주소'],
    preserveFeatures: ['최소권한'],
    safetyConditions: ['제어망과 사무망 혼용 금지 권고'],
    checkConditions: ['원격은 승인경로를 거치는가'],
    expectedResult: '망분리 초안',
  ),
  PromptTemplate(
    id: 'prompt-ai-leakage',
    title: 'AI 데이터 누수 검토',
    category: 'AI활용검토',
    purpose: '학습·평가 분할과 누수 위험 점검',
    requiredInputs: ['문제유형', '데이터기간', '분할방법메모'],
    prompt: '''
AI 데이터 누수 검토 체크리스트를 작성하라. 정확도 %를 만들지 마라.

문제: {{문제유형}}
기간: {{데이터기간}}
분할메모: {{분할방법메모}}

점검: 시간순분할, 동일시점특징누수, 라벨누수, 센서교정변경, 농장간누수, 카메라동일장면.
''',
    replaceItems: ['문제유형', '데이터기간', '분할방법메모'],
    doNotGuess: ['정확도 %', '작물 setpoint', 'PLC 주소'],
    preserveFeatures: ['실험전제명시'],
    safetyConditions: ['AI 결과를 PLC에 직결하지 말 것'],
    checkConditions: ['학습·검증·시험 분리가 있는가'],
    expectedResult: '누수 검토 체크',
  ),
  PromptTemplate(
    id: 'prompt-model-eval',
    title: '모델 평가 설계',
    category: 'AI활용검토',
    purpose: '회귀·분류·영상 평가 계획',
    requiredInputs: ['과제유형', '기준모델', '비용비대칭메모'],
    prompt: '''
모델 평가 계획을 작성하라. 실험 없이 성능수치를 지어내지 마라.

과제: {{과제유형}}
기준모델: {{기준모델}}
비용메모: {{비용비대칭메모}}

포함: 지표선택, 혼동행렬/오차분포, 계절·구역별, 현장시범, 중단·롤백조건.
''',
    replaceItems: ['과제유형', '기준모델', '비용비대칭메모'],
    doNotGuess: ['정확도 %', 'F1 보장', '작물 임계값'],
    preserveFeatures: ['기준모델비교'],
    safetyConditions: ['미탐비용이 큰 알람은 사람검토'],
    checkConditions: ['오탐·미탐 비용이 구분되는가'],
    expectedResult: '평가 계획서',
  ),
  PromptTemplate(
    id: 'prompt-drift',
    title: '드리프트 모니터링',
    category: 'AI활용검토',
    purpose: '입력·개념 드리프트 감시 항목',
    requiredInputs: ['모델용도', '입력특징목록', '재학습트리거후보'],
    prompt: '''
드리프트 모니터링 표를 작성하라. 임계값·정확도를 단정하지 마라.

용도: {{모델용도}}
특징: {{입력특징목록}}
트리거후보: {{재학습트리거후보}}

열: 드리프트유형, 감지신호, 운영자행동, 롤백조건, 기록필드.
센서교체·교정·계절·작물변경을 포함하라.
''',
    replaceItems: ['모델용도', '입력특징목록', '재학습트리거후보'],
    doNotGuess: ['확정 임계값', '정확도 %', 'PLC 주소'],
    preserveFeatures: ['모델버전기록'],
    safetyConditions: ['성능저하 시 자동제어 축소'],
    checkConditions: ['롤백 모델이 지정되는가'],
    expectedResult: '드리프트 감시표',
  ),
  PromptTemplate(
    id: 'prompt-anomaly-threshold',
    title: '이상탐지 임계값 설계',
    category: 'AI활용검토',
    purpose: '오탐·미탐 균형과 운영 절차',
    requiredInputs: ['감시신호', '운영대응가능시간', '과거알람메모'],
    prompt: '''
이상탐지 임계값 설계 메모를 작성하라. 수치를 임의 확정하지 마라.

신호: {{감시신호}}
대응시간: {{운영대응가능시간}}
과거알람: {{과거알람메모}}

포함: 기준모델, 임계탐색방법, 오탐비용, 미탐비용, 사람승인, PLC직결금지.
''',
    replaceItems: ['감시신호', '운영대응가능시간', '과거알람메모'],
    doNotGuess: ['확정 임계', '정확도 %', '작물 공식값'],
    preserveFeatures: ['현장시범필요'],
    safetyConditions: ['생명·설비위험은 규칙기반 우선'],
    checkConditions: ['임계 변경 감사로그가 있는가'],
    expectedResult: '임계값 설계 메모',
  ),
  PromptTemplate(
    id: 'prompt-ops-kpi',
    title: '운영 KPI·SLO 초안',
    category: '배포운영',
    purpose: '정의·계산식·담당행동 KPI 초안',
    requiredInputs: ['농장중요도메모', '가용데이터원', '운영인력'],
    prompt: '''
운영 KPI 초안을 작성하라. 근거 없는 SLO 수치를 확정하지 마라.

중요도: {{농장중요도메모}}
데이터원: {{가용데이터원}}
인력: {{운영인력}}

각 지표: 정의, 계산식, 출처, 주기, 경고설정방법, 행동, 한계.
''',
    replaceItems: ['농장중요도메모', '가용데이터원', '운영인력'],
    doNotGuess: ['확정 SLO %', '보장 MTTR', '정확도 %'],
    preserveFeatures: ['현장맞춤목표'],
    safetyConditions: ['안전알람 KPI를 장식지표보다 우선'],
    checkConditions: ['담당자 행동이 있는가'],
    expectedResult: 'KPI 초안',
  ),
  PromptTemplate(
    id: 'prompt-runbook',
    title: '장애 런북 작성',
    category: '고장진단',
    purpose: '12단계 런북 초안',
    requiredInputs: ['증상', '영향범위', '관련설비'],
    prompt: '''
장애 런북을 12단계로 작성하라. 원인을 단정하거나 주소를 만들지 마라.

증상: {{증상}}
영향: {{영향범위}}
설비: {{관련설비}}

단계: 1증상 2영향 3안전조치 4즉시확인 5로그보존 6진단 7임시복구 8정상복구 9확인시험 10보고 11근본원인 12재발방지
''',
    replaceItems: ['증상', '영향범위', '관련설비'],
    doNotGuess: ['원인 단정', 'PLC 주소', '작물 setpoint'],
    preserveFeatures: ['안전조치우선'],
    safetyConditions: ['전원·기계 안전 먼저'],
    checkConditions: ['증거보존이 있는가', '재발방지가 있는가'],
    expectedResult: '12단계 런북',
  ),
  PromptTemplate(
    id: 'prompt-rca',
    title: '근본원인 분석',
    category: '고장진단',
    purpose: '5Why·타임라인 RCA 템플릿',
    requiredInputs: ['사건요약', '타임라인메모', '변경이력메모'],
    prompt: '''
근본원인 분석 템플릿을 채워라. 추측 단정 금지. 주소·설정값 창작 금지.

사건: {{사건요약}}
타임라인: {{타임라인메모}}
변경이력: {{변경이력메모}}

출력: 사실/가정 구분, 5Why, 기여요인, 교정조치, 예방조치, 검증계획.
''',
    replaceItems: ['사건요약', '타임라인메모', '변경이력메모'],
    doNotGuess: ['원인 단정', 'PLC 주소', '정확도 %'],
    preserveFeatures: ['사실가정구분'],
    safetyConditions: ['재가동 전 안전확인'],
    checkConditions: ['재발방지 조치가 검증가능한가'],
    expectedResult: 'RCA 보고서 초안',
  ),
  PromptTemplate(
    id: 'prompt-change-mgmt',
    title: '변경관리 절차',
    category: '배포운영',
    purpose: '요청→승인→적용→롤백 체크리스트',
    requiredInputs: ['변경유형', '영향범위', '백업상태'],
    prompt: '''
변경관리 체크리스트를 작성하라. 시크릿·주소를 만들지 마라.

유형: {{변경유형}}
영향: {{영향범위}}
백업: {{백업상태}}

흐름: 요청→영향분석→위험검토→백업→시험→승인→적용→확인→기록→롤백준비.
PLC 로직은 백업 없는 직접변경 위험을 강조하라.
''',
    replaceItems: ['변경유형', '영향범위', '백업상태'],
    doNotGuess: ['실제 시크릿', 'PLC 주소', '작물 설정값'],
    preserveFeatures: ['롤백준비'],
    safetyConditions: ['인터록 변경은 별도 안전검토'],
    checkConditions: ['적용 전 시험이 있는가'],
    expectedResult: '변경관리 체크리스트',
  ),
  PromptTemplate(
    id: 'prompt-backup-restore',
    title: '백업·복구 계획',
    category: '배포운영',
    purpose: '대상·주기·복구시험 계획',
    requiredInputs: ['백업대상목록', 'RPO후보', 'RTO후보', '저장위치메모'],
    prompt: '''
백업·복구 계획을 작성하라. RPO/RTO를 근거 없이 확정하지 마라. 시크릿을 출력하지 마라.

대상: {{백업대상목록}}
RPO후보: {{RPO후보}}
RTO후보: {{RTO후보}}
저장: {{저장위치메모}}

포함: 대상별방법, 암호화·접근통제 확인항목, 복구시험절차, 실패시연락망.
''',
    replaceItems: ['백업대상목록', 'RPO후보', 'RTO후보', '저장위치메모'],
    doNotGuess: ['확정 RPO/RTO', '실제 키/비밀번호', 'PLC 주소'],
    preserveFeatures: ['복구시험필수'],
    safetyConditions: ['복구 중 원격쓰기 잠금'],
    checkConditions: ['최근 복구시험 기록이 있는가'],
    expectedResult: '백업·복구 계획',
  ),
  PromptTemplate(
    id: 'prompt-code-review',
    title: '스마트팜 코드리뷰',
    category: '테스트',
    purpose: '통신·제어·AI 연동 코드 리뷰',
    requiredInputs: ['언어또는스택', '모듈목적', '코드발췌또는요약'],
    prompt: '''
교육용 코드리뷰를 수행하라. 없는 API·주소·정확도를 만들지 마라.

스택: {{언어또는스택}}
목적: {{모듈목적}}
발췌/요약: {{코드발췌또는요약}}

점검: 타임아웃, 재시도, 취소, 품질게이트, 비밀관리, 로그PII, 테스트, 롤백.
''',
    replaceItems: ['언어또는스택', '모듈목적', '코드발췌또는요약'],
    doNotGuess: ['존재하지 않는 API', 'PLC 주소', '정확도 %'],
    preserveFeatures: ['보안·타임아웃'],
    safetyConditions: ['제어쓰기는 명시적 승인 경로'],
    checkConditions: ['실패경로 테스트가 있는가'],
    expectedResult: '코드리뷰 코멘트',
  ),
  PromptTemplate(
    id: 'prompt-handover',
    title: '현장 인수보고',
    category: '배포운영',
    purpose: '인수인계·교육·미결이슈 보고',
    requiredInputs: ['인도범위', '시험결과요약', '미결이슈', '교육대상'],
    prompt: '''
현장 인수보고 초안을 작성하라. 미실시 시험을 합격으로 쓰지 마라. 주소·설정값 창작 금지.

범위: {{인도범위}}
시험요약: {{시험결과요약}}
미결: {{미결이슈}}
교육대상: {{교육대상}}

포함: 구성목록, 운전모드, 비상절차, 계정인수, 백업위치, 남은현장검증, 서명칸.
''',
    replaceItems: ['인도범위', '시험결과요약', '미결이슈', '교육대상'],
    doNotGuess: ['합격 단정', 'PLC 주소', '작물 setpoint'],
    preserveFeatures: ['미결이슈명시'],
    safetyConditions: ['비상운전·수동우선 교육 필수'],
    checkConditions: ['계정·백업 인수가 있는가'],
    expectedResult: '인수보고 초안',
  ),
];
