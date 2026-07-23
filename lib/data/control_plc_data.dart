import '../models/smart_farm_content.dart';

/// 제어·PLC 학습 콘텐츠 (입문·기초).
const List<SmartFarmContent> controlPlcContents = [
  SmartFarmContent(
    id: 'control-basics',
    title: '제어 기초',
    summary:
        '측정값을 보고 구동기를 켜고 끄는 규칙을 이해합니다. ON/OFF·히스테리시스·시간·조건·시퀀스·인터록·PID·우선순위·E-stop·수동을 구분합니다.',
    category: '제어',
    difficulty: Difficulty.beginner,
    contentType: ContentType.concept,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '제어란',
        body:
            '센서·스위치 입력을 바탕으로 펌프·팬·밸브·히터 등 출력을 결정하는 일입니다. 스마트팜에서는 “화면에서 본 값”과 “실제로 나간 명령”이 항상 같다고 가정하지 마세요.',
      ),
      ContentSection(
        title: '제어 유형 한눈에',
        body: '입문 단계에서 자주 만나는 방식입니다.',
        bullets: const [
          'ON/OFF: 임계값 넘으면 켜고/끄기',
          '히스테리시스: 켜짐·꺼짐 기준을 다르게',
          '시간: 스케줄·운전시간 제한',
          '조건: 강우 시 관수 금지 등',
          '시퀀스: 여러 단계를 순서대로',
          '인터록: 위험하면 출력을 막음',
          'PID: 목표에 맞춰 연속 조절(고급)',
          '우선순위: 수동 > 안전 > 자동 등',
          'E-stop·수동: 즉시 정지·사람 직접 조작',
        ],
        kind: SectionKind.important,
      ),
      ContentSection(
        title: 'AI 결과와 제어명령',
        body:
            '분석·AI는 “권고”일 수 있고, 제어명령은 인터록·모드를 통과한 신호입니다. 둘을 직접 연결하지 않는 것이 안전합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '각 구동기를 수동으로 시험하고, 자동 규칙이 기대대로인지 짧은 시험 운전을 남기세요.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['제어', 'ON/OFF', '히스테리시스', '인터록', '수동', 'E-stop'],
    relatedIds: const [
      'control-env',
      'control-interlock',
      'control-manual-auto',
      'overview-data-to-control',
    ],
    sourceIds: const ['src-control-edu', 'src-control-safety'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'control-plc-basics',
    title: 'PLC란',
    summary:
        'PLC는 산업용 제어기로, 입력을 읽어 논리·연산 후 출력을 갱신합니다. 농장에서는 환기·관수·경보의 신뢰성 있는 실행기로 쓰입니다.',
    category: '제어',
    difficulty: Difficulty.beginner,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '역할',
        body:
            '센서·스위치 신호를 받아들이고, 프로그램된 조건에 따라 릴레이·접촉기·밸브·인버터에 명령을 보냅니다. PC가 꺼져도(설계에 따라) 현장 제어를 유지하는 구성이 많습니다.',
      ),
      ContentSection(
        title: '주변 장치',
        body:
            '전원, 입력/출력 모듈, 통신, HMI, 원격 I/O와 함께 씁니다. 릴레이·접촉기·차단기는 전력·모터를 직접 다루는 쪽에 가깝습니다.',
        bullets: const [
          'PLC: 논리·타이밍·인터록',
          '릴레이/접촉기: 부하 개폐',
          '차단기: 과전류·단락 보호',
          '인버터: 모터 속도·소프트 기동',
        ],
      ),
      ContentSection(
        title: '주소·프로그램에 대해',
        body:
            '입출력·내부 접점 주소 체계는 제조사·시리즈마다 다릅니다. 이 자료는 특정 메이커 주소를 제시하지 않으며, 현장 도면·매뉴얼을 따라야 합니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '안전',
        body:
            '프로그램 변경·강제 출력은 사고 위험이 큽니다. 변경 전 백업, 수동 시험, 자격자 작업, E-stop 시험을 하세요.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['PLC', '릴레이', '접촉기', '인버터', 'HMI'],
    relatedIds: const [
      'control-scan-cycle',
      'control-io',
      'control-ladder',
      'hw-remote-io',
      'hw-panel',
    ],
    sourceIds: const ['src-control-edu', 'src-plc-intro'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'control-scan-cycle',
    title: '스캔 사이클',
    summary: 'PLC는 입력 읽기 → 프로그램 실행 → 출력 갱신을 반복합니다. 주기와 지연을 이해해야 깜빡임·경합을 줄입니다.',
    category: '제어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '기본 흐름',
        body:
            '한 스캔에서 입력을 샘플링하고 논리를 계산한 뒤 출력을 반영합니다. 통신·인터럽트·특수 기능은 제품마다 추가됩니다.',
        kind: SectionKind.flow,
        bullets: const ['입력 읽기', '프로그램(논리) 실행', '출력 쓰기', '다음 스캔 반복'],
      ),
      ContentSection(
        title: '왜 중요한가',
        body:
            '너무 짧은 펄스 입력은 놓칠 수 있고, 무거운 프로그램은 스캔이 길어져 응답이 느려질 수 있습니다. 타이머·필터로 채터링을 줄입니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '현장 팁',
        body:
            '창·릴레이가 빠르게 깜빡이면 히스테리시스·최소 운전시간·스캔/입력 필터를 점검하세요. 제조사 진단으로 스캔 시간을 확인합니다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '전문가 메모',
        body:
            '안전 관련 정지는 일반 논리만으로 충분하지 않을 수 있습니다. 비상정지는 안전 설계 기준과 하드웨어 경로를 검토하세요.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['스캔', '주기', '입력필터', '응답지연'],
    relatedIds: const [
      'control-plc-basics',
      'control-timer-counter',
      'control-ladder',
      'control-fault-safe',
    ],
    sourceIds: const ['src-control-edu', 'src-plc-intro'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'control-io',
    title: '입력과 출력(I/O)',
    summary: '디지털·아날로그 입출력의 차이를 알고, 센서·구동기를 올바른 모듈에 연결합니다. 극성·전원·접지가 핵심입니다.',
    category: '제어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '디지털 I/O',
        body:
            '스위치·플로트·릴레이 접점처럼 ON/OFF를 다룹니다. 출력은 램프·릴레이 코일·소형 밸브 등에 쓰이며, 대용량 모터는 접촉기·인버터를 거칩니다.',
      ),
      ContentSection(
        title: '아날로그 I/O',
        body:
            '0–10V, 4–20mA 등으로 연속값을 읽고, 인버터 속도 지령 등에 아날로그 출력을 쓸 수 있습니다. 스케일링은 별도 항목을 참고하세요.',
        bullets: const [
          '센서 → AI(아날로그 입력)',
          '지령 → AO(아날로그 출력)',
          '통신 센서는 원격 I/O·게이트웨이',
        ],
      ),
      ContentSection(
        title: '배선 주의',
        body: '싱크/소스, 루프 전원, 실드 접지, 고압·동력선 분리, 단자 라벨을 지킵니다. 전기 작업은 자격자가 수행합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body:
            'I/O 리스트와 실제 단자, 강제 출력 없이 입력 자극 시험, 출력 시 부하 실동작을 확인합니다. 특정 주소는 도면을 따릅니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['디지털', '아날로그', '4-20mA', '배선', 'I/O리스트'],
    relatedIds: const [
      'control-analog-scaling',
      'hw-remote-io',
      'sensor-selection',
      'control-plc-basics',
    ],
    sourceIds: const ['src-control-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'control-ladder',
    title: '래더 논리 입문',
    summary: '래더는 접점과 코일로 제어 논리를 그리는 표현입니다. 직렬(AND)·병렬(OR)·자기유지·인터록 패턴을 이해합니다.',
    category: '제어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '기본 생각',
        body:
            '왼쪽 조건(접점)이 만족되면 오른쪽 출력(코일)이 동작한다고 보면 입문에 충분합니다. 실제 문법·주소는 소프트웨어·PLC마다 다릅니다.',
      ),
      ContentSection(
        title: '자주 쓰는 패턴',
        body: '시작/정지 자기유지, 상호 인터록(동시 개폐 금지), 타이머 지연, 알람 래치 등이 농장 제어에 자주 나옵니다.',
        bullets: const [
          '직렬: 모든 조건 필요',
          '병렬: 하나라도 만족',
          '자기유지: 순간 버튼으로 유지',
          '인터록: 위험 조합 차단',
        ],
      ),
      ContentSection(
        title: '중요',
        body: '화면에서 강제 ON은 현장 안전을 무시할 수 있습니다. 테스트는 수동·격리·감시 하에 짧게 수행하세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '전문가 메모',
        body: '복잡한 시퀀스는 상태(스텝)로 나누면 읽기 쉽습니다. 주석·태그 이름을 한글로도 명확히 남기세요.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['래더', '접점', '코일', '자기유지', '인터록'],
    relatedIds: const [
      'control-timer-counter',
      'control-interlock',
      'control-plc-basics',
      'control-scan-cycle',
    ],
    sourceIds: const ['src-control-edu', 'src-plc-intro'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'control-timer-counter',
    title: '타이머와 카운터',
    summary: '지연 기동·최소 운전시간·횟수 제한에 사용합니다. 관수 시간, 팬 순차 기동, 알람 지연에 자주 등장합니다.',
    category: '제어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '타이머',
        body:
            'ON 지연(조건이 지속된 뒤 동작), OFF 지연, 펄스 등이 있습니다. 센서 노이즈로 출력이 깜빡이는 것을 줄일 때 유용합니다.',
      ),
      ContentSection(
        title: '카운터',
        body: '이벤트 횟수·펄스 유량 적산(스케일과 함께) 등에 씁니다. 오버플로·리셋 조건을 명확히 하세요.',
      ),
      ContentSection(
        title: '농장 예시(교육용)',
        body:
            '관수 최대 시간, 창 개방 후 대기, 펌프 재기동 쿨다운처럼 “시간 상한”은 과습·과열·장비 보호에 도움이 됩니다. 구체 초·분 값은 설비·작물에 맞게 현장 결정합니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '현장확인',
        body: '설정 시간과 스톱워치·실동작이 일치하는지, 전원 재투입 후 타이머 상태가 안전한지 확인합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['타이머', '카운터', '지연', '쿨다운', '운전시간'],
    relatedIds: const [
      'control-ladder',
      'control-env',
      'control-drives',
      'sensor-level-flow',
    ],
    sourceIds: const ['src-control-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'control-interlock',
    title: '인터록·우선순위',
    summary:
        '위험하거나 모순된 동작을 막아 설비·작물·가축·사람을 보호합니다. 수동·E-stop·안전이 자동보다 우선하는 구조를 이해합니다.',
    category: '제어',
    difficulty: Difficulty.basic,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '인터록이란',
        body:
            '예: 수위가 낮으면 펌프 금지, 문이 열리면 운전 금지, 강풍이면 천창 개방 금지. “하고 싶어도 조건이 안 되면 못 하게” 만드는 논리·배선입니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '우선순위(교육용)',
        body:
            '일반적으로 비상정지 > 안전 인터록 > 수동 > 자동(스케줄·AI권고) 순으로 설계하는 편이 안전합니다. 현장 표준에 맞게 문서화하세요.',
        bullets: const [
          'E-stop: 즉시 위험 출력 차단',
          '인터록: 조건 위반 시 금지',
          '수동: 사람이 직접 조작',
          '자동: 규칙·스케줄 실행',
        ],
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '하드웨어와 소프트웨어',
        body:
            '중요 정지는 소프트웨어만으로 끝내지 않고, 배선·안전릴레이·접촉기 경로를 검토합니다. 요건은 설비 위험도와 규정에 따릅니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '인터록 조건을 일부러 만들어(저수위 등) 출력이 정말 막히는지 시험하고 기록을 남깁니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['인터록', '우선순위', 'E-stop', '펌프보호', '안전'],
    relatedIds: const [
      'control-fault-safe',
      'control-manual-auto',
      'sensor-level-flow',
      'env-hydroponics',
      'control-basics',
    ],
    sourceIds: const ['src-control-edu', 'src-control-safety'],
    verificationStatus: VerificationStatus.needsReview,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'control-analog-scaling',
    title: '아날로그 스케일링',
    summary: '4–20mA·0–10V 신호를 온도·습도·유량 등 공학 단위로 바꿉니다. 잘못된 스케일은 잘못된 제어로 이어집니다.',
    category: '제어',
    difficulty: Difficulty.basic,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '개념',
        body:
            '원시값(전류·전압·디지털 카운트)을 측정 범위의 최소·최대에 대응시켜 공학값으로 변환합니다. 센서 범위와 PLC 입력 범위를 일치시키는 것이 출발점입니다.',
      ),
      ContentSection(
        title: '절차(교육용)',
        body:
            '센서 사양 확인 → 배선·루프 전원 확인 → 알려진 입력(시뮬레이터·표준)으로 원시값 확인 → 스케일·오프셋 설정 → 보조 계측과 비교 → 기록.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '실수 유형',
        body:
            '0–10V와 4–20mA 혼동, 소수점·단위 오류, 센서 범위와 다른 스케일, 단선 시 0을 “최저온”으로 오인하는 경우가 있습니다. 단선·고장 시 안전쪽 처리를 넣으세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body:
            '중간값·양끝값을 점검하고, 화면 단위(℃, %, m³/h)가 맞는지 라벨과 대조합니다. 특정 주소·명령어는 매뉴얼을 사용합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['스케일링', '4-20mA', '0-10V', '공학단위', '단선'],
    relatedIds: const [
      'control-io',
      'sensor-temp-humidity',
      'sensor-ph-ec',
      'sensor-calibration',
    ],
    sourceIds: const ['src-control-edu', 'src-sensor-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'control-env',
    title: '환경 제어 패턴',
    summary:
        '환기·보온·관수·가습·차광 등 환경 제어에 쓰는 실무 패턴을 정리합니다. 목표값은 품종·단계·지역·계절에 따라 조정합니다.',
    category: '제어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.greenhouse,
      FarmType.mushroom,
      FarmType.hydroponics,
    ],
    sections: [
      ContentSection(
        title: '흔한 패턴',
        body:
            '온습도 ON/OFF+히스테리시스, 시간대별 스케줄, 외부 기상 조건, 최소/최대 운전시간, 단계적 환기(팬·창)가 자주 쓰입니다. PID는 필요와 튜닝 역량이 있을 때 검토합니다.',
      ),
      ContentSection(
        title: '설정값 주의',
        body:
            '교재·앱의 예시 숫자를 공식 생육 기준으로 쓰지 마세요. 품종·생육단계·지역·계절·시설에 따라 달라지며, 재배 지침과 현장 기록으로 맞춥니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '구동기 조합',
        body:
            '창·팬·커튼·히터·쿨러·밸브가 동시에 모순되게 동작하지 않게 인터록합니다. 예: 난방 중 과도한 환기, 관수 중 배수 이상.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '데이터 루프',
        body:
            '제어 후 재측정·관리자 확인으로 효과를 보고, 이상하면 수동으로 돌립니다. AI 권고는 알림으로 두고 검증된 규칙만 자동 실행하세요.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '현장확인',
        body: '계절이 바뀌면 설정·기상 연동을 재검토하고, 센서 위치와 실제 환경을 비교합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['환경제어', '환기', '관수', '히스테리시스', '스케줄'],
    relatedIds: const [
      'control-basics',
      'control-drives',
      'env-greenhouse',
      'overview-data-to-control',
    ],
    sourceIds: const ['src-control-edu', 'src-env-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'control-drives',
    title: '구동기 제어',
    summary: '모터·펌프·팬·밸브·히터·쿨러·스크린·벤트·양액 공급 등 구동기의 개폐·속도·보호를 다룹니다.',
    category: '제어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '구동기 종류',
        body:
            '펌프·팬은 모터+차단기+접촉기/인버터, 밸브는 솔레노이드·전동볼, 히터·쿨러는 전력·냉매 안전, 스크린·벤트는 리밋스위치·과부하 보호가 중요합니다. 양액 공급은 펌프·주입·수위 인터록이 핵심입니다.',
      ),
      ContentSection(
        title: '제어 방식',
        body:
            '단순 ON/OFF, 인버터 속도(아날로그·통신), 개도 제어, 순차 기동(동시 기동 전류 제한)이 있습니다. 리밋·과부하·누수 신호를 반드시 읽으세요.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '보호·안전',
        body: '과전류, 공운전, 위상 이상, 비상정지, 수동 우선을 설계에 포함합니다. 동력 배선은 자격자가 시공·점검합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '회전 방향, 이음·진동, 리밋 동작, 밸브 누설, 명판 전류와 실측을 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['펌프', '팬', '밸브', '인버터', '히터', '스크린', '양액'],
    relatedIds: const [
      'hw-actuators',
      'control-interlock',
      'control-env',
      'hw-power',
    ],
    sourceIds: const ['src-control-edu', 'src-hardware-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'control-manual-auto',
    title: '수동·자동 모드',
    summary: '자동은 편리하지만, 이상·점검·교정·비상 시에는 수동이 우선입니다. 전환 스위치·권한·표시를 명확히 합니다.',
    category: '제어',
    difficulty: Difficulty.beginner,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '왜 수동이 필요한가',
        body:
            '센서 오류, 통신 끊김, 프로그램 버그, 기상 급변, 점검 작업에서 사람이 직접 개입해야 합니다. 수동이 없거나 찾기 어려운 시스템은 위험합니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '설계 포인트',
        body:
            '현장 선택 스위치와 HMI 모드를 일치시키고, 현재 모드를 크게 표시합니다. 자동 복귀 조건을 문서화하고, 원격에서 무단으로 자동을 강제하지 않게 권한을 둡니다.',
      ),
      ContentSection(
        title: '전환 절차(교육용)',
        body:
            '상태 확인 → 필요 출력 OFF → 수동 전환 → 개별 시험 → 문제 없으면 자동 복귀 → 감시. AI·원격 권고만으로 모드를 바꾸지 마세요.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '안전',
        body: '수동 중에도 인터록·E-stop은 유효해야 합니다. “수동이면 모든 보호 해제”는 사고 원인이 됩니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '모든 중요 구동기에 대해 수동 ON/OFF가 되는지 정기 시험합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['수동', '자동', '모드전환', '권한', 'HMI'],
    relatedIds: const [
      'control-interlock',
      'control-fault-safe',
      'hw-hmi',
      'overview-before-intro',
    ],
    sourceIds: const ['src-control-edu', 'src-control-safety'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'control-fault-safe',
    title: '고장·정전·페일세이프',
    summary: '고장과 정전을 전제로 안전한 쪽으로 멈추거나 유지하는 설계를 합니다. 경보·재기동·기록·훈련이 함께 가야 합니다.',
    category: '제어',
    difficulty: Difficulty.basic,
    contentType: ContentType.troubleshooting,
    farmTypes: const [FarmType.general, FarmType.livestock],
    sections: [
      ContentSection(
        title: '페일세이프 생각',
        body:
            '센서 단선·통신 두절·PLC 정지 시 “마지막으로 켠 상태 유지”가 항상 안전하지는 않습니다. 축사 환기·온실 고온처럼 시나리오별로 안전 방향을 정하세요.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '정전·재기동',
        body:
            'UPS·비상전원은 제어·통신·필수 환기 등에 범위를 정합니다. 복전 시 동시 기동 충격, 자동 재시작 허용 여부를 절차로 남깁니다.',
        bullets: const ['필수 부하 선정', '복전 시퀀스', '알람·통보'],
      ),
      ContentSection(
        title: 'E-stop과 경보',
        body:
            '비상정지는 누구든 누르기 쉬운 위치에 두고, 리셋은 원인 제거 후 의도적으로 수행합니다. 경보는 소리·빛·문자 등으로 전달하되 경보 폭주(알람 홍수)를 관리합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '진단 흐름',
        body:
            '사람·가축·설비 안전 확보 → 수동 → 전원·통신·센서 → 구동기 → 로그 확인 → 전문가/제조사. AI 진단은 참고만 합니다.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '현장확인',
        body: '정전 모의(가능한 범위), E-stop 시험, 경보 시험, 예비 부품·연락망을 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['페일세이프', '정전', 'UPS', 'E-stop', '경보', '재기동'],
    relatedIds: const [
      'hw-ups',
      'control-interlock',
      'control-manual-auto',
      'env-livestock',
      'overview-before-intro',
    ],
    sourceIds: const [
      'src-control-edu',
      'src-control-safety',
      'src-farm-safety',
    ],
    verificationStatus: VerificationStatus.needsReview,
    checkedAt: '2026-07-23',
  ),
];
