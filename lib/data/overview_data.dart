import '../models/smart_farm_content.dart';

/// 스마트팜 개요 학습 콘텐츠 (입문·기초).
const List<SmartFarmContent> overviewContents = [
  SmartFarmContent(
    id: 'overview-what',
    title: '스마트팜이란',
    summary:
        '센서로 환경을 측정하고, 데이터를 모아 판단한 뒤 구동기를 제어하는 농업 운영 방식입니다. AI는 보조 도구이며, 최종 제어와 안전은 사람과 검증된 제어 로직이 담당합니다.',
    category: '개요',
    difficulty: Difficulty.beginner,
    contentType: ContentType.concept,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '한 줄 정의',
        body:
            '스마트팜은 작물·가축·저장 환경을 센서와 제어장치로 모니터링하고, 필요 시 환기·관수·보온·급이 등을 자동화하는 체계입니다. 목적은 노동 부담 완화와 환경 안정화이며, “완전 무인”이나 “AI가 알아서 농사”를 의미하지 않습니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '무엇이 자동화되는가',
        body:
            '자주 자동화되는 것은 온습도·토양수분·급수·환기·커튼·조명·양액 공급처럼 반복적이고 규칙이 분명한 작업입니다. 병해 진단, 수확 시기 판단, 이상 원인 분석은 사람·전문가 확인이 함께 필요합니다.',
        bullets: const [
          '측정: 센서·기상·카메라 등',
          '기록: 로컬·서버·클라우드 저장',
          '제어: PLC·릴레이·인버터·밸브',
          '확인: 관리자 현장·원격 점검',
        ],
      ),
      ContentSection(
        title: 'AI와 제어의 구분',
        body:
            'AI 모델이 “환기를 열라”고 제안해도, 그것은 추천·경보일 수 있습니다. 실제 개폐 명령은 PLC·인터록·수동/자동 모드·비상정지 조건을 거친 제어 로직이 내려야 합니다. AI 출력을 바로 구동기에 연결하지 마세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '입문자가 먼저 볼 것',
        body:
            '장비 카탈로그만 보지 말고, 내 농장의 관리 대상(온실·노지·축사 등), 전원·통신 상태, 수동 운전 가능 여부부터 정리하세요. 도입 전 체크는 관련 항목 ‘도입 전 확인’을 참고합니다.',
        bullets: const [
          '무엇을 관리할지(환경·급수·급이 등)',
          '누가 이상 시 대응할지',
          '정전·통신 끊김 시 안전 동작',
        ],
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['스마트팜', '자동화', '센서', '제어', 'AI보조', '입문'],
    relatedIds: const [
      'overview-architecture',
      'overview-data-to-control',
      'overview-before-intro',
      'control-basics',
    ],
    sourceIds: const ['src-overview-edu', 'src-farm-safety'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'overview-architecture',
    title: '시스템 구성 한눈에 보기',
    summary:
        '현장 센서·구동기, 제어반(PLC·전원보호), 통신, 현장표시(HMI), 상위 PC/서버, 관리자 확인으로 이어지는 계층 구조를 이해합니다.',
    category: '개요',
    difficulty: Difficulty.beginner,
    contentType: ContentType.concept,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '계층으로 나누기',
        body:
            '스마트팜은 보통 ‘현장–제어–통신–상위–사람’ 계층으로 나눕니다. 한 업체가 모든 장비를 한 상자에 넣더라도, 고장·정전·통신 장애를 대비하려면 계층별 역할을 구분하는 것이 좋습니다.',
        bullets: const [
          '현장: 센서, 펌프, 팬, 밸브, 모터',
          '제어: PLC, 릴레이, 접촉기, 인버터',
          '통신: RS-485, Ethernet, 게이트웨이',
          '상위: IPC, 서버, 대시보드, 알림',
          '사람: HMI·앱 확인, 수동 개입',
        ],
      ),
      ContentSection(
        title: '왜 제어반이 중심인가',
        body:
            '센서 값은 상위 화면에도 보이지만, 안전 인터록·비상정지·수동우선은 보통 제어반(PLC·배선)에서 처리합니다. 클라우드가 느려지거나 끊겨도 현장 제어가 안전한 쪽으로 동작하도록 설계합니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '구성 예시(교육용)',
        body:
            '온실을 예로 들면, 온습도·토양수분 센서 → 원격 I/O 또는 PLC 입력 → 환기·관수 출력 → HMI에 상태 표시 → 관리자 확인 순입니다. 실제 구성은 규모·제조사·통신 방식에 따라 달라지며, 특정 주소·모델은 매뉴얼을 따릅니다.',
        kind: SectionKind.expertNote,
      ),
      ContentSection(
        title: '현장 확인 포인트',
        body:
            '도면·단선도에 없는 임시 배선, 접지 미흡, 방수 미적용 박스는 나중에 큰 장애가 됩니다. 설치 전후에 전원 차단 절차와 담당자(전기 자격)를 확인하세요.',
        bullets: const ['단선도·I/O 목록 존재 여부', '수동/자동 전환 스위치', '비상정지 위치와 라벨'],
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['아키텍처', '제어반', 'PLC', 'HMI', '계층', '시스템구성'],
    relatedIds: const [
      'overview-data-to-control',
      'hw-panel',
      'control-plc-basics',
      'hw-remote-io',
    ],
    sourceIds: const ['src-overview-edu', 'src-plc-intro'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'overview-data-to-control',
    title: '데이터에서 제어까지',
    summary:
        '환경 측정부터 구동·재측정·관리자 확인까지 이어지는 기본 흐름을 익힙니다. 분석·AI 결과는 판단 보조이며, 제어명령과는 분리합니다.',
    category: '개요',
    difficulty: Difficulty.basic,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '기본 흐름',
        body:
            '스마트팜의 반복 루프는 아래와 같습니다. 한 단계라도 건너뛰면(예: 분석만 보고 바로 강제 제어) 안전·품질 위험이 커집니다.',
        bullets: const [
          '환경 → 센서 → 수집 → 저장 → 분석 → 판단 → 제어명령 → 구동기 → 재측정 → 관리자확인',
        ],
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '단계별 의미',
        body:
            '수집·저장은 “무슨 일이 있었는지”를 남기고, 분석·판단은 “무엇을 할지”를 제안합니다. 제어명령은 PLC 등에서 인터록을 통과한 뒤 구동기에 전달되며, 재측정으로 효과를 확인합니다. 관리자확인은 이상·한계 상황을 사람이 닫는 단계입니다.',
      ),
      ContentSection(
        title: '분석·AI ≠ 제어명령',
        body:
            '카메라 분석이 “병해 의심”을 띄워도, 약제 살포나 급격한 환기 변경을 자동으로 실행해서는 안 됩니다. 권고는 알림으로 두고, 제어는 검증된 규칙·수동 승인·안전 조건을 거쳐야 합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '설정값에 대한 주의',
        body:
            '목표 온습도·관수량은 품종·생육단계·지역·계절·시설 구조에 따라 달라집니다. 앱이나 교재에 나온 숫자를 “공식 기준”처럼 고정하지 말고, 재배 지침·컨설턴트·현장 기록으로 조정하세요.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '현장 점검',
        body:
            '자동이 켜진 상태에서 센서 고장·통신 지연이 있으면 잘못된 제어가 반복될 수 있습니다. 재측정 값이 기대와 다르면 수동 모드로 전환하고 원인을 확인하세요.',
        bullets: const [
          '최근 센서 값·타임스탬프 확인',
          '구동기 실제 동작 여부 육안 확인',
          '알람·인터록 이력 확인',
        ],
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['데이터흐름', '제어루프', '재측정', '관리자확인', 'AI구분'],
    relatedIds: const [
      'overview-what',
      'overview-architecture',
      'control-env',
      'control-interlock',
      'sensor-selection',
    ],
    sourceIds: const ['src-overview-edu', 'src-control-safety'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'overview-pros-cons',
    title: '기대효과와 한계',
    summary:
        '노동 절감·기록 품질·환경 안정화 등 기대효과와 함께, 비용·유지보수·오감지·과도한 자동화의 한계를 균형 있게 봅니다.',
    category: '개요',
    difficulty: Difficulty.beginner,
    contentType: ContentType.concept,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '기대할 수 있는 점',
        body:
            '반복 작업의 규칙화, 야간·주말 이상 조기 알림, 환경·작업 이력 보존, 교육용 표준 절차 공유에 도움이 됩니다. 다만 효과는 센서 신뢰도·유지보수·운영 규칙이 뒷받침될 때 나타납니다.',
        bullets: const [
          '관수·환기 등 반복 작업 부담 감소',
          '이상 징후를 더 빨리 알아챌 가능성',
          '의사결정에 쓸 기록 축적',
        ],
      ),
      ContentSection(
        title: '한계와 오해',
        body:
            '센서가 있다고 병해가 사라지지 않고, AI가 있다고 수확량이 보장되지 않습니다. 초기·유지 비용, 전기·통신 장애, 잘못된 설정, 인력 교육 부족이 효과를 깎아 내립니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '안전·운영 리스크',
        body:
            '자동 관수 과다, 환기 오동작, 축사 환기 정지는 작물·가축·설비 피해로 이어질 수 있습니다. 비상정지, 수동모드, 인터록, 이중 확인(현장 육안)을 전제로 도입하세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현실적인 도입 관점',
        body:
            '한 번에 전 농장을 자동화하기보다, 관수·환기처럼 규칙이 분명한 구간부터 시작하고 기록을 남기며 범위를 넓히는 편이 안전합니다. “완전 자율”보다 “사람이 감독하는 반자동”이 입문에 적합합니다.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['기대효과', '한계', '비용', '유지보수', '반자동'],
    relatedIds: const [
      'overview-before-intro',
      'overview-farm-types',
      'control-fault-safe',
      'control-manual-auto',
    ],
    sourceIds: const ['src-overview-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'overview-farm-types',
    title: '농장 유형별 차이',
    summary:
        '시설원예·노지·과수·수경·버섯·축산·저장은 관리 대상과 위험·자동화 범위가 다릅니다. 유형에 맞는 센서·제어 우선순위를 잡습니다.',
    category: '개요',
    difficulty: Difficulty.beginner,
    contentType: ContentType.concept,
    farmTypes: const [
      FarmType.greenhouse,
      FarmType.openField,
      FarmType.orchard,
      FarmType.hydroponics,
      FarmType.mushroom,
      FarmType.livestock,
      FarmType.storage,
    ],
    sections: [
      ContentSection(
        title: '유형이 다르면 우선순위가 다르다',
        body:
            '온실은 온습도·환기, 노지는 기상·관수, 수경은 pH·EC·수위, 버섯은 온습도·환기·위생, 축사는 환기·온열·급이·급수·동물복지, 저장은 온습도·가스·문 개폐 안전이 핵심에 가깝습니다. 같은 “스마트팜”이라도 장비 구성이 달라집니다.',
      ),
      ContentSection(
        title: '공통으로 중요한 것',
        body:
            '전원 보호, 수동/자동, 비상정지, 센서 교정, 통신 끊김 시 안전 동작, 관리자 확인은 유형과 무관하게 필요합니다. 자동화 한계를 알고 현장 확인을 남기는 습관이 중요합니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '유형별 한 줄 메모',
        body: '세부 내용은 환경 메뉴 각 항목에서 다룹니다. 여기서는 방향만 잡습니다.',
        bullets: const [
          '시설원예: 환기·보온·관수 연동',
          '노지: 기상·펌프·구역 관수',
          '과수: 미세기후·관수·방제 보조',
          '수경: 양액·수위·펌프 인터록',
          '버섯: 습도·환기·오염 관리',
          '축산: 환기·온열·급이·복지·안전',
          '저장: 온습도·가스·출입·정전',
        ],
      ),
      ContentSection(
        title: '현장 확인',
        body:
            '내 농장 유형에 맞지 않는 “만능 패키지”는 센서만 늘리고 제어·안전이 비어 있을 수 있습니다. 도입 전 관리 대상 목록을 먼저 적으세요.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['시설원예', '노지', '과수', '수경', '버섯', '축산', '저장'],
    relatedIds: const [
      'env-greenhouse',
      'env-open-field',
      'env-orchard',
      'env-hydroponics',
      'env-mushroom',
      'env-livestock',
      'env-storage',
      'overview-before-intro',
    ],
    sourceIds: const ['src-overview-edu', 'src-farm-types'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'overview-before-intro',
    title: '도입 전 확인사항',
    summary: '목표·전원·통신·수동운전·비상정지·유지보수 주체·데이터 보관까지, 장비 구매 전에 점검할 체크리스트입니다.',
    category: '개요',
    difficulty: Difficulty.basic,
    contentType: ContentType.checklist,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '목표를 문장으로 쓰기',
        body:
            '“스마트하게”보다 “야간 저온 알람”, “구역별 관수 기록”, “환기 수동/자동 전환”처럼 측정 가능한 목표를 적습니다. 목표가 불명확하면 센서와 화면만 늘기 쉽습니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '전원·보호·자격',
        body:
            '농장 전기 공사·제어반 작업은 자격이 있는 사람이 수행해야 합니다. 누전차단, 과전류 보호, 접지, 방수·방진 등급을 확인하고, 임시 연장선으로 상시 전원을 쓰지 마세요.',
        kind: SectionKind.safety,
        bullets: const [
          '주전원·분전반 용량',
          '누전·과전류 보호 장치',
          '접지·등전위',
          '전기 작업 담당자(자격)',
        ],
      ),
      ContentSection(
        title: '제어·안전 체크',
        body:
            '자동보다 먼저 수동으로 각 구동기를 켜고 끌 수 있는지, 비상정지가 동작을 끊는지, 통신 끊김 시 안전한 쪽으로 가는지 확인합니다.',
        bullets: const [
          '수동/자동 전환',
          'E-stop(비상정지)',
          '인터록(예: 수위 낮으면 펌프 금지)',
          '정전 후 재기동 절차',
        ],
      ),
      ContentSection(
        title: '운영·유지보수',
        body:
            '센서 청소·교정, 필터·벨트, 펌프로부터 소프트웨어 백업까지 담당자와 주기를 정합니다. 제조사 매뉴얼·도면·계정 정보를 한곳에 보관하세요.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '데이터·AI 도입 시',
        body:
            '카메라·AI를 넣을 계획이라도, 1단계는 신뢰할 수 있는 측정·기록·알림부터입니다. AI 결과는 제어명령과 분리하고, 오탐·미탐을 사람이 검토할 시간을 확보하세요.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['도입체크', '전원', '비상정지', '수동모드', '유지보수'],
    relatedIds: const [
      'overview-what',
      'overview-pros-cons',
      'hw-power',
      'control-fault-safe',
      'control-manual-auto',
    ],
    sourceIds: const [
      'src-overview-edu',
      'src-farm-safety',
      'src-electrical-safety',
    ],
    verificationStatus: VerificationStatus.needsReview,
    checkedAt: '2026-07-23',
  ),
];
