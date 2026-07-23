import '../models/smart_farm_content.dart';

/// 하드웨어 학습 콘텐츠 (입문·기초).
const List<SmartFarmContent> hardwareContents = [
  SmartFarmContent(
    id: 'hw-panel',
    title: '제어반',
    summary: 'PLC·전원보호·릴레이·단자대가 모인 현장의 중심입니다. 도면·라벨·방열·잠금·안전이 품질을 좌우합니다.',
    category: '하드웨어',
    difficulty: Difficulty.beginner,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '구성 요소',
        body:
            '주차단기, 전원장치, PLC·원격 I/O, 릴레이·접촉기, 단자대, 서지보호, HMI 연결, 배선 덕트가 들어갑니다. 동력과 제어 배선을 구분하면 유지보수가 쉽습니다.',
      ),
      ContentSection(
        title: '농장 vs 사무실',
        body:
            '습도·분진·곤충·진동·부식성 가스가 있어 사무용 분전반 감각으로 설치하면 고장이 잦습니다. 방수·방진·밀폐·냉각을 함께 설계하세요.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '안전',
        body:
            '충전부에 손대지 말고, 작업 전 차단·잠금(LOTO 개념), 자격자 작업을 지킵니다. 비상정지·수동 스위치 위치를 명확히 표시합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '단선도·I/O 리스트 보관, 단자 라벨, 이상 발열·냄새, 도어 패킹, 해충 침입을 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['제어반', 'PLC', '단자대', '단선도', '방열'],
    relatedIds: const [
      'hw-power',
      'hw-remote-io',
      'hw-enclosure',
      'control-plc-basics',
    ],
    sourceIds: const ['src-hardware-edu', 'src-electrical-safety'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'hw-power',
    title: '전원과 보호장치',
    summary: '차단기·누전차단·서지·접지로 사람과 장비를 보호합니다. 전기 공사는 자격이 필요합니다.',
    category: '하드웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '기본 장치',
        body:
            '배선용 차단기(과전류), 누전차단, 퓨즈, 서지보호장치, 전원 공급장치(SMPS), 접지·등전위 본딩이 핵심입니다. 모터에는 과부하 계전기·인버터 보호 설정도 중요합니다.',
      ),
      ContentSection(
        title: '농장 환경 위험',
        body: '물·금속 구조물·긴 케이블은 감전·서지·누전 위험이 큽니다. 임시 연장선으로 상시 운전하지 마세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '자격·절차',
        body:
            '전기 설비의 설계·시공·점검은 관련 법령과 자격 요건을 따릅니다. 비자격자의 함부로 한 결선은 화재·감전으로 이어질 수 있습니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '현장확인',
        body: '정격·용량 라벨, 트립 이력, 접지 상태, 단자 조임, 이상 발열을 주기적으로 확인합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['차단기', '누전', '서지', '접지', '전기자격'],
    relatedIds: const [
      'hw-panel',
      'hw-ups',
      'control-drives',
      'overview-before-intro',
    ],
    sourceIds: const ['src-hardware-edu', 'src-electrical-safety'],
    verificationStatus: VerificationStatus.needsReview,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'hw-ipc',
    title: '산업용 PC',
    summary: '데이터 수집·화면·게이트웨이·AI 추론 등 상위 역할에 쓰입니다. 제어의 최종 안전을 IPC에만 맡기지 마세요.',
    category: '하드웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '역할',
        body:
            '로그 저장, 대시보드, 카메라 처리, 클라우드 연동, 레시피·설정 관리에 적합합니다. 실시간 인터록·E-stop은 PLC·안전회로가 담당하는 구성이 일반적입니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '선정 포인트',
        body:
            '사용온도·방진, 무팬/필터, 전원, 디스크 수명, 원격 관리, OS 업데이트 정책을 봅니다. 사무용 PC를 온실에 두면 수명이 짧아집니다.',
      ),
      ContentSection(
        title: '안전·운영',
        body: 'IPC 재부팅·장애 시에도 현장 제어가 안전 쪽으로 동작하는지 확인하세요. AI 프로세스는 제어명령과 분리합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '백업, 시간 동기화, 디스크 용량, 케이블 고정, 환기·필터를 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['산업용PC', 'IPC', '로그', '상위시스템', '백업'],
    relatedIds: const [
      'hw-gateway',
      'hw-hmi',
      'control-plc-basics',
      'sensor-camera',
    ],
    sourceIds: const ['src-hardware-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'hw-remote-io',
    title: 'PLC·원격 I/O',
    summary: '멀리 떨어진 센서·구동기를 버스·이더넷으로 연결합니다. 통신 끊김 시 출력 동작을 미리 정해야 합니다.',
    category: '하드웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '왜 쓰는가',
        body: '배선 길이를 줄이고 구역별로 입출력을 모을 수 있습니다. 온실·축사처럼 거리가 긴 현장에 유리합니다.',
      ),
      ContentSection(
        title: '구성',
        body:
            'PLC 본체 + 원격 I/O 어댑터 + 디지털/아날로그 모듈, 또는 일체형 장비가 있습니다. 프로토콜·전원·접지는 제조사 매뉴얼을 따르며, 특정 주소는 제시하지 않습니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '고장 시',
        body: '통신 두절 시 출력을 유지할지 끌지(또는 안전 위치)를 설계·시험합니다. 자동으로 위험한 쪽이 되지 않게 하세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '노드 상태 LED, 종단 저항, 차폐, 주소 중복, 전원 전압 강하를 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['원격IO', '버스', '통신두절', '모듈', '종단'],
    relatedIds: const [
      'hw-panel',
      'hw-gateway',
      'control-io',
      'control-fault-safe',
    ],
    sourceIds: const ['src-hardware-edu', 'src-plc-intro'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'hw-gateway',
    title: '게이트웨이',
    summary: '서로 다른 프로토콜·망을 이어 센서·클라우드·PLC를 연결합니다. 보안과 끊김 대비가 중요합니다.',
    category: '하드웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '역할',
        body:
            'RS-485↔Ethernet, 센서 클라우드 업로드, VPN·방화벽 기능 등을 제공합니다. 데이터 수집에는 유용하지만, 안전 제어의 단일 경로로 쓰지 마세요.',
      ),
      ContentSection(
        title: '선정·설정',
        body:
            '지원 프로토콜, 동시 장치 수, 사용온도, 전원, 로그, 펌웨어 업데이트, 인증·암호를 확인합니다. 기본 비밀번호를 방치하지 마세요.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '안전·보안',
        body: '외부망 장애가 현장 인터록을 막으면 안 됩니다. AI·클라우드 권고는 제어명령과 분리합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '통신 품질, 재접속, 시간동기, 펌웨어 버전, 물리 잠금을 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['게이트웨이', '프로토콜변환', '보안', '클라우드', 'RS-485'],
    relatedIds: const [
      'hw-ipc',
      'hw-remote-io',
      'sensor-selection',
      'overview-architecture',
    ],
    sourceIds: const ['src-hardware-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'hw-actuators',
    title: '액추에이터',
    summary: '전기·공압·유압으로 물리 동작을 만드는 펌프·팬·밸브·모터·스크린 등입니다. 보호장치와 수동 조작을 함께 둡니다.',
    category: '하드웨어',
    difficulty: Difficulty.beginner,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '대표 장치',
        body:
            '펌프, 팬, 전동·솔레노이드 밸브, 개폐기(창·커튼), 히터, 쿨러, 양액 주입 펌프 등이 있습니다. 각각 정격·리밋·과부하·누설 특성이 다릅니다.',
      ),
      ContentSection(
        title: '제어반과의 관계',
        body:
            'PLC 출력이 소형 부하는 직접, 대형 부하는 릴레이·접촉기·인버터를 통해 구동합니다. 리밋스위치·과부하 접점은 입력으로 되돌립니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '위험',
        body: '끼임·절단·화상·감전·약액 누출 위험이 있습니다. 가드, 비상정지, 잠금, 자격자 전기작업을 지키세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '수동 개폐, 이상한 소음, 누유·누수, 명판과 배선 일치, 윤활·필터를 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['액추에이터', '펌프', '밸브', '개폐기', '인버터'],
    relatedIds: const [
      'control-drives',
      'hw-panel',
      'hw-power',
      'control-interlock',
    ],
    sourceIds: const ['src-hardware-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'hw-camera',
    title: '카메라 하드웨어',
    summary: '하우징·렌즈·조명·전원·네트워크가 영상 품질을 결정합니다. 분석 PC와 분리해 두더라도 현장 내환경은 필수입니다.',
    category: '하드웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '구성',
        body:
            '카메라 본체, 렌즈, (필요 시) 조명·적외선, 브라켓, PoE/전원, 기록장치, 방수 하우징이 기본입니다. 김서림·물때 대책이 농장에서 중요합니다.',
      ),
      ContentSection(
        title: '설치',
        body: '진동·직사·분무를 피하고, 케이블은 UV·침수에 강한 경로로 배선합니다. 작업자 촬영·보안 정책을 미리 정하세요.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '제어와 분리',
        body: '카메라·AI는 관찰·알림용으로 두고, 구동기 명령은 PLC 안전 경로를 유지합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '초점·시간·저장, 렌즈 청소, 고정 볼트, 스위치 포트 상태를 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['카메라', 'PoE', '하우징', '조명', '김서림'],
    relatedIds: const [
      'sensor-camera',
      'hw-enclosure',
      'hw-ipc',
      'overview-data-to-control',
    ],
    sourceIds: const ['src-hardware-edu', 'src-ai-caution'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'hw-hmi',
    title: '현장 표시장치(HMI)',
    summary: '상태·알람·수동조작을 현장에서 보이게 합니다. 모드·경보·E-stop 상태를 명확히 표시하는 것이 우선입니다.',
    category: '하드웨어',
    difficulty: Difficulty.beginner,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '역할',
        body:
            '수치·트렌드·알람 이력, 수동/자동 전환, 간단한 설정 변경에 사용합니다. 복잡한 분석은 IPC·앱에 두고 HMI는 운전·안전에 집중해도 됩니다.',
      ),
      ContentSection(
        title: '설계 팁',
        body:
            '글자 크기, 색 대비, 장갑 사용, 햇빛 아래 가독성, 권한(비밀번호)을 고려합니다. 위험 조작은 확인 단계를 둡니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '안전',
        body: 'HMI 고장 시에도 하드웨어 수동·E-stop이 동작해야 합니다. 원격 화면만으로 현장 안전을 대체하지 마세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '터치 교정, 백라이트, 통신 상태, 화면 백업·버전을 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['HMI', '터치패널', '알람', '수동조작', '가독성'],
    relatedIds: const [
      'control-manual-auto',
      'hw-panel',
      'hw-ipc',
      'control-fault-safe',
    ],
    sourceIds: const ['src-hardware-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'hw-ups',
    title: 'UPS·비상전원',
    summary: '짧은 정전에도 제어·통신·필수 환기 등을 유지하거나 안전하게 정지시키기 위해 씁니다. 용량·부하 선정이 핵심입니다.',
    category: '하드웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general, FarmType.livestock, FarmType.storage],
    sections: [
      ContentSection(
        title: '무엇을 살릴까',
        body:
            'PLC·통신·경보·필수 팬 등 “멈추면 위험한 것”을 우선합니다. 모든 히터·펌프를 UPS에 올리면 수 분이면 방전됩니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '종류·유지',
        body:
            '온라인/라인인터랙티브 등 방식이 있고, 배터리 수명·온도·정기 방전 시험이 필요합니다. 발전기와 연계 시 절체 절차를 문서화하세요.',
      ),
      ContentSection(
        title: '안전',
        body: '배터리 가스·누액, 과부하, 잘못된 중립·접지 연결에 주의합니다. 전기 작업은 자격자가 수행합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body:
            '부하 목록, 예상 유지 시간, 경보, 복전 후 재기동 절차를 시험·기록합니다. 축사는 환기 정전 대응을 특히 점검하세요.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['UPS', '정전', '배터리', '비상전원', '필수부하'],
    relatedIds: const [
      'control-fault-safe',
      'env-livestock',
      'hw-power',
      'env-storage',
    ],
    sourceIds: const ['src-hardware-edu', 'src-farm-safety'],
    verificationStatus: VerificationStatus.needsReview,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'hw-enclosure',
    title: '방수·방진·내환경',
    summary:
        'IP 등급·재질·패킹·케이블그랜드로 습기·분진·부식으로부터 장비를 보호합니다. 농장 환경은 사무 환경보다 가혹합니다.',
    category: '하드웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '왜 필요한가',
        body:
            '분무, 고습, 분진, 암모니아, 직사광, 온도 급변은 센서·전원·접점을 빠르게 열화시킵니다. 보호 없는 “개방형 보드”는 피하세요.',
      ),
      ContentSection(
        title: '등급·설계',
        body:
            'IP 방수방진, 자외선·내화학 재질, 통기·방열, 드레인, 적절한 케이블그랜드 선택이 필요합니다. 밀폐만 하면 내부 과열·결로가 생길 수 있어 균형을 봅니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '안전',
        body: '물기가 있는 곳의 전기는 감전 위험이 큽니다. 뚜껑을 연 채 운전하지 말고, 점검 시 전원을 차단하세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '패킹 변형, 나사 누락, 내부 물방울·벌레, 필터 막힘, 그랜드 풀림을 정기 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '전문가 메모',
        body: '축사·수경·저장고는 부식·결로 조건이 달라 동일 함체를 쓰기 어렵습니다. 환경별로 재질을 분리하세요.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['IP등급', '방수', '방진', '결로', '케이블그랜드'],
    relatedIds: const [
      'hw-panel',
      'sensor-selection',
      'hw-camera',
      'overview-before-intro',
    ],
    sourceIds: const ['src-hardware-edu', 'src-electrical-safety'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
];
