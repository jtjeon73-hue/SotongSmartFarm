import '../models/smart_farm_content.dart';

/// Phase-2 센서·PLC 실무 심화 오버라이드 (기존 ID만 교체).
const Map<String, SmartFarmContent> phase2SensorPlcOverrides = {
  'sensor-temp-humidity': SmartFarmContent(
    id: 'sensor-temp-humidity',
    title: '온·습도 센서 실무',
    summary:
        '온·습도는 환기·보온·가습의 1차 입력입니다. 대표 위치·방수·결로·스케일·교차확인까지 맞춰야 자동 제어가 안전합니다.',
    category: '센서',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.general,
      FarmType.greenhouse,
      FarmType.livestock,
    ],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            '온도는 “지금 공기가 얼마나 뜨거운지”, 상대습도는 “그 공기가 물을 얼마나 머금고 있는지”입니다. 같은 절대습도라도 온도가 바뀌면 상대습도 숫자가 크게 흔들립니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '원리·출력 형태',
        body:
            '복합 프로브가 온·습도를 한 하우징에 담는 구성이 흔합니다. 출력은 0–10V·4–20mA·RS-485(Modbus 등)가 일반적이며, PLC 아날로그 모듈과 루프 전원·접지 방식이 맞아야 합니다.',
        bullets: const [
          '아날로그: 스케일·단선 처리가 필수',
          'RS-485: 주소·보레이트·종단 일치',
          '정확도 ≠ 분해능 — 교정·교차확인이 핵심',
        ],
      ),
      ContentSection(
        title: '설치·배선',
        body:
            '직사광·히터 토출·분무·출입문 바로 앞은 피하고, 작물·가축이 체감하는 높이의 대표 지점을 고릅니다. 실드 케이블은 한 점 접지 원칙을 따르고, 동력선과 묶지 않습니다.',
        kind: SectionKind.practical,
        bullets: const [
          '결로·물방울이 센서를 적시면 습도 급변',
          '필터·프로브 캡은 막히면 응답이 느려짐',
          '축사는 암모니아·분진용 내환경 제품 검토',
        ],
      ),
      ContentSection(
        title: '스케일링(일반식)',
        body:
            '아날로그 연결 시 공학값 변환은 선형 보간이 기본입니다. RawMin·RawMax는 PLC 모듈·센서 매뉴얼의 값이며, 이 교재는 특정 메이커 RAW 범위를 제시하지 않습니다.',
        kind: SectionKind.important,
        copyText:
            'EngineeringValue = EngMin + (Raw - RawMin) * (EngMax - EngMin) / (RawMax - RawMin)\n'
            '// RawMin·RawMax: 제조사/모듈 사양\n'
            '// EngMin·EngMax: 센서 측정 범위(예: 온도 °C, 습도 %RH)',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '4–20mA 루프 요점',
        body:
            '4mA를 0%로 쓰는 이유(라이브 제로)는 단선·전원 상실(≈0mA)과 정상 최저값을 구분하기 위함입니다. 루프 전원(트랜스미터/PLC 공급), 부담 저항, 과/저범위 표시를 매뉴얼대로 확인하세요.',
        kind: SectionKind.caution,
        bullets: const [
          '0mA ≈ 단선·전원 상실 후보 — “최저온”으로 오인 금지',
          '과범위·저범위는 센서/스케일/배선 이상 신호',
          '루프 공급 방식(2선/3선/4선)을 혼동하지 말 것',
        ],
      ),
      ContentSection(
        title: '진단 순서',
        body:
            '화면 값이 이상하면 먼저 현장 보조 온도계·습도계와 비교합니다. 차이가 크면 배선·전원 → 스케일 → 센서 오염/결로 → 통신 순으로 좁힙니다.',
        kind: SectionKind.practical,
        bullets: const [
          '한쪽만 튀면 위치·직사광·분무 영향 의심',
          '둘 다 틀리면 스케일·단위(°C/%RH) 재확인',
          '통신 타임아웃은 주소 충돌·종단·노이즈 점검',
        ],
      ),
      ContentSection(
        title: '안전',
        body:
            '잘못된 온습도로 환기·난방이 반대로 움직일 수 있습니다. 센서 이상·단선 시 자동을 유지하지 말고 수동 모드로 돌린 뒤 현장을 확인하세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '위험 상황',
        body:
            '밀폐 온실·축사에서 센서 고장으로 환기가 멈추면 고온·유해가스 위험이 급증합니다. “마지막 값 유지”가 항상 안전하지 않습니다.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '현장 확인',
        body: '설치 후·계절 전환 시 아래를 기록합니다.',
        kind: SectionKind.fieldCheck,
        bullets: const [
          '대표성: 작물 캐노피/가축 키 높이 일치 여부',
          '보조 계측과 ±허용차(현장 기준) 이내인지',
          '단선 모의 시 경보·수동 전환이 뜨는지',
          '필터·프로브 청소 주기와 최근 교정일',
        ],
      ),
      ContentSection(
        title: '현장검증 필요',
        body:
            '허용 오차·알람 임계·설치 높이는 시설·작물·축종에 따라 달라 현장 검증이 필요합니다. 교재 숫자를 공식 생육 기준으로 쓰지 마세요.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '제조사 매뉴얼',
        body:
            '정확도·응답시간·IP등급·배선도·레지스터 맵은 모델별로 다릅니다. 특정 PLC 주소·스케일 상수는 제조사·도면을 따르세요.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const ['온습도', '4-20mA', '스케일링', '결로', '교차확인', '라이브제로'],
    relatedIds: const [
      'sensor-calibration',
      'sensor-selection',
      'control-analog-scaling',
      'control-env',
      'sensor-weather',
      'env-livestock',
    ],
    sourceIds: const ['src-sensor-edu', 'src-calibration'],
    tocTitles: const [
      '쉽게 보기',
      '원리·출력 형태',
      '설치·배선',
      '스케일링(일반식)',
      '4–20mA 루프 요점',
      '진단 순서',
      '안전',
      '위험 상황',
      '현장 확인',
      '현장검증 필요',
      '제조사 매뉴얼',
    ],
  ),
  'sensor-soil-moisture': SmartFarmContent(
    id: 'sensor-soil-moisture',
    title: '토양수분 센서 실무',
    summary:
        '토양·배지 수분은 관수 판단의 참고값입니다. 토성·염분·접촉·깊이에 따라 절대 %가 달라지므로, 추세·교차확인·시간 상한과 함께 씁니다.',
    category: '센서',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.openField,
      FarmType.greenhouse,
      FarmType.orchard,
    ],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            '센서가 말하는 “수분”은 대개 전기적 특성(정전용량·유전율 등)에서 추정한 값입니다. 같은 밭에서도 돌·공기층·뿌리 밀도에 따라 점이 달라집니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '원리와 한계',
        body:
            '정전용량·TDR 계열이 흔하며, 제품마다 단위·교정 곡선이 다릅니다. EC(염분)·온도가 높으면 읽음값이 밀리거나 불안정해질 수 있습니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '설치·배선',
        body:
            '근권 목표 깊이에 프로브를 밀착하고, 돌·공동·과습 웅덩이를 피합니다. 케이블은 UV·설치 중 꺾임·침수에 취약하니 보호관·여유장을 둡니다.',
        kind: SectionKind.practical,
        bullets: const [
          '한 점으로 필드를 대표하기 어려움 → 다점·관수 후 관찰',
          '배지(코코피트 등)는 토성과 교정 곡선이 다름',
          '출력: 전압·4–20mA·RS-485 — 모듈과 일치',
        ],
      ),
      ContentSection(
        title: '스케일·단위',
        body:
            '공학 단위(체적수분 % 등)로 쓰려면 센서 사양의 EngMin·EngMax와 모듈 Raw 범위를 맞춰 선형 변환합니다. Raw 범위는 제조사/모듈 고유입니다.',
        copyText:
            'EngineeringValue = EngMin + (Raw - RawMin) * (EngMax - EngMin) / (RawMax - RawMin)\n'
            '// 토양수분: Eng 단위·범위는 제품 사양\n'
            '// RawMin/RawMax는 모듈·매뉴얼 확인 (교재 미제시)',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '관수 연동 주의',
        body:
            '수분 낮음 = 즉시 펌프 ON은 위험합니다. 누수·과습·염류 집적을 막으려면 최대 관수 시간, 수위·압력 인터록, 강우 금지, 수동 확인이 필요합니다.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단',
        body:
            '갑자기 0 또는 포화로 고정되면 접촉 불량·단선·스케일 오류를 의심합니다. 관수 직후 반응이 없으면 위치·깊이·공기층을 재설치하세요.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '안전',
        body: '센서 이상으로 연속 관수되면 침수·양분 유실·병해가 납니다. 고장 시 자동 관수를 멈추고 현장 확인을 우선합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장 확인',
        body: '관수 전·중·후 추세와 흙 감촉·중량(배지)을 비교합니다.',
        kind: SectionKind.fieldCheck,
        bullets: const [
          '다점 센서 간 편차 원인(토성·염류) 기록',
          '펄스/아날로그 스케일과 적산 유량 교차',
          '강우·기상 연동 시 오감지 여부',
        ],
      ),
      ContentSection(
        title: '현장검증',
        body:
            '목표 수분·관수량은 작물·단계·토성·기상·관수 방식에 따라 달라 현장검증이 필수입니다. 특정 작물 설정값을 이 교재에 고정하지 않습니다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '제조사 노트',
        body:
            '교정 곡선·온도보상·통신 레지스터는 모델별입니다. 배지용/토양용을 혼용하지 말고 매뉴얼의 설치 각·매설 깊이를 따르세요.',
        kind: SectionKind.manufacturer,
      ),
      ContentSection(
        title: '전문가 메모',
        body:
            '제어용으로 쓸수록 “추세+상한시간+인터록” 조합이 절대값 맹신보다 안전합니다. 연구용 고정밀 센서와 현장용 내구성을 구분하세요.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['토양수분', '배지', '관수', '정전용량', 'TDR', '인터록'],
    relatedIds: const [
      'control-env',
      'sensor-calibration',
      'sensor-level-flow',
      'control-interlock',
      'sensor-selection',
    ],
    sourceIds: const ['src-sensor-edu', 'src-calibration'],
    tocTitles: const [
      '쉽게 보기',
      '원리와 한계',
      '설치·배선',
      '스케일·단위',
      '관수 연동 주의',
      '진단',
      '안전',
      '현장 확인',
      '현장검증',
      '제조사 노트',
      '전문가 메모',
    ],
  ),
  'sensor-ph-ec': SmartFarmContent(
    id: 'sensor-ph-ec',
    title: 'pH·EC 센서 실무',
    summary: '양액·수질 제어의 핵심 전극입니다. 오염·건조·교정 주기가 짧아, 유지보수와 주입 인터록이 정확도보다 먼저입니다.',
    category: '센서',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.hydroponics],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.manufacturerManualRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            'pH는 산·염기 정도, EC는 전기전도로 염류(비료) 농도를 추정합니다. 둘 다 틀리면 원액 펌프가 잘못된 방향으로 움직일 수 있습니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '원리',
        body:
            'pH는 유리전극 전위, EC는 전극 간 도전율입니다. 트랜스미터가 0–10V·4–20mA·RS-485로 바꿔 PLC/컨트롤러에 넘기는 구성이 흔합니다.',
      ),
      ContentSection(
        title: '설치·유속·기포',
        body:
            '기포가 전극을 덮거나 유속이 극단이면 값이 뜁니다. 샘플링 라인·바이패스 설치 시 제조사 권장 유량·방향을 지키고, 온도 보정이 켜져 있는지 확인합니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '교정 절차(교육용)',
        body:
            '표준액으로 2점(또는 매뉴얼 지정) 교정 → 세척·보관액 확인 → 현장액과 휴대 측정기 교차 → 스케일/오프셋 기록. 제품마다 절차가 다르므로 매뉴얼이 우선입니다.',
        kind: SectionKind.flow,
        bullets: const [
          '교정 전 자동 주입·원액 펌프 금지(수동/인터록)',
          '날짜·담당·전후값·표준액 로트 기록',
          '건조·오염 전극은 교정 전에 복구 절차',
        ],
      ),
      ContentSection(
        title: '스케일 일반식',
        body:
            '트랜스미터 아날로그 출력을 PLC에서 공학단위로 바꿀 때 선형식을 씁니다. Raw·Eng 범위는 제조사 사양입니다.',
        copyText:
            'EngineeringValue = EngMin + (Raw - RawMin) * (EngMax - EngMin) / (RawMax - RawMin)\n'
            '// pH·EC Eng 범위: 트랜스미터 설정과 일치시킬 것\n'
            '// RawMin/RawMax: AI 모듈·매뉴얼 (특정 주소 미제시)',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '주입 제어와 인터록',
        body:
            '상·하한 경보, 최대 주입 시간, 교반·유량 확인, 수동 승인 없이 대량 원액 투입을 막습니다. “값이 낮다”만으로 연속 주입하지 마세요.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단',
        body: '느리게 반응하면 오염·막힘, 갑자기 치우치면 단선·접지·스케일, EC만 이상하면 전극 피막·염석출을 의심합니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '안전·위험',
        body:
            '잘못된 pH/EC로 강산·강알칼리·고농도 원액이 들어가면 작물 고사뿐 아니라 약품 취급 위험이 있습니다. 교정·점검 중 자동을 끄세요.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '현장 확인',
        body: '휴대 pH/EC와 온라인 값을 같은 샘플로 비교합니다.',
        kind: SectionKind.fieldCheck,
        bullets: const [
          '보관액·표준액 유효기간',
          '케이블 실드·접지·루프 전원',
          '주입 펌프 수동 정지·밸브 닫힘 확인',
        ],
      ),
      ContentSection(
        title: '제조사 필수',
        body:
            '전극 수명·교정 주기·온도보상·통신맵은 모델 의존입니다. 목표 pH·EC 처방값은 재배 지침·처방 담당이 정하며 이 교재는 제시하지 않습니다.',
        kind: SectionKind.manufacturer,
      ),
      ContentSection(
        title: '현장검증',
        body: '온라인 값과 실험실/휴대 측정 허용차는 현장·공정별로 합의합니다. 합의 전 자동 주입을 강하게 걸지 마세요.',
        kind: SectionKind.fieldValidation,
      ),
    ],
    keywords: const ['pH', 'EC', '양액', '전극', '교정', '주입인터록'],
    relatedIds: const [
      'env-hydroponics',
      'sensor-calibration',
      'control-analog-scaling',
      'control-interlock',
      'sensor-level-flow',
    ],
    sourceIds: const ['src-sensor-edu', 'src-hydroponics', 'src-calibration'],
    tocTitles: const [
      '쉽게 보기',
      '원리',
      '설치·유속·기포',
      '교정 절차(교육용)',
      '스케일 일반식',
      '주입 제어와 인터록',
      '진단',
      '안전·위험',
      '현장 확인',
      '제조사 필수',
      '현장검증',
    ],
  ),
  'sensor-level-flow': SmartFarmContent(
    id: 'sensor-level-flow',
    title: '수위·유량 센서 실무',
    summary:
        '탱크 수위와 배관 유량은 펌프 보호·넘침 방지·관수 적산의 뼈대입니다. 접점·아날로그·펄스를 구분하고 하드웨어 인터록과 함께 설계합니다.',
    category: '센서',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.general,
      FarmType.hydroponics,
      FarmType.openField,
    ],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            '수위는 “탱크에 물이 얼마나 있는지”, 유량은 “지금 얼마나 흐르는지/얼마나 흘렸는지”입니다. 펌프 공운전과 넘침은 센서보다 인터록으로 먼저 막습니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '종류·신호',
        body:
            '수위: 플로트(접점), 초음파·레이더·압력(연속). 유량: 터빈·전자·초음파, 출력은 접점·4–20mA·펄스·RS-485가 섞입니다.',
        bullets: const [
          '디지털 접점: 고/저수위 인터록에 유리',
          '아날로그: 연속 수위·유량 모니터링',
          '펄스: 리터/펄스 스케일로 적산',
        ],
      ),
      ContentSection(
        title: '설치·오차 요인',
        body:
            '거품·탁도·부착물, 배관 직관부 부족, 진동, 플로트 걸림이 대표 오차입니다. 초음파는 거품·증기에 약할 수 있어 조건에 맞는 원리를 고르세요.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '펄스·아날로그 스케일',
        body:
            '펄스는 “1펄스=몇 리터”를 제조사·유량계 명판에서 확인하고 PLC 카운터 스케일에 넣습니다. 아날로그는 일반 선형식을 씁니다.',
        kind: SectionKind.important,
        copyText:
            'EngineeringValue = EngMin + (Raw - RawMin) * (EngMax - EngMin) / (RawMax - RawMin)\n'
            '// 유량/수위 Eng 단위: m³/h, L/min, mm, % 등\n'
            '// 펄스: TotalLiters += PulseCount * LitersPerPulse\n'
            '// LitersPerPulse·Raw 범위는 명판/매뉴얼',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '펌프·밸브 인터록',
        body:
            '저수위 → 펌프 금지, 고수위 → 급수/회수 차단처럼 소프트웨어와 배선(직렬 접점)을 이중으로 두는 편이 안전합니다. 센서 고장 시 “펌프 계속”이 되지 않게 합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '위험',
        body:
            '고수위 실패는 침수·전기 사고, 저수위 실패는 펌프 소손으로 이어집니다. E-stop·전원 차단 경로와 별도로 수위 보호를 검토하세요.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '진단',
        body:
            '화면 수위와 실제 수면, 유량 적산과 탱크 체적 변화를 비교합니다. 펄스만 안 오면 배선·풀업·입력 필터·채터링을 봅니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '현장 확인',
        body: '정기적으로 플로트 동작·초음파 반사면·케이블 침수를 점검합니다.',
        kind: SectionKind.fieldCheck,
        bullets: const [
          '저/고수위 강제 조건에서 펌프·밸브 차단 여부',
          '적산 리셋·오버플로 정책 문서화',
          '바이패스·정비 시 인터록 우회 금지 표지',
        ],
      ),
      ContentSection(
        title: '현장검증',
        body:
            '알람 수위·유량 상한은 탱크 치수·펌프 용량·배관으로 현장 결정합니다. 교재에 고정 mm·L/min을 두지 않습니다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '제조사',
        body: '방폭·식품위생·전자유량계 접지·전극 재질은 유체에 맞게 선정합니다. 통신 주소·펄스폭은 매뉴얼을 따릅니다.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const ['수위', '유량', '펄스', '펌프보호', '공운전', '넘침'],
    relatedIds: const [
      'control-interlock',
      'control-env',
      'control-fault-safe',
      'env-hydroponics',
      'sensor-calibration',
      'safety-electrical',
    ],
    sourceIds: const [
      'src-sensor-edu',
      'src-control-safety',
      'src-electrical-safety',
    ],
    tocTitles: const [
      '쉽게 보기',
      '종류·신호',
      '설치·오차 요인',
      '펄스·아날로그 스케일',
      '펌프·밸브 인터록',
      '위험',
      '진단',
      '현장 확인',
      '현장검증',
      '제조사',
    ],
  ),
  'sensor-co2': SmartFarmContent(
    id: 'sensor-co2',
    title: 'CO₂ 센서 실무',
    summary:
        'CO₂는 환기·보광·축사 공기 관리의 참고 지표입니다. NDIR 특성·자동교정 함정·복합 환기 판단·고장 시 수동 환기를 함께 설계합니다.',
    category: '센서',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.greenhouse,
      FarmType.mushroom,
      FarmType.livestock,
      FarmType.storage,
    ],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.manufacturerManualRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            'CO₂ 숫자는 “공기 중 이산화탄소 농도”입니다. 온실에서는 광합성·환기 참고, 축사·저장고에서는 환기·밀집·안전 판단의 보조 지표로 씁니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '원리(NDIR 등)',
        body:
            '비분산 적외선(NDIR) 방식이 흔합니다. 광학부 오염·간섭가스·온도·습도가 오차에 영향을 줄 수 있어 필터·흡기구 관리가 중요합니다.',
      ),
      ContentSection(
        title: '설치 위치',
        body: '사람 호흡·히터·문 바로 앞보다 대표 공기 흐름 지점이 낫습니다. 너무 높거나 구석이면 제어가 현실과 어긋납니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '자동교정 주의',
        body:
            '일부 제품의 ABC 등 자동교정이 “주기적 최저=외기” 가정에 의존합니다. 상시 높은 농도 공간에서는 오히려 틀어질 수 있어 매뉴얼의 현장 교정 절차를 따릅니다.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '출력·스케일',
        body:
            '0–10V·4–20mA·RS-485 출력을 Eng 단위(ppm 등)로 변환할 때 선형 일반식을 쓰고, Raw 범위는 모듈 사양을 확인합니다. 특정 RAW·주소는 제시하지 않습니다.',
        copyText:
            'EngineeringValue = EngMin + (Raw - RawMin) * (EngMax - EngMin) / (RawMax - RawMin)\n'
            '// Eng: 보통 ppm 범위(제품 사양)\n'
            '// RawMin/RawMax: 제조사/AI 모듈',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '제어 연동',
        body:
            'CO₂만으로 창을 과도하게 닫으면 온습도·유해가스·열 스트레스가 커질 수 있습니다. 온습도·기상·가축 상태와 우선순위를 함께 보세요.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '진단',
        body:
            '값이 고정·급변하면 전원·필터·광학 오염·통신을 점검합니다. 외기 환기 후 기대 방향으로 움직이는지 현장검증합니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '안전',
        body:
            '센서 이상 시 환기를 “닫힘 유지”로 두면 위험할 수 있습니다. 축사·밀폐 공간은 복지·안전 관점의 수동/최소 환기 기준을 문서화하세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장 확인',
        body: '필터·흡기구, 전원 안정, 경보, 교차 측정(가능 시)을 주기화합니다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '제조사·현장검증',
        body:
            '측정 범위·정확도·교정 가스·통신맵은 모델별입니다. 목표 농도·환기 설정은 시설·축종·작물에 따라 현장·지침으로 정합니다.',
        kind: SectionKind.manufacturer,
      ),
      ContentSection(
        title: '전문가 메모',
        body: '저장고·버섯사는 목표 대역이 일반 온실과 다릅니다. “온실 예시”를 그대로 복사하지 마세요.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['CO2', 'NDIR', '환기', '자동교정', '축사', 'ppm'],
    relatedIds: const [
      'control-env',
      'sensor-calibration',
      'env-livestock',
      'sensor-temp-humidity',
      'sensor-weather',
      'sw-alarm',
    ],
    sourceIds: const [
      'src-sensor-edu',
      'src-livestock-welfare',
      'src-calibration',
    ],
    tocTitles: const [
      '쉽게 보기',
      '원리(NDIR 등)',
      '설치 위치',
      '자동교정 주의',
      '출력·스케일',
      '제어 연동',
      '진단',
      '안전',
      '현장 확인',
      '제조사·현장검증',
      '전문가 메모',
    ],
  ),
  'sensor-calibration': SmartFarmContent(
    id: 'sensor-calibration',
    title: '교정·점검·유지보수 실무',
    summary: '센서는 출하 정확도가 현장 정확도가 아닙니다. 비교·표준·기록·수동 격리·재시험까지 절차로 고정합니다.',
    category: '센서',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body: '교정은 “틀어진 자를 다시 맞추는 일”입니다. 분해능이 좋아도 기준이 틀리면 제어가 빗나갑니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '언제 하는가',
        body:
            '설치 직후, 주기(제품·위험도에 따라), 충격·침수·이상 경보 후, 시즌 전환 전. 제어에 쓰는 센서일수록 주기를 짧게·기록을 남깁니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '기본 흐름(교육용)',
        body:
            '자동 출력 위험 차단(수동) → 전원·배선 확인 → 보조 계측 비교 → 표준액/기준기 교정(해당 시) → 스케일·오프셋 기록 → 알람·인터록 재시험 → 라벨 부착.',
        kind: SectionKind.flow,
        bullets: const ['비교 측정', '조정·교정', '기록(날짜·담당·전후값)', '제어 연동 시험'],
      ),
      ContentSection(
        title: '배선·통신 점검',
        body:
            '극성·실드·접지, 4–20mA 루프 전원, RS-485 종단·주소 충돌, 부담 저항을 확인합니다. 주소·스케일 상수는 제조사 문서만 사용합니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '스케일 재확인 식',
        body: '교정 후에도 아날로그 경로가 있으면 선형 변환이 맞는지 양끝·중간점을 봅니다.',
        copyText:
            'EngineeringValue = EngMin + (Raw - RawMin) * (EngMax - EngMin) / (RawMax - RawMin)\n'
            '// 교정 후: 알려진 Eng에서 Raw가 기대 구간인지 확인\n'
            '// Raw 범위는 모듈 사양 — 임의 숫자 사용 금지',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '주의',
        body: '교정 중 자동이 살아 있으면 펌프·창·히터가 오동작할 수 있습니다. “강제 출력”으로 시험을 길게 끌지 마세요.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '안전',
        body:
            '전기·약품(표준액)·고소 작업은 자격·차단·보호구를 따릅니다. 원격에서 교정 모드를 무단 해제하지 않게 권한을 둡니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '진단 연계',
        body:
            '교정해도 안 맞으면 센서 수명·위치·간섭·데이터 품질(결측·스파이크)을 의심하고, 필요 시 예비 센서로 교체합니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '현장 확인',
        body: '교정 라벨·주기표·예비품·최근 이상 이력을 한곳에 둡니다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '현장검증',
        body:
            '허용 편차·주기는 공정 위험도와 제조사 권고를 반영해 현장 합의합니다. “한 달에 한 번” 같은 고정 문구를 맹신하지 마세요.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '제조사',
        body: '전극 보관·영점·스팬·펌웨어 교정 메뉴는 모델마다 다릅니다. 매뉴얼·교정 성적서를 우선합니다.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const ['교정', '점검', '스케일', '수동격리', '기록', '교차확인'],
    relatedIds: const [
      'sensor-ph-ec',
      'sensor-temp-humidity',
      'control-analog-scaling',
      'control-manual-auto',
      'ai-data-quality',
      'sensor-selection',
    ],
    sourceIds: const ['src-sensor-edu', 'src-calibration'],
    tocTitles: const [
      '쉽게 보기',
      '언제 하는가',
      '기본 흐름(교육용)',
      '배선·통신 점검',
      '스케일 재확인 식',
      '주의',
      '안전',
      '진단 연계',
      '현장 확인',
      '현장검증',
      '제조사',
    ],
  ),
  'sensor-selection': SmartFarmContent(
    id: 'sensor-selection',
    title: '센서 선정 실무 체크',
    summary:
        '스펙 숫자보다 목적·환경·출력 호환·유지보수·고장 시 안전이 먼저입니다. 샘플 설치로 노이즈·대표성을 확인한 뒤 확장합니다.',
    category: '센서',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            '좋은 센서는 “스펙표 1등”이 아니라 “우리 농장에서 고장 나지 않고, 틀린 줄 알고, 제어에 안전하게 붙는” 센서입니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '목적 정의',
        body: '알람용·피드백 제어용·기록/연구용을 구분합니다. 제어용일수록 정확도·중복·페일세이프 비용이 정당화됩니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '출력·PLC 호환',
        body:
            '접점 / 0–10V / 4–20mA / 펄스 / RS-485를 먼저 정하고, 보유 AI/DI 모듈·루프 전원·통신(Modbus RTU 등)과 맞춥니다.',
        bullets: const [
          '4–20mA: 장거리·노이즈에 유리한 편(설계 의존)',
          'RS-485: 주소·맵·게이트웨이 계획 필요',
          '펄스: 고속 입력·필터 사양 확인',
        ],
      ),
      ContentSection(
        title: '환경·보호',
        body:
            '습도·분무·분진·암모니아·직사광·진동·염수는 사무실용 센서를 빠르게 망가뜨립니다. IP·재질·보호함·서지(낙뢰)를 함께 봅니다.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '유지보수·수급',
        body: '교정 주기, 소모품(전극·필터), 케이블 길이, A/S·대체품 가능 여부를 견적 단계에서 문서화합니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '선정 체크리스트',
        body: '발주 전 아래를 표로 남기세요.',
        kind: SectionKind.fieldCheck,
        bullets: const [
          '측정 범위·단위·필요 정확도(목적 대비)',
          '출력·전원·IP·사용온도',
          'PLC/원격I/O·통신 호환',
          '교정 방법·주기·예비품',
          '고장 시 안전 방향(열림/닫힘/정지)',
          '케이블·서지·접지 계획',
        ],
      ),
      ContentSection(
        title: '안전',
        body:
            '제어 루프에 넣는 센서는 단선·이상값 처리를 설계에 포함합니다. “값만 싸게” 고르면 나중에 인터록 비용이 큽니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '샘플→확장',
        body: '1대 샘플로 노이즈·대표성·유지보수를 본 뒤 대수를 늘립니다. 전량 선도입은 실패 비용이 큽니다.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '교육용 한계',
        body: '이 항목은 선정 사고방식을 위한 교육 예시입니다. 특정 브랜드·가격·보증을 추천하지 않습니다.',
        kind: SectionKind.expertNote,
      ),
      ContentSection(
        title: '제조사·규정',
        body:
            '방폭·식품·축사 가스 등 특수 요건은 해당 규정·제조사 인증을 확인하세요. 전기 인입은 자격 시공을 전제로 합니다.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const ['선정', 'IP', '4-20mA', 'RS-485', '호환', '유지보수'],
    relatedIds: const [
      'sensor-calibration',
      'control-analog-scaling',
      'comm-modbus-rtu',
      'comm-rs',
      'sensor-temp-humidity',
      'safety-electrical',
    ],
    sourceIds: const ['src-sensor-edu', 'src-modbus', 'src-electrical-safety'],
    tocTitles: const [
      '쉽게 보기',
      '목적 정의',
      '출력·PLC 호환',
      '환경·보호',
      '유지보수·수급',
      '선정 체크리스트',
      '안전',
      '샘플→확장',
      '교육용 한계',
      '제조사·규정',
    ],
  ),
  'control-basics': SmartFarmContent(
    id: 'control-basics',
    title: '제어 기초 실무',
    summary:
        '측정→판단→구동을 규칙으로 묶되, 모드·인터록·시간 제한·사람 확인이 빠진 자동화는 위험합니다. ON/OFF부터 시퀀스·우선순위까지 한 지도로 정리합니다.',
    category: '제어',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            '제어는 “센서가 말한 것”을 곧이곧대로 따르는 일이 아니라, 조건·시간·안전망을 통과한 뒤에만 펌프·팬·밸브를 움직이는 일입니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '자주 쓰는 유형',
        body: '현장 프로그램에 반복되는 뼈대입니다.',
        kind: SectionKind.important,
        bullets: const [
          'ON/OFF + 히스테리시스',
          '스케줄·최대/최소 운전시간',
          '조건 금지(강우·저수위 등)',
          '시퀀스(스텝 상태머신)',
          '인터록·우선순위',
          'PID 등 연속 제어(필요 시)',
          'E-stop·수동 개입',
        ],
      ),
      ContentSection(
        title: '히스테리시스 이유',
        body:
            '켜짐/꺼짐 임계를 같게 두면 경계에서 출력이 깜빡입니다. 창·접촉기 수명과 작물 스트레스를 위해 간격을 둡니다. 구체 °C·%는 현장 결정입니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '모드와 명령 권한(교육용)',
        body: '모드별로 허용/금지 명령을 문서화하세요. 아래는 교육용 골격이며 현장 표준에 맞게 수정합니다.',
        kind: SectionKind.flow,
        bullets: const [
          '정지: 운전 지령 금지, 상태 감시·리셋 절차만',
          '수동: 개별 출력 허용(인터록·E-stop 유효)',
          '자동: 검증된 규칙만 실행',
          '원격: 권한·감사로그 있는 지령만',
          '점검: 자동 금지, 시험 출력은 격리·감시',
          '고장: 위험 출력 차단, 경보·진단',
          '비상: 즉시 안전 정지, 원인 제거 전 재기동 금지',
        ],
      ),
      ContentSection(
        title: '의사코드(교육용)',
        body: '아래는 특정 PLC 주소·메이커 문법이 아닌 의사코드입니다. 래더/ST로 옮길 때 매뉴얼을 따르세요.',
        kind: SectionKind.expertNote,
        copyText:
            '// educationalExample / pseudocode — not vendor ST\n'
            'if mode == EMERGENCY or ESTOP: all_hazard_outputs := OFF; return\n'
            'if interlock_violated: inhibit_related_outputs\n'
            'if mode == MANUAL: accept_local_commands_only\n'
            'else if mode == AUTO: run_verified_rules()\n'
            'else if mode == REMOTE: run_authorized_commands()\n'
            'else: hold_safe_state',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: 'AI·화면 vs 실제 출력',
        body: '분석·AI는 권고, HMI 버튼은 요청, PLC 출력은 인터록을 통과한 결과입니다. 셋을 직접 단락하지 마세요.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '안전',
        body: '프로그램 변경·강제 ON은 사고 위험이 큽니다. 백업, 짧은 시험, 자격자, E-stop 시험을 전제로 합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장 확인',
        body: '구동기별 수동 시험 → 자동 규칙 단시간 시험 → 인터록 모의 → 기록. “화면만 정상”을 합격으로 치지 마세요.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '교육용 한계',
        body: '작물 목표값·PLC 디바이스 주소를 이 항목에 넣지 않습니다. 도면·매뉴얼·재배 지침이 권위입니다.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const ['제어', '히스테리시스', '모드', '인터록', '의사코드', 'E-stop'],
    relatedIds: const [
      'control-env',
      'control-interlock',
      'control-manual-auto',
      'control-scan-cycle',
      'control-fault-safe',
      'ai-data-quality',
    ],
    sourceIds: const [
      'src-control-edu',
      'src-control-safety',
      'src-ai-caution',
    ],
    tocTitles: const [
      '쉽게 보기',
      '자주 쓰는 유형',
      '히스테리시스 이유',
      '모드와 명령 권한(교육용)',
      '의사코드(교육용)',
      'AI·화면 vs 실제 출력',
      '안전',
      '현장 확인',
      '교육용 한계',
    ],
  ),
  'control-scan-cycle': SmartFarmContent(
    id: 'control-scan-cycle',
    title: '스캔 사이클 실무',
    summary:
        'PLC는 입력 샘플 → 논리 실행 → 출력 갱신을 반복합니다. 스캔 시간·입력 필터·통신 부하를 모르면 채터링과 “가끔 안 되는” 고장이 납니다.',
    category: '제어',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.manufacturerManualRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            '한 번의 “스캔”은 눈이 깜빡이는 것처럼 세상을 한 번 보고(입력), 생각하고(프로그램), 손발을 움직이는(출력) 주기입니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기본 흐름',
        body: '제품마다 통신·인터럽트·특수 태스크가 추가되지만, 교육용 골격은 아래와 같습니다.',
        kind: SectionKind.flow,
        bullets: const [
          '입력 읽기(이미지)',
          '프로그램(논리) 실행',
          '출력 쓰기',
          '진단·통신 등(기종 의존)',
          '다음 스캔',
        ],
      ),
      ContentSection(
        title: '놓치는 펄스·느린 응답',
        body:
            '스캔보다 짧은 접점 펄스는 못 볼 수 있고, 무거운 프로그램·네트워크 부하는 스캔을 늘려 창·릴레이 응답을 늦춥니다. 고속 카운터·입력 캡처는 매뉴얼 기능을 검토하세요.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '채터링 대책',
        body:
            '히스테리시스, 입력 필터, ON/OFF 지연 타이머, 최소 운전시간을 조합합니다. “필터만 키우면” 비상·리밋 반응도 늦어질 수 있어 신호 종류별로 분리합니다.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '의사코드(교육용)',
        body: '스캔 관점의 의사코드이며 실제 태스크 배분은 제조사 IDE 설정을 따릅니다.',
        copyText:
            '// educationalExample — not a real PLC scan API\n'
            'loop:\n'
            '  read_inputs_to_image()\n'
            '  execute_program_logic()\n'
            '  write_output_image()\n'
            '  // update diagnostics / cyclic comms per vendor\n'
            'end loop',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '진단',
        body:
            '출력이 빠르게 깜빡이면 임계·히스테리시스·필터부터, 반응이 늦으면 스캔 시간·통신 타임아웃·과부하 태스크를 제조사 진단으로 확인합니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '안전',
        body:
            '비상정지·안전 관련 정지를 일반 스캔 논리에만 맡기지 마세요. 하드웨어 경로·안전 PLC/릴레이 요건은 위험도에 따라 검토합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '위험',
        body:
            '스캔 지연으로 리밋·과부하를 늦게 보면 모터·창 기구가 파손될 수 있습니다. 중요 보호는 별도 감시·하드웨어를 검토하세요.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '현장 확인',
        body: '진단 모니터의 스캔 최대/평균, 입력 필터 설정, 창·접촉기 채터링 유무를 기록합니다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '제조사',
        body: '스캔·주기 태스크·즉시 갱신 출력·입력 응답 시간은 시리즈마다 다릅니다. 매뉴얼의 타이밍 표를 확인하세요.',
        kind: SectionKind.manufacturer,
      ),
      ContentSection(
        title: '전문가 메모',
        body: '통신 센서·원격 I/O는 “스캔”과 별 주기로 갱신될 수 있습니다. 타임스탬프·타임아웃을 제어 조건에 넣으세요.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['스캔', '입력필터', '채터링', '응답지연', '태스크'],
    relatedIds: const [
      'control-basics',
      'control-interlock',
      'control-fault-safe',
      'control-analog-scaling',
      'comm-modbus-rtu',
    ],
    sourceIds: const ['src-control-edu', 'src-control-safety'],
    tocTitles: const [
      '쉽게 보기',
      '기본 흐름',
      '놓치는 펄스·느린 응답',
      '채터링 대책',
      '의사코드(교육용)',
      '진단',
      '안전',
      '위험',
      '현장 확인',
      '제조사',
      '전문가 메모',
    ],
  ),
  'control-interlock': SmartFarmContent(
    id: 'control-interlock',
    title: '인터록·우선순위 실무',
    summary:
        '모순·위험 동작을 막아 사람·가축·작물·설비를 보호합니다. 소프트웨어 조건과 하드웨어 차단을 구분하고, 시험으로 증빙합니다.',
    category: '제어',
    difficulty: Difficulty.expert,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            '인터록은 “하고 싶어도 조건이 안 되면 못 하게” 만드는 브레이크입니다. 우선순위는 여러 브레이크·핸들 중 누가 이기는지입니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '농장에서 흔한 예',
        body:
            '저수위→펌프 금지, 강풍→천창 개방 금지, 문 열림→운전 금지, 상호 배타(급수/배수 동시 금지) 등. 구체 임계는 현장·설비 기준입니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '우선순위(교육용)',
        body: '일반적으로 아래 순이 안전합니다. 현장 표준으로 문서화·교육하세요.',
        kind: SectionKind.flow,
        bullets: const [
          '비상정지(E-stop)',
          '안전·설비 인터록',
          '수동(로컬)',
          '자동(스케줄·규칙)',
          '원격·AI 권고(최하위, 직접 출력 금지 권장)',
        ],
      ),
      ContentSection(
        title: '허용/금지 명령 매트릭스',
        body:
            '모드×명령 표를 만듭니다. 예: 비상·고장 모드에서 원격 기동 금지, 점검 모드에서 자동 시퀀스 금지, 수동에서도 E-stop·수위 인터록은 유효.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '하드 vs 소프트',
        body:
            '중요 정지는 접점 직렬·안전릴레이·접촉기 차단 등 하드웨어 경로를 검토하고, PLC 비트만으로 “안전 완료”라고 단정하지 마세요. 요건은 위험도·규정에 따릅니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '의사코드(교육용)',
        body: '래더/ST 이식 전 논리 검증용 의사코드입니다. 디바이스 주소는 넣지 않습니다.',
        copyText:
            '// educationalExample / pseudocode\n'
            'pump_permit := (mode != EMERGENCY) AND (not ESTOP)\n'
            '              AND level_ok AND not leak_alarm\n'
            '              AND (mode == MANUAL OR mode == AUTO OR mode == REMOTE)\n'
            'if not pump_permit: PumpCmd := OFF\n'
            '// NEVER bypass ESTOP / safety chain in software alone',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '주의',
        body:
            '일시 우회(바이패스)는 정비 중 사고의 단골 원인입니다. 우회 시 키 스위치·타이머·경보·기록·복귀 점검을 강제하세요.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '위험',
        body:
            '인터록을 상시 강제 ON으로 막아두면 공운전·끼임·침수 위험이 그대로 노출됩니다. 강제 접점은 시험 후 즉시 해제·증빙합니다.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '시험·현장 확인',
        body: '저수위·강풍 입력 등 조건을 안전하게 모의해 출력이 실제로 막히는지 확인하고 성적서를 남깁니다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '현장검증',
        body: '인터록 목록·우선순위표는 설비마다 다릅니다. 시운전에서 빠진 조합이 없는지 현장검증이 필요합니다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '제조사·안전기준',
        body: '안전 관련 기기는 제조사 매뉴얼과 해당 안전 설계 관행을 따르세요. 이 교재는 인증 대체물이 아닙니다.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const ['인터록', '우선순위', 'E-stop', '바이패스', '펌프보호'],
    relatedIds: const [
      'control-fault-safe',
      'control-manual-auto',
      'sensor-level-flow',
      'control-basics',
      'control-env',
      'safety-electrical',
      'sw-alarm',
    ],
    sourceIds: const [
      'src-control-edu',
      'src-control-safety',
      'src-kosha',
      'src-electrical-safety',
    ],
    tocTitles: const [
      '쉽게 보기',
      '농장에서 흔한 예',
      '우선순위(교육용)',
      '허용/금지 명령 매트릭스',
      '하드 vs 소프트',
      '의사코드(교육용)',
      '주의',
      '위험',
      '시험·현장 확인',
      '현장검증',
      '제조사·안전기준',
    ],
  ),
  'control-analog-scaling': SmartFarmContent(
    id: 'control-analog-scaling',
    title: '아날로그 스케일링 실무',
    summary:
        '4–20mA·0–10V·디지털 카운트를 공학단위로 바꾸는 절차입니다. 잘못된 스케일은 잘못된 환기·관수·주입으로 이어집니다.',
    category: '제어',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.manufacturerManualRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            '스케일링은 “전기 신호 눈금”을 “℃·%·m³/h 눈금”으로 옮기는 자 맞추기입니다. 자의 양끝을 잘못 잡으면 모든 중간값이 틀립니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '일반 변환식',
        body:
            '선형 센서·모듈을 전제로 한 교육용 일반식입니다. RawMin·RawMax는 제조사/모듈 사양이며 교재가 특정 PLC RAW를 정하지 않습니다.',
        kind: SectionKind.important,
        copyText:
            'EngineeringValue = EngMin + (Raw - RawMin) * (EngMax - EngMin) / (RawMax - RawMin)\n'
            '// EngMin/EngMax: 센서 측정 범위\n'
            '// RawMin/RawMax: AI 모듈·트랜스미터 사양 (manufacturer specific)',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '4–20mA 핵심',
        body:
            '4mA≠“끊김”. 라이브 제로로 단선·전원상실(≈0mA)과 정상 최저를 구분합니다. 루프 전원, 극성, 부담 저항, 과/저범위 플래그를 확인하세요.',
        kind: SectionKind.caution,
        bullets: const [
          '≈0mA: 단선·전원·배선 후보 → 최저 공학값으로 오인 금지',
          '<4mA 또는 >20mA: 과/저범위·고장 처리 설계',
          '2선/3선/4선·루프 공급 주체(센서/PLC) 일치',
        ],
      ),
      ContentSection(
        title: '0–10V와의 혼동',
        body:
            '전압형은 선로 전압강하·접지 루프에 더 민감할 수 있습니다. 모듈이 전류형인데 전압 스케일을 넣거나 그 반대면 全滅입니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '절차(교육용)',
        body:
            '사양 확인 → 배선·루프 전원 → 시뮬레이터/표준으로 Raw 확인 → Eng 스케일 설정 → 보조 계측 비교 → 단선 시 안전 동작 시험 → 기록.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '의사코드(교육용)',
        body: 'ST/래더 이식 전 검산용입니다. 라이브러리 FB 이름은 메이커마다 다릅니다.',
        copyText:
            '// educationalExample / pseudocode\n'
            'if Raw < LiveZeroFaultThreshold: // e.g. near 0 for 4-20mA loop\n'
            '  Eng := SafeFallback; RaiseFault; InhibitAuto\n'
            'else:\n'
            '  Eng := EngMin + (Raw - RawMin) * (EngMax - EngMin) / (RawMax - RawMin)\n'
            '  if Eng < EngMin - margin or Eng > EngMax + margin: RaiseOutOfRange',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '진단',
        body:
            '양끝·중간 세 점으로 직선이 맞는지 봅니다. 한쪽만 틀리면 센서, 전 구간이 비율로 틀리면 스케일·단위·소수점입니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '안전',
        body: '단선 시 0℃·0%로 자동 제어가 돌면 위험합니다. 고장값·홀드·수동 전환·경보를 명시하세요.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '현장 확인',
        body: '화면 단위 라벨(℃, %RH, m³/h)과 도면 Eng 범위, 최근 교정 기록을 대조합니다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '제조사',
        body: 'RAW 정수 범위, 채널 필터, 단선 검출 비트는 모듈 매뉴얼에만 있습니다. 추측 숫자를 넣지 마세요.',
        kind: SectionKind.manufacturer,
      ),
      ContentSection(
        title: '현장검증',
        body: '허용 오차·알람 마진은 공정별로 합의합니다. 합의 전 강제어 루프에 넣지 마세요.',
        kind: SectionKind.fieldValidation,
      ),
    ],
    keywords: const ['스케일링', '4-20mA', '라이브제로', '0-10V', '단선', '공학단위'],
    relatedIds: const [
      'sensor-temp-humidity',
      'sensor-ph-ec',
      'sensor-calibration',
      'control-basics',
      'comm-modbus-rtu',
    ],
    sourceIds: const ['src-control-edu', 'src-sensor-edu'],
    tocTitles: const [
      '쉽게 보기',
      '일반 변환식',
      '4–20mA 핵심',
      '0–10V와의 혼동',
      '절차(교육용)',
      '의사코드(교육용)',
      '진단',
      '안전',
      '현장 확인',
      '제조사',
      '현장검증',
    ],
  ),
  'control-manual-auto': SmartFarmContent(
    id: 'control-manual-auto',
    title: '수동·자동·원격 모드 실무',
    summary:
        '정지·수동·자동·원격·점검·고장·비상 모드를 구분해 허용/금지 명령을 고정합니다. 수동에서도 인터록·E-stop은 살아 있어야 합니다.',
    category: '제어',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            '자동은 편하지만, 센서 오류·통신 끊김·점검·비상에는 사람이 핸들을 잡아야 합니다. 모드가 안 보이면 사고 조짐입니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '모드 정의(교육용)',
        body: '현장 표준에 맞게 이름을 통일하세요.',
        kind: SectionKind.important,
        bullets: const [
          '정지(Stop): 운전 지령 없음',
          '수동(Manual): 로컬 개별 조작',
          '자동(Auto): 검증 규칙 실행',
          '원격(Remote): 권한 있는 원격 지령',
          '점검(Inspect): 시험·교정, 자동 금지',
          '고장(Fault): 위험 출력 억제·진단',
          '비상(Emergency): 즉시 안전 정지',
        ],
      ),
      ContentSection(
        title: '허용·금지 명령',
        body:
            '예: 비상/고장→기동·원격 자동 복귀 금지. 점검→자동 시퀀스·원격 기동 금지, 수동 시험만 격리 하에. 자동→개별 강제 출력 금지(또는 권한·감사). 원격→로컬 비상·수동보다 하위.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '전환 절차(교육용)',
        body:
            '상태·경보 확인 → 필요 출력 OFF → 모드 스위치/HMI 일치 → 개별 시험 → 감시 후 자동 복귀. AI·알림만으로 모드를 바꾸지 마세요.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '의사코드(교육용)',
        body: '모드 게이트 예시입니다. 주소·코일 번호는 없습니다.',
        copyText:
            '// educationalExample / pseudocode\n'
            'case mode:\n'
            '  EMERGENCY, FAULT:\n'
            '    deny(start, remote_auto_resume)\n'
            '    allow(ack_alarm_after_safe)\n'
            '  INSPECT:\n'
            '    deny(auto_sequence, remote_start)\n'
            '    allow(local_jog_with_interlocks)\n'
            '  MANUAL:\n'
            '    allow(local_commands); deny(auto_write_over_manual)\n'
            '  AUTO:\n'
            '    allow(verified_rules); deny(unauth_force)\n'
            '  REMOTE:\n'
            '    allow(authorized_cmds); local_estop_and_manual_override_wins\n'
            '  STOP:\n'
            '    deny(all_run_cmds)',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '주의',
        body: '현장 셀렉터와 HMI 모드가 어긋나면 “화면은 자동, 현장은 수동” 사고가 납니다. 불일치 경보를 두세요.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '안전',
        body: '수동=보호 해제 가 되어서는 안 됩니다. E-stop·수위·리밋은 모든 운전 모드에서 유효해야 합니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '원격 특별 주의',
        body: '원격 기동은 시야·인원 확인·권한이 전제입니다. 상세는 원격 안전 항목과 함께 보세요.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '현장 확인',
        body: '중요 구동기마다 수동 ON/OFF, 자동 진입/탈출, 원격 거부(권한 없음)를 정기 시험합니다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '현장검증',
        body: '모드 매트릭스·권한 표는 조직·설비마다 달라 현장검증·교육이 필요합니다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '제조사·HMI',
        body: '모드 태그·인터록 FB·권한 레벨은 플랫폼마다 다릅니다. 프로젝트 매뉴얼을 따르세요.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const ['수동', '자동', '원격', '모드', '권한', 'HMI'],
    relatedIds: const [
      'control-interlock',
      'control-fault-safe',
      'control-basics',
      'safety-remote',
      'sw-alarm',
      'control-env',
    ],
    sourceIds: const ['src-control-edu', 'src-control-safety'],
    tocTitles: const [
      '쉽게 보기',
      '모드 정의(교육용)',
      '허용·금지 명령',
      '전환 절차(교육용)',
      '의사코드(교육용)',
      '주의',
      '안전',
      '원격 특별 주의',
      '현장 확인',
      '현장검증',
      '제조사·HMI',
    ],
  ),
  'control-env': SmartFarmContent(
    id: 'control-env',
    title: '환경 제어 패턴 실무',
    summary:
        '관수는 Idle→…→Completed/Fault 상태머신으로, 환기는 히스테리시스·풍속·강우 우선순위로 설계합니다. 작물 설정값은 현장·지침에서 정합니다.',
    category: '제어',
    difficulty: Difficulty.expert,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.greenhouse,
      FarmType.mushroom,
      FarmType.hydroponics,
    ],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            '환경제어는 “숫자 하나”가 아니라 순서(시퀀스)와 금지조건(기상·수위·모드)의 조합입니다. 목표 ℃·수분 %는 이 교재에 고정하지 않습니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '관수 상태머신',
        body:
            '교육용 골격입니다. Idle → Preconditions → PumpStart → ValveOpen → Irrigating → Verification → FlushOrStop → Completed 또는 Fault.',
        kind: SectionKind.flow,
        bullets: const [
          'Preconditions: 모드·수위·압력·강우·누수·시간창',
          'PumpStart → ValveOpen 순서(공운전·수격 완화 설계)',
          'Irrigating: 최대시간·유량 감시',
          'Verification: 적산·수위 변화·이상 없으면 다음',
          'FlushOrStop: 필요 시 배관 정리 후 정지',
          'Fault: 안전 정지·경보·원인 래치',
        ],
      ),
      ContentSection(
        title: '관수 의사코드(교육용)',
        body: '래더/ST용 의사코드이며 디바이스 주소·초 단위 설정은 없습니다.',
        copyText:
            '// educationalExample / irrigation state machine\n'
            'state Idle:\n'
            '  if start_request and preconditions_ok: -> Preconditions\n'
            'state Preconditions:\n'
            '  if not preconditions_ok: -> Fault\n'
            '  else: -> PumpStart\n'
            'state PumpStart:\n'
            '  start_pump; if pump_run_fb: -> ValveOpen else if timeout: -> Fault\n'
            'state ValveOpen:\n'
            '  open_valve; if valve_open_fb: -> Irrigating else if timeout: -> Fault\n'
            'state Irrigating:\n'
            '  if max_time or target_volume or abort: -> Verification\n'
            '  if leak or low_level or estop: -> Fault\n'
            'state Verification:\n'
            '  if checks_ok: -> FlushOrStop else -> Fault\n'
            'state FlushOrStop:\n'
            '  close_valve; stop_pump; -> Completed\n'
            'state Completed: -> Idle\n'
            'state Fault: inhibit_outputs; await_reset_after_safe',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '환기 히스테리시스',
        body:
            '온도(또는 복합 지수)로 창/팬 단계를 올릴 때와 내릴 때 임계를 다르게 두어 채터링을 줄입니다. 구체 임계는 시설·작물·시즌 현장값입니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '풍속·강우 우선',
        body:
            '강풍·강우 신호가 오면 개방 지령보다 폐쇄·관수 금지 등 보호가 우선하는 편이 안전합니다. 오감지·통신 지연을 전제로 수동 확인 경로를 둡니다.',
        kind: SectionKind.caution,
        bullets: const [
          '우선 예: E-stop > 풍속/강우 보호 > 수동 > 자동 환기/관수',
          '기상 센서 고장 시 “항상 개방” 또는 “항상 폐쇄” 중 안전쪽을 문서화',
          '축사는 열 스트레스·유해가스를 별도 우선순위로 검토',
        ],
      ),
      ContentSection(
        title: '구동기 모순 방지',
        body: '난방과 최대 환기, 관수와 배수 이상, 차광과 보광이 동시에 싸우지 않게 인터록합니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '안전',
        body:
            '시퀀스 도중 통신·센서 실패 시 밸브·펌프를 안전한 쪽으로 두고 Fault로 갑니다. “마지막 상태 유지”가 침수·고온을 키울 수 있습니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '진단',
        body:
            '상태 번호·진입 시각·실패 원인(수위·유량·타임아웃)을 로그로 남겨 재현합니다. 화면 스텝과 현장 밸브 위치가 다르면 FB(피드백)부터 봅니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '현장 확인',
        body: '건식 시퀀스(물 없이 허가된 범위)와 실수 시퀀스를 구분해 시험하고, 강우·풍속 모의로 금지 조건을 확인합니다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '현장검증',
        body: '목표 온습도·관수량·단계별 설정은 품종·생육·지역·계절에 따라 달라 현장검증이 필수입니다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '교육용·제조사',
        body: '상태 이름·타이머 값은 예시입니다. 실제 태그·주소·기구 리밋은 도면·매뉴얼을 따릅니다.',
        kind: SectionKind.manufacturer,
      ),
      ContentSection(
        title: '전문가 메모',
        body:
            'PID는 튜닝·센서 품질·액추에이터 여유가 있을 때 검토합니다. 입에서는 상태머신+히스테리시스+인터록이 먼저인 경우가 많습니다.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['환경제어', '관수', '상태머신', '히스테리시스', '강우', '풍속'],
    relatedIds: const [
      'control-basics',
      'control-interlock',
      'sensor-soil-moisture',
      'sensor-weather',
      'sensor-temp-humidity',
      'env-hydroponics',
      'control-manual-auto',
    ],
    sourceIds: const ['src-control-edu', 'src-control-safety', 'src-rda'],
    tocTitles: const [
      '쉽게 보기',
      '관수 상태머신',
      '관수 의사코드(교육용)',
      '환기 히스테리시스',
      '풍속·강우 우선',
      '구동기 모순 방지',
      '안전',
      '진단',
      '현장 확인',
      '현장검증',
      '교육용·제조사',
      '전문가 메모',
    ],
  ),
  'control-fault-safe': SmartFarmContent(
    id: 'control-fault-safe',
    title: '고장·정전·페일세이프 실무',
    summary:
        '단선·통신두절·PLC정지·정전을 전제로 안전 방향·경보·복전 시퀀스·훈련을 설계합니다. “마지막 출력 유지”가 항상 정답이 아닙니다.',
    category: '제어',
    difficulty: Difficulty.expert,
    contentType: ContentType.troubleshooting,
    farmTypes: const [FarmType.general, FarmType.livestock],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '쉽게 보기',
        body:
            '페일세이프는 “고장 났을 때 덜 위험한 쪽으로 넘어가는 약속”입니다. 온실 고온과 축사 환기는 약속이 다를 수 있습니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '시나리오별 안전 방향',
        body:
            '센서 단선·통신 두절·PLC 스톱·동력 상실마다 창·팬·펌프·히터의 기본 자세를 표로 정합니다. 축사는 최소 환기·경보가 생명과 직결될 수 있습니다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '정전·UPS·복전',
        body:
            'UPS 범위를 제어·통신·필수 환기 등으로 한정해 문서화합니다. 복전 시 동시 기동 충격, 자동 재시작 허용 여부, 수동 확인 후 재개를 절차로 남깁니다.',
        kind: SectionKind.practical,
        bullets: const ['필수 부하 목록', '복전 시퀀스(스태거 기동)', '알람·통보 경로'],
      ),
      ContentSection(
        title: 'E-stop·경보',
        body:
            '비상정지는 접근 가능한 위치에, 리셋은 원인 제거 후 의도적으로. 경보 폭주(알람 홍수)를 줄이도록 억제·우선순위를 둡니다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '진단 흐름',
        body:
            '사람·가축·설비 안전 확보 → 수동/비상 확인 → 전원·통신·센서 → 구동기 → 로그 → 제조사/전기 자격자. AI 진단은 참고만.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '의사코드(교육용)',
        body: '고장 시 게이트 예시입니다. 안전 인증 논리를 대체하지 않습니다.',
        copyText:
            '// educationalExample / pseudocode — not a safety-certified program\n'
            'if ESTOP or critical_power_loss:\n'
            '  enter EMERGENCY; hazard_outputs := SafeDirection\n'
            'else if sensor_wire_break or comm_timeout:\n'
            '  enter FAULT; inhibit_auto; apply_scenario_safe_state\n'
            'else if plc_stop:\n'
            '  rely_on_hardware_fail_path; annunciate\n'
            '// after mains restore: stagger_starts only if policy allows',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '주의',
        body: '통신 두절 시 원격만으로 재기동하지 마세요. 현장 확인·모드 권한이 먼저입니다.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '위험',
        body:
            '정전 후 자동 전개동으로 펌프·히터가 한꺼번에 붙으면 차단기 트립·화재·작물 피해가 날 수 있습니다. 스태거와 점검 재개를 지키세요.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '현장 확인',
        body: '가능한 범위의 정전 모의, E-stop, 경보, 예비 부품·연락망, 축사 비상 환기 경로를 점검합니다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '현장검증',
        body:
            '시나리오표·복전 정책은 시설·축종·전력 사정마다 달라 현장검증이 필요합니다. 전기 작업은 자격·안전기준을 따릅니다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '제조사·공적 자료',
        body:
            'UPS·차단기·안전릴레이·PLC 진단 비트는 매뉴얼을 따릅니다. 전기·산업안전은 관련 기관 안내를 참고하되, 본 교재가 법적 판단을 대체하지 않습니다.',
        kind: SectionKind.manufacturer,
      ),
      ContentSection(
        title: '전문가 메모',
        body: '페일세이프는 “한 번 코딩”이 아니라 훈련·경보 응답·예비품까지 포함한 운영입니다.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['페일세이프', '정전', 'UPS', 'E-stop', '복전', '통신두절'],
    relatedIds: const [
      'control-interlock',
      'control-manual-auto',
      'env-livestock',
      'sw-alarm',
      'safety-electrical',
      'safety-remote',
      'control-scan-cycle',
    ],
    sourceIds: const [
      'src-control-edu',
      'src-control-safety',
      'src-electrical-safety',
      'src-kesco',
      'src-kosha',
      'src-livestock-welfare',
    ],
    tocTitles: const [
      '쉽게 보기',
      '시나리오별 안전 방향',
      '정전·UPS·복전',
      'E-stop·경보',
      '진단 흐름',
      '의사코드(교육용)',
      '주의',
      '위험',
      '현장 확인',
      '현장검증',
      '제조사·공적 자료',
      '전문가 메모',
    ],
  ),
};
