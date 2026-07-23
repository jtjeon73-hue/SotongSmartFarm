import '../models/smart_farm_content.dart';

/// 센서 학습 콘텐츠 (입문·기초).
const List<SmartFarmContent> sensorContents = [
  SmartFarmContent(
    id: 'sensor-temp-humidity',
    title: '온·습도 센서',
    summary: '공기 온도·상대습도를 측정해 환기·보온·가습 판단에 씁니다. 설치 위치와 오염·결로가 오차의 큰 원인입니다.',
    category: '센서',
    difficulty: Difficulty.beginner,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.general,
      FarmType.greenhouse,
      FarmType.livestock,
    ],
    sections: [
      ContentSection(
        title: '측정 대상·원리',
        body:
            '온도는 저항·반도체·열전대 등으로, 습도는 정전용량·저항 변화 등으로 측정하는 제품이 흔합니다. 복합 센서가 하나의 하우징에 온·습도를 담는 경우가 많습니다.',
      ),
      ContentSection(
        title: '출력 형태',
        body:
            '디지털(I²C 등), 아날로그(0–10V, 4–20mA), RS-485(Modbus 등) 출력이 있습니다. PLC 연결 시 입력 모듈 종류와 전원·접지를 맞추세요. 제조사별 레지스터 주소는 매뉴얼을 따릅니다.',
        bullets: const ['0–10V / 4–20mA 아날로그', 'RS-485 디지털 통신', '펄스는 온습도에 드묾'],
      ),
      ContentSection(
        title: '정확도 vs 분해능',
        body:
            '분해능이 촘촘해도 정확도·교정 상태가 나쁘면 의미가 없습니다. 현장에서는 보조 온도계와 교차 확인하는 습관이 중요합니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '설치·오차·유지',
        body:
            '직사광·히터 바람·물방울이 직접 닿는 곳은 피하고, 대표성 있는 높이에 설치합니다. 필터 오염·결로는 습도 오차를 키웁니다. 배선은 노이즈·침수에 주의하세요.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '안전 메모',
        body: '잘못된 온습도로 환기·난방이 오동작할 수 있습니다. 센서 이상을 감지하면 수동 모드와 현장 확인을 우선하세요.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['온습도', '4-20mA', '0-10V', 'RS-485', '설치', '교정'],
    relatedIds: const [
      'sensor-calibration',
      'sensor-selection',
      'control-analog-scaling',
      'env-greenhouse',
    ],
    sourceIds: const ['src-sensor-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'sensor-soil-moisture',
    title: '토양수분 센서',
    summary:
        '토양·배지 수분을 추정해 관수 판단에 참고합니다. 토성·염분·설치 깊이에 따라 값이 달라지며, 절대 %를 맹신하지 마세요.',
    category: '센서',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.openField,
      FarmType.greenhouse,
      FarmType.orchard,
    ],
    sections: [
      ContentSection(
        title: '측정·출력',
        body:
            '정전용량·TDR 등 방식으로 체적수분 또는 관련 전기량을 측정합니다. 출력은 전압·전류·RS-485가 흔합니다. 제품마다 단위·교정 곡선이 다릅니다.',
      ),
      ContentSection(
        title: '설치와 해석',
        body:
            '근권 깊이에 맞추고, 돌·공기층·과밀 접촉을 피합니다. 한 점이 필드를 대표하기 어려워 여러 지점·관수 후 관찰을 병행하세요. 목표 수분값은 작물·단계·토성에 따라 다릅니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '오차·유지',
        body:
            '염류·온도·접촉 불량이 오차를 만듭니다. 케이블 손상·침수를 점검하고, 관수 자동화에 쓸 때는 강우·고장 시 인터록을 둡니다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '제어 연결 주의',
        body: '수분 값이 낮다고 무조건 펌프를 켜면 누수·과습이 납니다. 시간 상한, 수위·압력, 수동확인과 함께 쓰세요.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['토양수분', '배지', '관수', '정전용량', 'TDR'],
    relatedIds: const [
      'env-open-field',
      'env-greenhouse',
      'control-env',
      'sensor-calibration',
    ],
    sourceIds: const ['src-sensor-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'sensor-light',
    title: '광·일사 센서',
    summary:
        '조도·일사(광량)를 측정해 차광·보광·환기 판단에 참고합니다. 센서 종류(조도 lux vs 일사 W/m² 등)를 혼동하지 마세요.',
    category: '센서',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.greenhouse, FarmType.openField],
    sections: [
      ContentSection(
        title: '측정 대상',
        body:
            '조도(lux), 일사(W/m²), 광합성유효광(PPFD 등) 등 목적이 다른 센서가 있습니다. 작물용으로 쓸 때는 어떤 광량을 보려는지 먼저 정하세요.',
      ),
      ContentSection(
        title: '출력·설치',
        body:
            '0–10V, 4–20mA, RS-485 출력이 흔합니다. 수평 설치, 오염·물때 청소, 그늘·반사 영향을 확인합니다. 정확도·분해능은 제품 사양을 따릅니다.',
      ),
      ContentSection(
        title: '활용과 한계',
        body:
            '커튼·보광 스케줄의 참고가 되지만, 생육 최적 광량은 품종·단계·계절에 따라 달라 공식 숫자로 고정하기 어렵습니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '현장확인',
        body: '렌즈·디퓨저 오염, 케이블 UV 손상, 스케일 설정을 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['조도', '일사', 'PPFD', '차광', '보광'],
    relatedIds: const [
      'env-greenhouse',
      'control-env',
      'sensor-selection',
      'control-analog-scaling',
    ],
    sourceIds: const ['src-sensor-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'sensor-co2',
    title: 'CO₂ 센서',
    summary: '이산화탄소 농도를 측정해 환기·보광·축사 공기 관리에 참고합니다. 교정·설치 위치·간섭가스에 주의합니다.',
    category: '센서',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.greenhouse,
      FarmType.mushroom,
      FarmType.livestock,
      FarmType.storage,
    ],
    sections: [
      ContentSection(
        title: '원리·출력',
        body:
            'NDIR 방식이 흔하며, 아날로그(0–10V, 4–20mA) 또는 RS-485로 출력합니다. 측정 범위·정확도는 모델마다 다르며 제조사 사양을 확인하세요.',
      ),
      ContentSection(
        title: '설치·교정',
        body:
            '사람·히터·문 바로 앞보다 대표 공기 흐름 지점이 낫습니다. 자동교정 기능이 현장 농도에 맞춰져 오차를 키우는 경우가 있어, 매뉴얼의 교정 절차를 따릅니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '활용 주의',
        body:
            'CO₂만으로 환기를 과도하게 닫으면 온습도·유해가스 문제가 커질 수 있습니다. 축사·저장고는 안전·복지 관점에서 복합 판단이 필요합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '유지보수',
        body: '필터·흡기구 오염, 전원 안정, 통신 오류를 점검하고 이상 시 수동 환기 기준을 적용합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['CO2', 'NDIR', '환기', '교정', '축사', '온실'],
    relatedIds: const [
      'env-mushroom',
      'env-livestock',
      'sensor-calibration',
      'control-env',
    ],
    sourceIds: const ['src-sensor-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'sensor-ph-ec',
    title: 'pH·EC 센서',
    summary: '양액·수질 관리에 쓰는 전극·프로브입니다. 오염·건조·교정 주기가 짧아 유지보수가 핵심입니다.',
    category: '센서',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.hydroponics],
    sections: [
      ContentSection(
        title: '측정·출력',
        body:
            'pH는 유리전극 전위, EC는 도전율로 염류 농도를 추정합니다. 트랜스미터가 0–10V·4–20mA·RS-485로 변환하는 구성이 흔합니다.',
      ),
      ContentSection(
        title: '교정·유지',
        body:
            '표준액으로 주기 교정하고, 전극 보관·세척 방법을 매뉴얼대로 따릅니다. 오염되면 제어가 잘못된 원액 주입으로 이어질 수 있습니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: 'PLC·인터록',
        body:
            '스케일링 후 경보·주입 제어에 연결할 때는 상·하한, 수동확인, 펌프·밸브 인터록을 둡니다. 제조사별 통신 주소는 매뉴얼을 사용하세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body:
            '휴대 측정기와 교차 비교하고, 기포·유속·온도 보정이 맞는지 확인합니다. 목표 pH·EC는 처방·작물·단계에 따라 달라집니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['pH', 'EC', '양액', '전극', '교정', '4-20mA'],
    relatedIds: const [
      'env-hydroponics',
      'sensor-calibration',
      'control-analog-scaling',
      'control-interlock',
    ],
    sourceIds: const ['src-sensor-edu', 'src-hydroponics'],
    verificationStatus: VerificationStatus.needsReview,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'sensor-level-flow',
    title: '수위·유량 센서',
    summary: '탱크 수위와 배관 유량을 측정해 펌프 보호·관수량 기록에 씁니다. 공운전·넘침 방지를 위한 인터록과 잘 맞습니다.',
    category: '센서',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.general,
      FarmType.hydroponics,
      FarmType.openField,
    ],
    sections: [
      ContentSection(
        title: '종류·출력',
        body:
            '수위는 플로트·초음파·압력식 등이 있고, 유량은 터빈·전자·초음파 등이 있습니다. 출력은 접점(디지털), 4–20mA, 펄스, RS-485가 흔합니다.',
        bullets: const ['디지털 접점: 고/저수위', '아날로그: 연속 수위', '펄스: 유량 적산'],
      ),
      ContentSection(
        title: '설치·오차',
        body: '거품·탁도·부착물, 배관 직관부 부족, 진동이 오차를 만듭니다. 펄스 스케일(리터/펄스)을 정확히 설정하세요.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '안전·인터록',
        body:
            '저수위면 펌프 정지, 고수위면 급수 차단처럼 하드웨어·PLC 이중화가 바람직합니다. 센서 고장 시 안전한 쪽으로 가도록 설계합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '실제 수면·유량계 적산과 화면 값을 비교하고, 플로트 걸림·케이블 상태를 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['수위', '유량', '펄스', '펌프보호', '인터록'],
    relatedIds: const [
      'control-interlock',
      'control-drives',
      'env-hydroponics',
      'hw-actuators',
    ],
    sourceIds: const ['src-sensor-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'sensor-weather',
    title: '기상 센서',
    summary:
        '외부 기온·습도·강우·풍속·풍향·일사 등을 측정해 환기·관수·경보에 참고합니다. 설치 높이와 장애물이 품질을 좌우합니다.',
    category: '센서',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.greenhouse,
      FarmType.openField,
      FarmType.orchard,
    ],
    sections: [
      ContentSection(
        title: '구성·출력',
        body:
            '개별 센서 또는 종합 기상관측 키트가 있으며, RS-485·펄스(풍속·강우)·아날로그 출력이 섞입니다. 프로토콜·배선은 제품 매뉴얼을 따릅니다.',
      ),
      ContentSection(
        title: '설치',
        body: '건물·나무 바람그늘을 피하고, 강우 센서는 수평·오염 관리가 필요합니다. 낙뢰·서지 보호를 검토하세요.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '제어 연동 주의',
        body:
            '강풍 시 창 폐쇄, 강우 시 관수 중지 등은 유용하지만 오감지·통신지연이 있습니다. 수동 우선과 현장 확인이 필요합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '풍속계 회전·강우버킷 막힘·통신 타임아웃을 주기적으로 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['기상', '풍속', '강우', '일사', '서지', '환기연동'],
    relatedIds: const [
      'env-open-field',
      'env-greenhouse',
      'control-env',
      'hw-enclosure',
    ],
    sourceIds: const ['src-sensor-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'sensor-camera',
    title: '카메라·영상',
    summary:
        '생육·이상 관찰을 돕는 영상이며, AI 결과는 추천·경보로 취급합니다. 제어명령과 분리하고 사람 검토를 전제로 합니다.',
    category: '센서',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '역할',
        body:
            '원격 확인, 기록, (선택) 생육·병해 보조 분석에 사용합니다. 조도·렌즈 오염·각도에 따라 화질과 분석 품질이 크게 달라집니다.',
      ),
      ContentSection(
        title: '출력·연결',
        body:
            'IP 카메라(Ethernet), 일부 산업용 비전은 전용 인터페이스를 씁니다. PLC 디지털 입력에 “직접 제어”하기보다, 상위 PC·서버에서 알림을 보내는 구성이 일반적입니다.',
      ),
      ContentSection(
        title: 'AI와 제어 분리',
        body:
            '모델이 “병해” 또는 “환기 필요”를 말해도 즉시 약제·구동기를 작동시키지 마세요. 오탐·미탐을 전제로 관리자가 확인한 뒤 검증된 제어 절차를 따릅니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '설치·유지·개인정보',
        body: '방수·진동·전원·PoE, 저장 용량, 작업자 촬영 동의·보안을 검토합니다. 렌즈 청소와 시간 동기화가 기본입니다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '전문가 메모',
        body: '학습 데이터와 현장 품종이 다르면 성능이 떨어집니다. 현장검증 없이 “정확하다”고 단정하지 마세요.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['카메라', '영상', 'AI보조', '오탐', '원격확인'],
    relatedIds: const [
      'hw-camera',
      'overview-data-to-control',
      'control-basics',
      'env-orchard',
    ],
    sourceIds: const ['src-sensor-edu', 'src-ai-caution'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'sensor-selection',
    title: '센서 선정 기준',
    summary: '측정 목적·환경·출력·정확도·유지보수·비용·안전 연동을 기준으로 고릅니다. 스펙 숫자만 보고 사지 마세요.',
    category: '센서',
    difficulty: Difficulty.basic,
    contentType: ContentType.checklist,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '목적부터',
        body:
            '알람용인지, 피드백 제어용인지, 연구 기록용인지에 따라 필요 정확도와 비용이 달라집니다. 제어에 쓸수록 고장 시 안전 설계가 중요합니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '체크리스트',
        body: '선정 시 아래를 문서화하세요.',
        bullets: const [
          '측정 범위·단위',
          '출력: 접점/0-10V/4-20mA/펄스/RS-485',
          '전원·방수방진(IP)·사용온도',
          '정확도·안정성·교정 방법',
          '케이블 길이·서지·접지',
          'PLC/원격I/O 호환',
          '소모품·교정 주기·부품 수급',
        ],
      ),
      ContentSection(
        title: '농장 환경',
        body: '습도·분무·분진·암모니아·직사광·진동은 사무실용 센서를 빠르게 망가뜨립니다. 내환경 등급과 보호함을 함께 봅니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '샘플 설치로 노이즈·대표성을 확인한 뒤 대수 확장하는 편이 안전합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['선정', 'IP등급', '출력신호', '호환', '유지보수'],
    relatedIds: const [
      'sensor-calibration',
      'hw-enclosure',
      'control-io',
      'overview-before-intro',
    ],
    sourceIds: const ['src-sensor-edu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'sensor-calibration',
    title: '교정·점검·유지보수',
    summary: '센서는 시간이 지나면 틀어집니다. 교정·교차확인·청소·배선점검을 주기화하고, 이상 시 제어를 수동으로 돌립니다.',
    category: '센서',
    difficulty: Difficulty.basic,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    sections: [
      ContentSection(
        title: '왜 교정인가',
        body:
            '정확도는 출하 시점 사양일 뿐, 현장 오염·충격·노화로 달라집니다. 분해능이 좋아도 교정이 안 되면 제어가 빗나갑니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '기본 절차(교육용)',
        body:
            '전원·배선 확인 → 보조 계측과 비교 → 표준액·기준기로 교정(해당 시) → 스케일/오프셋 기록 → 알람·인터록 재시험 순으로 진행합니다. 제품마다 절차가 다르므로 매뉴얼을 우선합니다.',
        kind: SectionKind.flow,
        bullets: const ['비교 측정', '교정·조정', '기록(날짜·담당·값)', '제어 연동 시험'],
      ),
      ContentSection(
        title: '배선·PLC',
        body:
            '극성·실드·접지, 4–20mA 루프 전원, RS-485 종단·주소 충돌을 점검합니다. 주소·스케일 숫자는 제조사 문서를 따르며, 이 교재는 특정 PLC 주소를 제시하지 않습니다.',
      ),
      ContentSection(
        title: '안전',
        body:
            '교정 중 자동 제어가 오동작하지 않게 수동 모드·출력 금지 조치를 합니다. 전기 작업은 자격자가 차단 절차를 따릅니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '교정 라벨·주기표, 예비 센서, 최근 이상 이력을 보관합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['교정', '점검', '스케일', '유지보수', '수동모드'],
    relatedIds: const [
      'sensor-ph-ec',
      'sensor-temp-humidity',
      'control-analog-scaling',
      'control-manual-auto',
    ],
    sourceIds: const ['src-sensor-edu', 'src-calibration'],
    verificationStatus: VerificationStatus.needsReview,
    checkedAt: '2026-07-23',
  ),
];
