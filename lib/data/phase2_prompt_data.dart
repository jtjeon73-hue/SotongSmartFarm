import '../models/prompt_template.dart';

/// Phase-2 additional practical prompts (do not invent PLC addresses or crop setpoints).
const List<PromptTemplate> phase2PromptTemplates = [
  PromptTemplate(
    id: 'prompt-datasheet',
    title: '센서 사양서 분석',
    category: '센서선정',
    purpose: '데이터시트에서 확인해야 할 항목 추출',
    requiredInputs: ['센서유형', '데이터시트요약또는미지수'],
    prompt: '''
센서 유형 {{센서유형}}의 데이터시트에서 반드시 확인할 항목 체크리스트를 만들어라.
알려진 요약: {{데이터시트요약또는미지수}}
정확도·분해능·측정범위·응답시간·출력·전원·환경등급·교정방법을 구분해라.
없는 수치는 추측하지 말고 "데이터시트 확인 필요"로 남겨라.
''',
    replaceItems: ['센서유형', '데이터시트요약또는미지수'],
    doNotGuess: ['정확도 수치', '수명'],
    preserveFeatures: ['확인필요 표시'],
    safetyConditions: ['내화학·방수 등급 확인'],
    checkConditions: ['출력방식과 PLC 입력이 대응되는가'],
    expectedResult: '사양서 검토 체크리스트',
  ),
  PromptTemplate(
    id: 'prompt-420ma',
    title: '4–20mA 스케일링 설계',
    category: '센서선정',
    purpose: '라이브제로·단선감지·변환식 정리',
    requiredInputs: ['공학단위최소', '공학단위최대', '수신저항또는모듈메모'],
    prompt: '''
4–20mA 스케일링 설계 메모를 작성하라.
EngMin={{공학단위최소}}, EngMax={{공학단위최대}}
모듈메모: {{수신저항또는모듈메모}}
공식 Eng=EngMin+(mA-4)*(EngMax-EngMin)/16 를 포함하고,
4mA live zero, <3.6mA 단선의심, RAW 범위는 제조사 모듈 확인을 명시하라.
특정 PLC RAW를 단정하지 마라.
''',
    replaceItems: ['공학단위최소', '공학단위최대', '수신저항또는모듈메모'],
    doNotGuess: ['PLC RAW 범위'],
    preserveFeatures: ['단선감지'],
    safetyConditions: ['루프전원·접지 검토'],
    checkConditions: ['오버/언더레인지 처리가 있는가'],
    expectedResult: '스케일링 설계 메모',
  ),
  PromptTemplate(
    id: 'prompt-io-list',
    title: 'PLC I/O 목록 초안',
    category: 'PLC설계',
    purpose: 'DI/DO/AI/AO 목록 템플릿',
    requiredInputs: ['설비목록', '센서목록', '안전장치목록'],
    prompt: '''
다음 입력으로 I/O 목록 표를 만들어라. 주소는 비워두고 태그명·신호유형·비고만 채운다.
설비: {{설비목록}}
센서: {{센서목록}}
안전: {{안전장치목록}}
비상정지·수동·자동·피드백을 반드시 포함하라. 제조사 주소를 만들지 마라.
''',
    replaceItems: ['설비목록', '센서목록', '안전장치목록'],
    doNotGuess: ['PLC 주소'],
    preserveFeatures: ['안전 I/O'],
    safetyConditions: ['E-stop은 SW만으로 대체 금지 명시'],
    checkConditions: ['피드백 접점이 있는가'],
    expectedResult: 'I/O 표',
  ),
  PromptTemplate(
    id: 'prompt-sequence',
    title: '제어 시퀀스 초안',
    category: 'PLC설계',
    purpose: '시작·정지·인터록·타임아웃 정의',
    requiredInputs: ['설비명', '시작조건', '금지조건'],
    prompt: '''
{{설비명}} 교육용 제어 시퀀스를 작성하라.
시작조건: {{시작조건}}
금지/인터록: {{금지조건}}
최소운전·최소정지·피드백·타임아웃·실패·수동·통신장애·센서장애를 포함하라.
래더는 의사코드로만, manufacturerReviewRequired/fieldValidationRequired를 표시하라.
''',
    replaceItems: ['설비명', '시작조건', '금지조건'],
    doNotGuess: ['타이머 확정값(초)'],
    preserveFeatures: ['교육용 표시'],
    safetyConditions: ['인터록 우선'],
    checkConditions: ['타임아웃이 있는가'],
    expectedResult: '시퀀스 표',
  ),
  PromptTemplate(
    id: 'prompt-interlock-review',
    title: '인터록 검토',
    category: '안전검토',
    purpose: '원격·자동이 수동/안전을 덮지 않는지 검토',
    requiredInputs: ['모드목록', '위험시나리오'],
    prompt: '''
모드 {{모드목록}}에서 허용/금지 명령을 표로 만들어라.
위험: {{위험시나리오}}
원격 명령이 현장 수동·E-stop·인터록을 덮어쓰지 못하게 하는 조건을 적어라.
''',
    replaceItems: ['모드목록', '위험시나리오'],
    doNotGuess: ['SIL 등급'],
    preserveFeatures: ['모드별 금지명령'],
    safetyConditions: ['하드웨어 인터록 검토 필요 표시'],
    checkConditions: ['비상모드 복귀조건이 있는가'],
    expectedResult: '인터록 매트릭스',
  ),
  PromptTemplate(
    id: 'prompt-modbus-manual',
    title: 'Modbus 매뉴얼 분석',
    category: '통신',
    purpose: '레지스터 문서 해석 체크',
    requiredInputs: ['장비명', '매뉴얼발췌또는미지'],
    prompt: '''
장비 {{장비명}} Modbus 문서 분석 체크리스트를 작성하라.
발췌: {{매뉴얼발췌또는미지}}
0/1-based, FC, byte/word order, signed, float, CRC, timeout을 확인하고
없는 값은 추측하지 마라.
''',
    replaceItems: ['장비명', '매뉴얼발췌또는미지'],
    doNotGuess: ['레지스터 맵'],
    preserveFeatures: ['주소체계 확인'],
    safetyConditions: ['쓰기 FC는 별도 승인'],
    checkConditions: ['예외응답 처리가 있는가'],
    expectedResult: '매뉴얼 분석 체크',
  ),
  PromptTemplate(
    id: 'prompt-comm-fault',
    title: '통신 장애진단',
    category: '고장진단',
    purpose: '증상→점검순서 진단표',
    requiredInputs: ['증상', '토폴로지메모'],
    prompt: '''
증상 {{증상}}, 토폴로지 {{토폴로지메모}}에 대해
전원→케이블→극성→접지→종단→설정→ID→주소→프레임→CRC→타임아웃→노이즈 순 진단표를 작성하라.
''',
    replaceItems: ['증상', '토폴로지메모'],
    doNotGuess: ['실측 파형'],
    preserveFeatures: ['순서형 진단'],
    safetyConditions: ['활선작업 자격'],
    checkConditions: ['단일장비/전체장비 구분이 있는가'],
    expectedResult: '진단표',
  ),
  PromptTemplate(
    id: 'prompt-dq-rules',
    title: '데이터 품질 규칙',
    category: '데이터모델',
    purpose: 'quality 상태 규칙 정의',
    requiredInputs: ['측정항목', '물리범위메모'],
    prompt: '''
측정 {{측정항목}}, 범위메모 {{물리범위메모}}에 대해
good/stale/missing/outOfRange/spike/flatline/communicationError/calibrationRequired/manualValue/estimated
판정 규칙표를 만들어라. 이상값을 삭제하지 말고 원본+quality를 보존하라.
''',
    replaceItems: ['측정항목', '물리범위메모'],
    doNotGuess: ['작물 기준값'],
    preserveFeatures: ['원본보존'],
    safetyConditions: ['제어입력은 quality 게이트'],
    checkConditions: ['우선순위가 있는가'],
    expectedResult: '품질규칙표',
  ),
  PromptTemplate(
    id: 'prompt-alarm-design',
    title: '알람 설계',
    category: '모니터링화면',
    purpose: '우선순위·지연·데드밴드',
    requiredInputs: ['알람후보', '운영인력'],
    prompt: '''
알람후보 {{알람후보}}, 인력 {{운영인력}}으로
발생/확인/조치중/복구/종료 상태와 지연·데드밴드·반복억제를 설계하라.
가짜 KPI는 금지.
''',
    replaceItems: ['알람후보', '운영인력'],
    doNotGuess: ['법적 통보시간'],
    preserveFeatures: ['상태머신'],
    safetyConditions: ['생명안전 알람 최우선'],
    checkConditions: ['채터링 억제가 있는가'],
    expectedResult: '알람 설계서',
  ),
  PromptTemplate(
    id: 'prompt-irrigation',
    title: '관수 제어 검토',
    category: 'PLC설계',
    purpose: '단순 ON/OFF를 넘는 전제조건',
    requiredInputs: ['구역', '센서구성', '펌프밸브'],
    prompt: '''
구역 {{구역}}, 센서 {{센서구성}}, 구동 {{펌프밸브}}의 관수 상태머신
Idle→Preconditions→PumpStart→ValveOpen→Irrigating→Verification→FlushOrStop→Completed/Fault
를 채우되 작물 목표수분은 추측하지 마라.
''',
    replaceItems: ['구역', '센서구성', '펌프밸브'],
    doNotGuess: ['목표 수분%'],
    preserveFeatures: ['상한시간·누수'],
    safetyConditions: ['센서고장 시 자동관수 금지 옵션'],
    checkConditions: ['일일상한이 있는가'],
    expectedResult: '관수 상태머신',
  ),
  PromptTemplate(
    id: 'prompt-vent',
    title: '환기·온도 제어 검토',
    category: 'PLC설계',
    purpose: '히스테리시스·보호우선',
    requiredInputs: ['구동기목록', '외기조건센서'],
    prompt: '''
구동기 {{구동기목록}}, 외기센서 {{외기조건센서}}에 대해
ON/OFF·히스테리시스·측창/팬 우선순위와 강풍·강우·동결 보호가 일반 자동명령보다 우선함을 설명하는 설계 메모를 작성하라.
''',
    replaceItems: ['구동기목록', '외기조건센서'],
    doNotGuess: ['PID 게인'],
    preserveFeatures: ['보호우선'],
    safetyConditions: ['모터과부하'],
    checkConditions: ['난방-환기 충돌 처리'],
    expectedResult: '환기 제어 메모',
  ),
  PromptTemplate(
    id: 'prompt-nutrient',
    title: '양액 pH·EC 제어 검토',
    category: '안전검토',
    purpose: '과주입 방지·약품안전',
    requiredInputs: ['센서교정상태', '주입설비'],
    prompt: '''
교정 {{센서교정상태}}, 주입 {{주입설비}}에 대해
혼합지연·측정지연·최대주입시간·상하한·탱크수위·이중확인·수동전환을 포함한 안전 제어 검토를 작성하라.
작물별 pH/EC 목표를 확정하지 마라.
''',
    replaceItems: ['센서교정상태', '주입설비'],
    doNotGuess: ['목표 pH/EC'],
    preserveFeatures: ['과주입방지'],
    safetyConditions: ['산·알칼리 PPE'],
    checkConditions: ['표준액 교정이 있는가'],
    expectedResult: '양액 안전검토',
  ),
  PromptTemplate(
    id: 'prompt-livestock-vent',
    title: '축사 환기 검토',
    category: '안전검토',
    purpose: '로컬 비상환기 유지',
    requiredInputs: ['축종또는사육단계', '환기설비'],
    prompt: '''
{{축종또는사육단계}}, 설비 {{환기설비}}에 대해
통신/서버 장애 시에도 필수 환기가 로컬로 유지되는 구조를 검토하라.
온도·습도·유해가스·정전·동물복지를 포함하고 기준값은 축종·연령에 따라 다름을 명시하라.
''',
    replaceItems: ['축종또는사육단계', '환기설비'],
    doNotGuess: ['적온 수치'],
    preserveFeatures: ['로컬 필수환기'],
    safetyConditions: ['정전 비상'],
    checkConditions: ['인터넷 단절 시험이 있는가'],
    expectedResult: '축사 환기 검토',
  ),
  PromptTemplate(
    id: 'prompt-anomaly-rules',
    title: '이상탐지 규칙 설계',
    category: '이상감지',
    purpose: '규칙/통계/ML 비교 후 1차 규칙',
    requiredInputs: ['신호목록', '운전모드'],
    prompt: '''
신호 {{신호목록}}, 모드 {{운전모드}}에 대해
펌프ON-유량없음, 밸브OPEN-압력무변화 등 규칙 기반 1차 탐지를 설계하라.
AI 출력을 안전 PLC에 직접 연결하지 마라. 정확도 수치를 만들지 마라.
''',
    replaceItems: ['신호목록', '운전모드'],
    doNotGuess: ['모델 정확도'],
    preserveFeatures: ['경고우선'],
    safetyConditions: ['사람 검토'],
    checkConditions: ['오탐/미탐 논의'],
    expectedResult: '규칙표',
  ),
  PromptTemplate(
    id: 'prompt-prediction-review',
    title: '예측 모델 검토',
    category: 'AI활용검토',
    purpose: '예측 vs 추천 vs 자동제어 구분',
    requiredInputs: ['예측대상', '가용데이터'],
    prompt: '''
대상 {{예측대상}}, 데이터 {{가용데이터}}에 대해
입력·학습/검증구간·드리프트·평가지표·실패시대체로직을 검토하라.
평가 없는 정확도 수치 금지. 추천은 승인 게이트를 둬라.
''',
    replaceItems: ['예측대상', '가용데이터'],
    doNotGuess: ['정확도%'],
    preserveFeatures: ['대체로직'],
    safetyConditions: ['자동제어 직결 금지'],
    checkConditions: ['검증구간이 있는가'],
    expectedResult: '모델 검토서',
  ),
  PromptTemplate(
    id: 'prompt-vision-data',
    title: '영상 데이터 검토',
    category: 'AI활용검토',
    purpose: '촬영·라벨·개인정보',
    requiredInputs: ['촬영목적', '카메라환경'],
    prompt: '''
목적 {{촬영목적}}, 환경 {{카메라환경}}에 대해
조명·가림·렌즈오염·라벨품질·클래스불균형·개인정보·저장용량을 검토하라.
사진 한 장으로 질병 확정하지 마라.
''',
    replaceItems: ['촬영목적', '카메라환경'],
    doNotGuess: ['진단 정확도'],
    preserveFeatures: ['현장검증'],
    safetyConditions: ['개인정보'],
    checkConditions: ['오탐/미탐'],
    expectedResult: '영상데이터 체크',
  ),
  PromptTemplate(
    id: 'prompt-commission-plan',
    title: '시운전 계획',
    category: '테스트',
    purpose: '시나리오·합격기준',
    requiredInputs: ['시스템범위', '위험목록'],
    prompt: '''
범위 {{시스템범위}}, 위험 {{위험목록}}으로
수동/자동/비상/통신단절/센서고장 시나리오와 합격기준을 작성하라.
''',
    replaceItems: ['시스템범위', '위험목록'],
    doNotGuess: ['일정 일수 확정'],
    preserveFeatures: ['단절시험'],
    safetyConditions: ['자격자 입회'],
    checkConditions: ['롤백 조건'],
    expectedResult: '시운전 계획',
  ),
  PromptTemplate(
    id: 'prompt-incident-report',
    title: '장애 보고서 템플릿',
    category: '고장진단',
    purpose: '원인·영향·재발방지',
    requiredInputs: ['증상', '영향범위'],
    prompt: '''
증상 {{증상}}, 영향 {{영향범위}}의 장애보고서 템플릿을 작성하라.
타임라인·가설·증거·임시조치·근본원인·재발방지를 포함하고 추측 단정 금지를 명시하라.
''',
    replaceItems: ['증상', '영향범위'],
    doNotGuess: ['원인 단정'],
    preserveFeatures: ['증거칸'],
    safetyConditions: ['안전조치 우선'],
    checkConditions: ['재발방지가 있는가'],
    expectedResult: '장애보고 템플릿',
  ),
  PromptTemplate(
    id: 'prompt-maintenance-plan',
    title: '유지관리 계획',
    category: '배포운영',
    purpose: '교정·점검 주기',
    requiredInputs: ['장비가이드목록', '인력'],
    prompt: '''
장비 {{장비가이드목록}}, 인력 {{인력}}으로
센서교정·필터·접점·백업·계정점검 주기를 표로 만들어라.
저장되는 것처럼 허위 완료표시를 하지 마라.
''',
    replaceItems: ['장비가이드목록', '인력'],
    doNotGuess: ['법정주기 단정'],
    preserveFeatures: ['담당·증거'],
    safetyConditions: ['전기작업 자격'],
    checkConditions: ['미점검 위험이 있는가'],
    expectedResult: '유지관리표',
  ),
  PromptTemplate(
    id: 'prompt-graph-design',
    title: '그래프·대시보드 설계',
    category: '모니터링화면',
    purpose: '결측·알람·축 오해 방지',
    requiredInputs: ['표시신호', '사용자역할'],
    prompt: '''
신호 {{표시신호}}, 사용자 {{사용자역할}}용 그래프 설계를 작성하라.
원시/이동평균/min-max, 결측구간, 알람·제어상태 오버레이, 잘못된 축 오해를 다루라.
''',
    replaceItems: ['표시신호', '사용자역할'],
    doNotGuess: ['최적 색상 보장'],
    preserveFeatures: ['결측표시'],
    safetyConditions: ['위험알람 시각강조'],
    checkConditions: ['단위 표기가 있는가'],
    expectedResult: '그래프 설계',
  ),
];
