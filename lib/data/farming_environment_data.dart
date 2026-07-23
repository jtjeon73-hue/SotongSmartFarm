import '../models/smart_farm_content.dart';

/// 농장·재배 환경별 학습 콘텐츠 (입문·기초).
const List<SmartFarmContent> farmingEnvironmentContents = [
  SmartFarmContent(
    id: 'env-greenhouse',
    title: '시설원예(온실)',
    summary:
        '온실에서는 온습도·광·환기·관수 등 환경 요소를 센서와 구동기로 관리합니다. 목표값은 품종·생육단계·지역·계절에 따라 달라지며, 자동 제어에도 수동·인터록·현장확인이 필요합니다.',
    category: '환경',
    difficulty: Difficulty.beginner,
    contentType: ContentType.concept,
    farmTypes: const [FarmType.greenhouse],
    sections: [
      ContentSection(
        title: '관리 대상',
        body:
            '작물 생육에 영향을 주는 공기·토양(또는 배지)·관수·환기·보온·차광을 관리합니다. 설비로는 측창·천창·팬·온풍기·보일러·커튼·관수 밸브·펌프가 자주 등장합니다.',
      ),
      ContentSection(
        title: '환경 요소와 센서',
        body:
            '대표 측정은 온습도, 토양·배지 수분, 광(조도·일사), CO₂, 외부 기상입니다. 센서 위치(직사광·물방울·통로)에 따라 값이 크게 달라지므로 설치 지점을 문서화하세요.',
        bullets: const ['내부 온습도·외부 기상', '토양/배지 수분', '광·(필요 시) CO₂'],
      ),
      ContentSection(
        title: '제어와 데이터 활용',
        body:
            '환기·보온·관수는 조건·시간·히스테리시스 등으로 제어하는 경우가 많습니다. 데이터는 이상 알람, 작업 기록, 설정 조정에 쓰고, AI 추천이 있어도 제어명령과 분리합니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '위험과 자동화 한계',
        body:
            '센서 고장으로 환기가 닫히거나 난방이 과다하면 작물·시설 피해가 납니다. 강풍·폭설 시 자동 개폐는 위험할 수 있어 기상 연동·수동 우선·비상정지가 필요합니다. 목표 온습도 숫자를 교재 그대로 “공식”으로 쓰지 마세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '화면 수치와 실제 온실 체감·보조 온도계를 비교하고, 창·커튼·펌프가 명령대로 움직이는지 육안으로 확인합니다.',
        bullets: const ['센서 방수·그늘·높이', '수동/자동 전환 시험', '강풍·정전 대비 절차'],
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['온실', '시설원예', '환기', '관수', '온습도', '커튼'],
    relatedIds: const [
      'env-hydroponics',
      'sensor-temp-humidity',
      'control-env',
      'overview-farm-types',
    ],
    sourceIds: const ['src-env-edu', 'src-greenhouse'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'env-open-field',
    title: '노지',
    summary:
        '노지는 기상 변동이 크고 시설 제어 범위가 제한적입니다. 구역 관수·펌프·기상 관측·기록이 핵심이며, 완전 환경 제어를 기대하기 어렵습니다.',
    category: '환경',
    difficulty: Difficulty.beginner,
    contentType: ContentType.concept,
    farmTypes: const [FarmType.openField],
    sections: [
      ContentSection(
        title: '관리 대상',
        body:
            '토양 수분·관수 일정, 펌프장·수로, 기상(강우·풍속·기온), 구역별 작황 관찰이 중심입니다. 온실처럼 창을 여닫아 공기 환경을 세밀히 맞추기는 어렵습니다.',
      ),
      ContentSection(
        title: '환경 요소·센서·제어',
        body:
            '토양수분·기상·유량·수위 센서와 펌프·밸브 제어가 흔합니다. 강우 시 관수 금지 같은 조건 제어, 시간 스케줄, 구역 순차 관수를 조합합니다.',
        bullets: const ['기상·토양수분·유량/수위', '펌프·전자밸브·필터', '구역·시간·강우 연동'],
      ),
      ContentSection(
        title: '데이터 활용',
        body:
            '관수 이력과 기상·토양 기록을 남겨 과다·과소 관수를 줄이는 데 활용합니다. 생육·병해 판단은 현장 관찰과 전문가 의견이 우선이며, 영상 분석은 보조로 둡니다.',
      ),
      ContentSection(
        title: '위험·한계',
        body:
            '펌프 공운전, 필터 막힘, 동파, 침수, 낙뢰·서지 위험이 있습니다. 기상 예보는 틀릴 수 있고, 센서 한 점으로 넓은 필드를 대표하기 어렵습니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body:
            '실제 급수 압력·누수·노즐 막힘, 구역 밸브 개폐를 주기적으로 확인하세요. 토양수분 값은 토성·깊이·설치 상태에 따라 해석이 달라집니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['노지', '관수', '기상', '펌프', '토양수분'],
    relatedIds: const [
      'sensor-soil-moisture',
      'sensor-weather',
      'sensor-level-flow',
      'control-drives',
      'overview-farm-types',
    ],
    sourceIds: const ['src-env-edu', 'src-open-field'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'env-orchard',
    title: '과수',
    summary:
        '과원은 미세기후·관수·방제·서리 등 이슈가 섞입니다. 자동화는 관수·기상 관측·기록부터 현실적으로 시작하고, 방제·수확 판단은 사람 중심입니다.',
    category: '환경',
    difficulty: Difficulty.basic,
    contentType: ContentType.concept,
    farmTypes: const [FarmType.orchard],
    sections: [
      ContentSection(
        title: '관리 대상',
        body:
            '수체·과실 품질에 영향을 주는 수분, 미기상(저지대 서리 등), 관수·시비, 방제 일정, 작업 이력을 관리합니다. 수종·품종·수령에 따라 우선순위가 달라집니다.',
      ),
      ContentSection(
        title: '환경·센서·제어',
        body:
            '기온·습도·강우·풍속, 토양수분, (필요 시) 잎 습윤 등이 참고됩니다. 제어는 관수 밸브·펌프, 일부 시설의 방상팬 등이 있으며, 약제 살포 자동화는 안전·규정·오탐 문제로 신중해야 합니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '데이터 활용과 한계',
        body:
            '기온 이력은 서리·동해 대응 논의에, 관수 기록은 수분 관리에 도움이 됩니다. 카메라·AI의 병해·성숙도 추정은 오탐이 있을 수 있어 현장 확인 없이 방제·수확을 자동 실행하지 마세요.',
      ),
      ContentSection(
        title: '위험',
        body:
            '고소 작업, 농약 취급, 전기·펌프 설비 주변 물기, 서리 대응 설비의 야간 운전 위험이 있습니다. 전기·농약 작업은 자격·안전수칙을 따릅니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '센서가 수관 안·밖에 따라 값이 달라집니다. 대표 지점을 정하고, 관수 후 실제 토양·수세를 함께 봅니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['과수', '과원', '관수', '미세기후', '서리', '방제'],
    relatedIds: const [
      'sensor-weather',
      'sensor-camera',
      'sensor-soil-moisture',
      'overview-farm-types',
    ],
    sourceIds: const ['src-env-edu', 'src-orchard'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'env-hydroponics',
    title: '수경재배',
    summary:
        '수경은 양액의 pH·EC·수위·유량·펌프·배액 관리가 핵심입니다. 공운전·누액·농도 이상은 빠르게 피해로 이어지므로 인터록과 수동 모드가 중요합니다.',
    category: '환경',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.hydroponics],
    sections: [
      ContentSection(
        title: '관리 대상',
        body:
            '배지·근권, 양액 탱크, 공급·배액, 펌프·필터, 온습도·광(보광 포함)을 관리합니다. “양액만 맞으면 끝”이 아니라 위생·막힘·누수도 일상 관리 대상입니다.',
      ),
      ContentSection(
        title: '환경·센서',
        body:
            'pH·EC, 수온, 수위, 유량, 온습도, (필요 시) DO·ORP 등이 쓰입니다. 목표 pH·EC는 작물·생육단계·처방·계절에 따라 달라지므로 특정 숫자를 공식처럼 고정하지 마세요.',
        bullets: const ['pH·EC·수온', '수위·유량', '온실 온습도·광'],
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '제어·데이터',
        body:
            '펌프 ON/OFF, 밸브, 원수·원액 주입, 시간·조건·시퀀스 제어가 일반적입니다. 데이터로 드리프트·센서 오염·주입량 이상을 조기에 발견합니다. AI 추천 농도를 바로 주입 명령에 연결하지 마세요.',
      ),
      ContentSection(
        title: '위험·인터록',
        body:
            '수위 저하 시 펌프 정지, 누액·넘침 감지, 수동우선, 비상정지는 필수에 가깝습니다. 잘못된 원액 주입은 단시간에 작물 피해를 낼 수 있습니다.',
        kind: SectionKind.safety,
        bullets: const ['저수위→펌프 금지', '교정·전극 오염 점검', '주입 전 수동 확인 절차'],
      ),
      ContentSection(
        title: '현장확인',
        body: '휴대용 pH·EC 측정기로 온라인 센서와 교차 확인하고, 필터·노즐·배관을 주기적으로 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['수경', '양액', 'pH', 'EC', '수위', '펌프', '인터록'],
    relatedIds: const [
      'sensor-ph-ec',
      'sensor-level-flow',
      'control-interlock',
      'control-env',
      'env-greenhouse',
    ],
    sourceIds: const ['src-env-edu', 'src-hydroponics'],
    verificationStatus: VerificationStatus.needsReview,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'env-mushroom',
    title: '버섯 재배',
    summary:
        '버섯은 온습도·환기·위생·오염 관리가 중요합니다. 환경 제어는 도움이 되지만, 균상·오염 판단은 현장 관찰이 중심입니다.',
    category: '환경',
    difficulty: Difficulty.basic,
    contentType: ContentType.concept,
    farmTypes: const [FarmType.mushroom],
    sections: [
      ContentSection(
        title: '관리 대상',
        body:
            '재배사 공기(온습도·환기), 관수·가습, 위생(출입·도구), 배지·균상 상태를 관리합니다. 품종·생육단계에 따라 환기·습도 요구가 달라집니다.',
      ),
      ContentSection(
        title: '환경·센서·제어',
        body:
            '온습도, CO₂, (필요 시) 차압·유량이 참고됩니다. 가습·환기·냉난방·순환팬을 조건·시간으로 제어합니다. 목표값은 시설·품종·단계에 따라 다르므로 일률 숫자를 공식화하지 마세요.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '데이터·한계',
        body:
            '환경 이력은 이상 구간을 찾는 데 유용합니다. 오염·병해는 냄새·색·균사 상태를 사람이 보고 판단하는 경우가 많고, 영상 AI는 보조에 그칩니다.',
      ),
      ContentSection(
        title: '위험',
        body:
            '과도한 밀폐·환기 부족, 가습 과다로 인한 물고임, 전기·물기 근접, 약품·소독제 취급에 주의합니다. 자동 환기가 멈춰도 알람·수동 개방 절차가 있어야 합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '센서 주변이 물방울·분무에 직접 맞지 않는지, 환기 댐퍼·팬이 실제로 도는지 확인합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['버섯', '재배사', '습도', '환기', '위생', 'CO2'],
    relatedIds: const [
      'sensor-temp-humidity',
      'sensor-co2',
      'control-env',
      'overview-farm-types',
    ],
    sourceIds: const ['src-env-edu', 'src-mushroom'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'env-livestock',
    title: '축산',
    summary:
        '축사는 동물복지·환기·온열환경·급이·급수·질병 징후·사람·가축 안전을 함께 봅니다. 환기 정지는 치명적일 수 있어 경보·수동·비상 대응이 필수입니다.',
    category: '환경',
    difficulty: Difficulty.basic,
    contentType: ContentType.concept,
    farmTypes: const [FarmType.livestock],
    sections: [
      ContentSection(
        title: '관리 대상과 동물복지',
        body:
            '가축의 호흡·체온 조절·음수·사료 접근, 밀사·스트레스, 위생을 관리합니다. 스마트 장비는 복지와 안전을 돕기 위한 수단이며, 동물의 상태를 사람이 정기적으로 관찰하는 일을 대체하지 않습니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '환기·온열환경',
        body:
            '환기량, 온도·습도, 유해가스(필요 시 NH₃·CO₂ 등), 열 스트레스·한랭 스트레스를 모니터링합니다. 목표 환경은 축종·일령·밀도·계절에 따라 달라지므로 고정 숫자를 공식처럼 제시하지 않습니다.',
        bullets: const ['환기팬·입기·커튼', '온습도·(필요 시) 가스', '열/한랭 스트레스 관찰'],
      ),
      ContentSection(
        title: '급이·급수·질병 징후',
        body:
            '급이·급수 설비의 동작·소비 패턴 변화는 이상 신호일 수 있습니다. 식욕 저하, 호흡 이상, 설사, 폐사 증가 등은 현장 관찰·수의사 상담이 우선이며, 센서·카메라만으로 진단을 확정하지 마세요.',
      ),
      ContentSection(
        title: '제어·데이터·한계',
        body:
            '환기·냉방·난방·커튼을 단계·조건으로 제어하는 경우가 많습니다. 데이터는 경보·이력에 활용하고, AI 이상탐지는 알림으로 둡니다. 환기·급수 자동화를 끄더라도 동물이 위험에 빠지지 않게 수동 대안이 있어야 합니다.',
      ),
      ContentSection(
        title: '안전',
        body:
            '환기 고장·정전 시 질식·열사 위험이 큽니다. 경보(문자·사이렌), 비상 개방, UPS·예비전원 검토, 전기 감전·기계 끼임 방지, 출입·방역 수칙을 지키세요. 전기 공사는 자격자가 수행합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장확인',
        body: '매일 가축 상태·급수 확인, 팬 실동작, 알람 테스트, 비상 절차 숙지를 점검 목록에 넣습니다.',
        bullets: const ['동물 상태·급수 육안 확인', '환기 고장 알람 시험', '정전·통신 끊김 대응'],
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['축산', '동물복지', '환기', '온열환경', '급이', '급수', '질병징후', '정전'],
    relatedIds: const [
      'sensor-temp-humidity',
      'control-fault-safe',
      'hw-ups',
      'overview-farm-types',
      'control-manual-auto',
    ],
    sourceIds: const [
      'src-env-edu',
      'src-livestock-welfare',
      'src-farm-safety',
    ],
    verificationStatus: VerificationStatus.needsReview,
    checkedAt: '2026-07-23',
  ),
  SmartFarmContent(
    id: 'env-storage',
    title: '저장·선별',
    summary:
        '저장고·선별장은 온습도·가스·문 개폐·정전·작업자 안전이 핵심입니다. 품질 유지를 위한 환경 기록과 함께, 밀폐·냉동 설비의 안전 절차를 갖춥니다.',
    category: '환경',
    difficulty: Difficulty.basic,
    contentType: ContentType.concept,
    farmTypes: const [FarmType.storage],
    sections: [
      ContentSection(
        title: '관리 대상',
        body:
            '저장 온습도, (품목에 따라) CO₂·에틸렌 등 가스, 문·셔터, 냉동·제습·환기, 선별·이송 설비를 관리합니다. 품목·포장·입고 상태마다 적정 조건이 달라집니다.',
      ),
      ContentSection(
        title: '센서·제어·데이터',
        body:
            '온습도·문 열림·전력·이상 알람을 기록하고, 냉동·제습을 ON/OFF·히스테리시스·스케줄로 제어합니다. 목표 온습도는 품목·매뉴얼·거래처 기준을 따르며, 교재 숫자를 일괄 적용하지 마세요.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '위험·한계',
        body:
            '밀폐 공간의 가스·산소, 냉매 누출, 결로·감전, 도어 끼임, 정전 시 온도 일탈이 위험입니다. 자동 제어만 믿지 말고 경보·수동·출입 수칙을 병행합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '자동화 한계',
        body:
            '선별 품질·부패 판단은 사람·거래 규격이 중심인 경우가 많습니다. 비전 검사는 보조이며, 오분류를 전제로 샘플 확인이 필요합니다.',
        kind: SectionKind.expertNote,
      ),
      ContentSection(
        title: '현장확인',
        body: '기록 온도와 보조 로거 비교, 도어 패킹, 배수·결로, 비상 개방·경보를 주기적으로 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
    keywords: const ['저장', '저온저장', '선별', '온습도', '가스', '정전'],
    relatedIds: const [
      'sensor-temp-humidity',
      'sensor-co2',
      'hw-ups',
      'control-fault-safe',
      'overview-farm-types',
    ],
    sourceIds: const ['src-env-edu', 'src-storage'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
  ),
];
