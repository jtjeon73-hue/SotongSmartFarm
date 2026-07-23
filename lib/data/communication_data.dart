import '../models/smart_farm_content.dart';

/// 스마트팜 통신 교육 콘텐츠.
/// 무선이 항상 우월하거나 유선이 절대 고장 나지 않는다고 단정하지 않는다.
/// 인터넷 단절 시 로컬 제어 유지가 핵심이다.
const List<SmartFarmContent> communicationContents = [
  SmartFarmContent(
    id: 'comm-basics',
    title: '스마트팜 통신 기초',
    summary:
        '센서·PLC·게이트웨이·모니터가 데이터를 주고받는 경로를 이해하고, '
        '인터넷이 끊겨도 로컬에서 관수·환기 등 필수 제어가 가능해야 한다.',
    category: '통신',
    difficulty: Difficulty.beginner,
    contentType: ContentType.concept,
    farmTypes: [FarmType.general, FarmType.greenhouse],
    keywords: ['통신', '로컬제어', '게이트웨이', '프로토콜', '오프라인'],
    relatedIds: ['comm-offline', 'comm-farm-network', 'comm-diagnostics'],
    sourceIds: ['src-modbus', 'src-flutter'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '용도',
        body:
            '현장 장비 간 측정값·상태·제어요청을 전달한다. '
            '원격 감시와 클라우드 연동은 부가이며, 1차 목적은 현장 운전 지원이다.',
      ),
      ContentSection(
        title: '연결구조',
        body:
            '일반적인 흐름은 센서/액추에이터 ↔ PLC 또는 제어기 ↔ '
            '(선택) 게이트웨이 ↔ 로컬 PC/앱 ↔ (선택) 클라우드다.',
        bullets: ['필수 제어 루프는 가능하면 현장 내부에 둔다.', '클라우드·모바일은 감시·기록·승인 요청에 주로 쓴다.'],
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '장점',
        body: '표준 프로토콜을 쓰면 장비 교체·확장·진단이 쉬워진다.',
        bullets: ['데이터 공유', '원격 확인', '이력 기록', '다중 구역 통합'],
      ),
      ContentSection(
        title: '한계',
        body:
            '통신 품질은 배선·전원·간섭·설정 오류에 크게 좌우된다. '
            '무선은 편의성이 크지만 장애물·간섭·전원 제한이 있고, '
            '유선도 단선·접지·커넥터 불량이 난다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '거리',
        body:
            '물리 매체와 프로토콜마다 권장 거리가 다르다. '
            '현장에서는 카탈로그 최대 거리보다 여유를 두고 설계한다.',
      ),
      ContentSection(
        title: '속도',
        body:
            '환경 모니터링은 초~분 단위면 충분한 경우가 많다. '
            '고속만 목표로 하지 말고, 안정성과 재시도·타임아웃을 함께 본다.',
      ),
      ContentSection(
        title: '배선',
        body:
            '신호선·전원선 분리, 차폐·접지, 방수 커넥터, '
            '농기계·수분·자외선에 강한 케이블 선택이 중요하다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '주소',
        body:
            '장치 ID·슬레이브 주소·IP는 현장 도면과 설정표로 관리한다. '
            '제조사 매뉴얼의 실제 주소를 확인하고, 교육 예제의 임의 주소를 '
            '현장 장비에 그대로 쓰지 않는다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '오류',
        body:
            '타임아웃, CRC/체크섬 오류, 중복 주소, IP 충돌, '
            '게이트웨이 다운, DNS/방화벽 차단이 흔하다.',
      ),
      ContentSection(
        title: '진단',
        body:
            '물리 연결 → 전원 → 주소/속도 일치 → 프로토콜 프레임 → '
            '애플리케이션 파싱 순으로 좁힌다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '적용사례',
        body:
            '소형 온실 온습도 수집, PLC 원격 감시, '
            '인터넷 단절 시 로컬 자동 환기 유지 교육 시나리오.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'comm-rs',
    title: 'RS-232 / RS-485 시리얼 통신',
    summary: '근거리·중거리 유선 직렬 통신. 스마트팜에서는 RS-485가 다장치 버스에 자주 쓰인다.',
    category: '통신',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general, FarmType.greenhouse, FarmType.hydroponics],
    keywords: ['RS-232', 'RS-485', '시리얼', '반이중', '트위스트페어'],
    relatedIds: ['comm-modbus-rtu', 'comm-basics', 'comm-diagnostics'],
    sourceIds: ['src-modbus'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '용도',
        body: '센서 변환기, 인버터, PLC, 계측기와 로컬 PC/게이트웨이 연결.',
      ),
      ContentSection(
        title: '연결구조',
        body:
            'RS-232는 점대점, RS-485는 차동 버스(A/B)에 여러 슬레이브를 둘 수 있다. '
            '종단 저항·공통 기준(접지/SG) 설계가 필요하다.',
      ),
      ContentSection(title: '장점', body: '구조가 단순하고, 인터넷 없이도 동작하며 비용이 비교적 낮다.'),
      ContentSection(
        title: '한계',
        body:
            '장거리·다분기에서 반사·노이즈가 생기기 쉽다. '
            '반이중 RS-485는 송신 타이밍(방향 전환) 오류에 민감하다.',
      ),
      ContentSection(
        title: '거리',
        body:
            'RS-232는 짧은 거리, RS-485는 조건에 따라 수십~수백 미터까지 '
            '검토한다. 속도가 높을수록 실효 거리는 줄어든다.',
      ),
      ContentSection(
        title: '속도',
        body: '9600·19200·38400 bps 등이 흔히 쓰이나, 현장 합의 값이 우선이다.',
      ),
      ContentSection(
        title: '배선',
        body:
            '트위스트 페어, 차폐, 전원선과의 이격, 올바른 A/B 극성, '
            '버스 양단 종단을 확인한다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '주소',
        body:
            '장치별 시리얼 포트·슬레이브 ID를 표로 관리한다. '
            '임의 교육용 주소를 장비에 복사하지 않는다.',
      ),
      ContentSection(
        title: '오류',
        body: '극성 반전, 속도/패리티 불일치, 종단 누락, 접지 전위차, 반이중 충돌.',
      ),
      ContentSection(title: '진단', body: '오실로스코프·시리얼 모니터로 프레임과 전압 레벨을 확인한다.'),
      ContentSection(
        title: '적용사례',
        body: '양액 EC 변환기→RS-485→로컬 수집 PC, 인버터 상태 읽기.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'comm-modbus-rtu',
    title: 'Modbus RTU',
    summary:
        '시리얼(주로 RS-485) 위에서 동작하는 산업용 요청-응답 프로토콜. '
        '레지스터 맵은 제조사·기종마다 다르다.',
    category: '통신',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general, FarmType.greenhouse, FarmType.hydroponics],
    keywords: ['Modbus', 'RTU', 'FC03', '슬레이브', 'CRC'],
    relatedIds: ['comm-rs', 'comm-modbus-tcp', 'comm-diagnostics'],
    sourceIds: ['src-modbus'],
    verificationStatus: VerificationStatus.manufacturerManualRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(title: '용도', body: 'PLC·센서·계측기의 홀딩/입력 레지스터 읽기·쓰기.'),
      ContentSection(title: '연결구조', body: '마스터 1대와 슬레이브 다수. 마스터가 폴링한다.'),
      ContentSection(title: '장점', body: '단순하고 자료가 많으며 장비 지원이 넓다.'),
      ContentSection(
        title: '한계',
        body:
            '실시간성·보안은 제한적이다. 주소·스케일·바이트 오더는 '
            '장비 매뉴얼 확인이 필수다.',
        kind: SectionKind.important,
      ),
      ContentSection(title: '거리', body: '하위 물리층(RS-485 등)의 거리 한계를 따른다.'),
      ContentSection(title: '속도', body: '보드레이트와 폴링 주기에 의해 실질 처리량이 결정된다.'),
      ContentSection(
        title: '배선',
        body: 'RS-485 배선 규칙을 따르고, 슬레이브 전원·공통 접지를 점검한다.',
      ),
      ContentSection(
        title: '주소',
        body:
            '슬레이브 ID와 레지스터 오프셋은 제조사 매뉴얼·현장 설정표를 따른다. '
            '이 앱의 교육 예제는 특정 PLC 제조사 주소를 주장하지 않는다.',
        kind: SectionKind.expertNote,
      ),
      ContentSection(title: '오류', body: 'CRC 오류, 예외 응답, 타임아웃, 중복 슬레이브 ID.'),
      ContentSection(
        title: '진단',
        body: '한 슬레이브만 단독 연결해 기능코드·주소를 검증한 뒤 버스를 확장한다.',
      ),
      ContentSection(
        title: '적용사례',
        body: '온실 PLC에서 온습도·팬 상태를 로컬 MFC/수집 프로그램이 폴링.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'comm-ethernet',
    title: '이더넷 현장 네트워크',
    summary: '유선 IP 기반 현장망. 안정적 대역폭이 필요하거나 Wi-Fi 간섭이 큰 구간에 적합하다.',
    category: '통신',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general],
    keywords: ['이더넷', '스위치', 'IP', 'LAN', '케이블'],
    relatedIds: ['comm-modbus-tcp', 'comm-farm-network', 'comm-wifi'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(title: '용도', body: 'PLC·IPC·카메라·게이트웨이의 안정적 데이터 경로.'),
      ContentSection(
        title: '연결구조',
        body: '스타형 스위치 중심. 중요 구간은 이중화 스위치를 검토할 수 있다.',
      ),
      ContentSection(title: '장점', body: '지연이 비교적 예측 가능하고 대용량(영상 등)에 유리하다.'),
      ContentSection(title: '한계', body: '배선 공사·방수·설치비가 든다. 커넥터 부식·케이블 절단이 난다.'),
      ContentSection(
        title: '거리',
        body: '구리 이더넷은 세그먼트당 약 100m가 일반 기준이다. 그 이상은 광·중계를 검토한다.',
      ),
      ContentSection(
        title: '속도',
        body: '100Mbps·1Gbps 등이 흔하다. 현장 장비 지원 속도를 맞춘다.',
      ),
      ContentSection(
        title: '배선',
        body: '산업용/옥외용 케이블, 접지, 서지, 방수 RJ45 또는 M12를 검토한다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(title: '주소', body: '고정 IP 또는 DHCP+예약. IP 충돌 표를 관리한다.'),
      ContentSection(
        title: '오류',
        body: '링크 다운, 듀플렉스 불일치, 브로드캐스트 폭풍, 잘못된 VLAN.',
      ),
      ContentSection(title: '진단', body: '링크 LED, 케이블 테스터, ping, 스위치 포트 통계.'),
      ContentSection(title: '적용사례', body: '제어실 PC–스위치–PLC, 카메라 NVR 유선 백본.'),
    ],
  ),
  SmartFarmContent(
    id: 'comm-modbus-tcp',
    title: 'Modbus TCP',
    summary: '이더넷/IP 위의 Modbus. 포트·유닛 ID·레지스터 맵은 장비마다 확인한다.',
    category: '통신',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general, FarmType.greenhouse],
    keywords: ['Modbus TCP', '502', '이더넷', '유닛ID'],
    relatedIds: ['comm-ethernet', 'comm-modbus-rtu', 'comm-gateway'],
    sourceIds: ['src-modbus'],
    verificationStatus: VerificationStatus.manufacturerManualRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(title: '용도', body: '이더넷 가능 PLC·게이트웨이의 레지스터 읽기/쓰기.'),
      ContentSection(
        title: '연결구조',
        body: '클라이언트(마스터)–서버(슬레이브). 여러 클라이언트가 접속할 수 있다.',
      ),
      ContentSection(
        title: '장점',
        body: '기존 IP 인프라를 활용하고, 시리얼보다 배선이 단순해질 수 있다.',
      ),
      ContentSection(
        title: '한계',
        body:
            '기본 Modbus TCP는 인증·암호화가 약하다. '
            '현장망 분리·방화벽·쓰기 권한 제한이 필요하다.',
        kind: SectionKind.safety,
      ),
      ContentSection(title: '거리', body: '이더넷 물리층 한계를 따른다.'),
      ContentSection(
        title: '속도',
        body: '시리얼 RTU보다 폴링 효율이 나은 경우가 많으나, 네트워크 부하에 영향받는다.',
      ),
      ContentSection(title: '배선', body: '표준 이더넷 배선. 제어망과 사무망 분리를 권장한다.'),
      ContentSection(
        title: '주소',
        body:
            'IP·포트(흔히 502)·유닛 ID·레지스터는 매뉴얼 확인. '
            '교육용 임의 맵을 현장 장비에 적용하지 않는다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '오류',
        body: '연결 거부, 타임아웃, 잘못된 MBAP, 쓰기 거부, 방화벽 차단.',
      ),
      ContentSection(
        title: '진단',
        body: 'ping → 포트 열림 → 단일 기능코드 테스트 → 쓰기 인터록 확인.',
      ),
      ContentSection(title: '적용사례', body: '로컬 수집 서버가 PLC 상태를 읽어 대시보드에 표시.'),
    ],
  ),
  SmartFarmContent(
    id: 'comm-wifi',
    title: 'Wi-Fi 현장 통신',
    summary:
        '배선이 어려운 구간의 편의 통신. 간섭·장애물·전원에 취약할 수 있어 '
        '필수 제어의 유일한 경로로 두지 않는 것이 안전하다.',
    category: '통신',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: [FarmType.greenhouse, FarmType.openField, FarmType.livestock],
    keywords: ['Wi-Fi', '무선', 'AP', '간섭', '로밍'],
    relatedIds: ['comm-lora', 'comm-offline', 'comm-farm-network'],
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '용도',
        body: '모바일 점검, 센서 노드, 카메라(조건 충족 시), 임시 공사 구간.',
      ),
      ContentSection(
        title: '연결구조',
        body: 'AP–클라이언트. 넓은 농장은 메쉬/다중 AP·유선 백홀을 검토한다.',
      ),
      ContentSection(title: '장점', body: '설치가 빠르고 이동성이 좋다.'),
      ContentSection(
        title: '한계',
        body:
            '금속·수분·식물·전자파 간섭으로 끊길 수 있다. '
            '무선이 항상 유선보다 낫다고 볼 수 없다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '거리',
        body: '개활지에서도 실사용 거리는 AP 성능·안테나·장애물에 따라 크게 달라진다.',
      ),
      ContentSection(
        title: '속도',
        body: '이론 속도와 현장 실효 속도는 다르다. 영상은 특히 검증이 필요하다.',
      ),
      ContentSection(title: '배선', body: '무선이라도 AP·PoE·전원 배선과 접지는 필요하다.'),
      ContentSection(title: '주소', body: 'SSID, 암호, IP, VLAN을 문서화한다.'),
      ContentSection(title: '오류', body: '채널 혼잡, DHCP 고갈, 인증 실패, 로밍 끊김.'),
      ContentSection(title: '진단', body: 'RSSI/SNR 측정, 채널 스캔, 유선 백홀 상태 확인.'),
      ContentSection(
        title: '적용사례',
        body: '작업자 태블릿으로 로컬 대시보드 조회. 팬 제어는 PLC 로컬 로직 유지.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'comm-lora',
    title: 'LoRa / 저전력 장거리 무선',
    summary:
        '낮은 데이터율로 비교적 먼 거리·저전력 센서 수집에 쓰인다. '
        '고속·실시간 안전 제어용으로 단정하지 않는다.',
    category: '통신',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: [FarmType.openField, FarmType.orchard, FarmType.livestock],
    keywords: ['LoRa', 'LoRaWAN', '저전력', '게이트웨이', '듀티사이클'],
    relatedIds: ['comm-wifi', 'comm-gateway', 'comm-offline'],
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(title: '용도', body: '토양수분·기상 등 저빈도 센서 업링크.'),
      ContentSection(
        title: '연결구조',
        body: '노드–게이트웨이–네트워크서버/로컬 브로커. 사설·공용망 구성이 다르다.',
      ),
      ContentSection(title: '장점', body: '배터리 수명과 장거리 커버리지에 유리한 경우가 많다.'),
      ContentSection(title: '한계', body: '대역폭·듀티사이클 제한. 하향 제어·대용량에는 부적합할 수 있다.'),
      ContentSection(
        title: '거리',
        body: '개활지·안테나·법적 출력에 따라 달라진다. 현장 RF 측량이 필요하다.',
      ),
      ContentSection(title: '속도', body: '낮은 비트레이트. 전송 주기 설계가 핵심이다.'),
      ContentSection(title: '배선', body: '노드 전원·방수·안테나 접지. 게이트웨이는 가능한 유선 백홀.'),
      ContentSection(
        title: '주소',
        body: 'DevEUI·AppKey 등 키/식별자는 보안 보관. 교육 예제 키를 재사용하지 않는다.',
        kind: SectionKind.safety,
      ),
      ContentSection(title: '오류', body: '패킷 손실, 게이트웨이 다운, 주파수 설정 오류, 배터리 방전.'),
      ContentSection(title: '진단', body: 'RSSI/SNR, 게이트웨이 로그, 재전송·ADR 설정 점검.'),
      ContentSection(
        title: '적용사례',
        body: '과수원 분산 토양수분 수집. 관수 밸브는 로컬 컨트롤러가 최종 실행.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'comm-mqtt',
    title: 'MQTT 메시징',
    summary:
        '발행/구독 모델로 장치·앱·서버를 느슨하게 연결한다. '
        '브로커 장애와 토픽 설계, 인증이 운영 품질을 좌우한다.',
    category: '통신',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general],
    keywords: ['MQTT', '브로커', '토픽', 'QoS', 'TLS'],
    relatedIds: ['comm-gateway', 'sw-cloud', 'sw-offline'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(title: '용도', body: '센서 이벤트, 알람, 상태 동기화, 모바일 알림 연계.'),
      ContentSection(
        title: '연결구조',
        body: '퍼블리셔–브로커–서브스크라이버. 로컬 브로커를 두면 인터넷 없이도 현장 메시징이 가능하다.',
        kind: SectionKind.flow,
      ),
      ContentSection(title: '장점', body: '경량, 토픽 기반 확장, QoS·Retain 등 유용한 옵션.'),
      ContentSection(
        title: '한계',
        body: '브로커 SPOF 가능. 잘못된 토픽/권한은 오동작·보안 사고로 이어진다.',
      ),
      ContentSection(title: '거리', body: '하위 전송망(이더넷·Wi-Fi·이동통신)에 종속.'),
      ContentSection(title: '속도', body: '작은 메시지에 적합. 대용량 영상은 별도 경로가 일반적이다.'),
      ContentSection(title: '배선', body: '브로커 서버의 전원·UPS·유선망을 우선한다.'),
      ContentSection(
        title: '주소',
        body: '브로커 호스트, 포트, 클라이언트 ID, 토픽 네임스페이스를 문서화한다.',
      ),
      ContentSection(
        title: '오류',
        body: '연결 끊김, 인증 실패, QoS 재전송 폭주, 잘못된 payload 스키마.',
      ),
      ContentSection(
        title: '진단',
        body: '브로커 로그, Last Will, 구독 ACL, 로컬 루프백 테스트.',
      ),
      ContentSection(
        title: '적용사례',
        body: '게이트웨이가 센서 JSON을 로컬 MQTT로 발행, 앱이 구독. 제어 쓰기는 승인·인터록 후 PLC.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'comm-gateway',
    title: '게이트웨이·프로토콜 변환',
    summary:
        '시리얼↔이더넷, Modbus↔MQTT 등 경계를 잇는다. '
        '변환 오류·시간동기·쓰기 권한 설계가 중요하다.',
    category: '통신',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general],
    keywords: ['게이트웨이', '프로토콜변환', '엣지', '버퍼'],
    relatedIds: ['comm-modbus-rtu', 'comm-mqtt', 'comm-offline'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(title: '용도', body: '이기종 장비 통합, 클라우드/앱 연계, 오프라인 버퍼링.'),
      ContentSection(
        title: '연결구조',
        body: '현장 버스 ↔ 게이트웨이 ↔ 로컬망/클라우드. 쓰기 경로는 읽기 경로와 분리·제한한다.',
      ),
      ContentSection(title: '장점', body: '레거시 장비를 현대 소프트웨어와 연결할 수 있다.'),
      ContentSection(
        title: '한계',
        body: '단일 장애점·설정 복잡·매핑 실수가 전체 시스템 오류로 퍼질 수 있다.',
      ),
      ContentSection(title: '거리', body: '양측 물리층 각각의 거리 제약을 동시에 만족해야 한다.'),
      ContentSection(title: '속도', body: '느린 쪽(시리얼 폴링)이 전체 병목이 되는 경우가 많다.'),
      ContentSection(title: '배선', body: '전원 이중화, DIN레일 고정, 접지, 라벨링.'),
      ContentSection(title: '주소', body: '내부 태그 맵·외부 토픽/레지스터 맵을 버전 관리한다.'),
      ContentSection(
        title: '오류',
        body: '스케일 오류, 엔디안 오류, 버퍼 overflow, 시계 드리프트.',
      ),
      ContentSection(title: '진단', body: '입·출력 양쪽 raw 로그를 나란히 비교한다.'),
      ContentSection(
        title: '적용사례',
        body: 'RS-485 Modbus → MQTT JSON 변환 후 Flutter 앱 표시.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'comm-farm-network',
    title: '농장 네트워크 구성',
    summary:
        '제어망·감시망·게스트망을 분리하고, '
        '필수 제어는 인터넷 경로에 종속시키지 않는다.',
    category: '통신',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: [FarmType.general, FarmType.greenhouse, FarmType.livestock],
    keywords: ['네트워크분리', 'VLAN', '방화벽', '제어망'],
    relatedIds: ['comm-ethernet', 'comm-offline', 'safety-network'],
    sourceIds: ['src-kesco'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(title: '용도', body: '안정·보안·유지보수를 위한 현장망 설계.'),
      ContentSection(
        title: '연결구조',
        body:
            'PLC/센서 제어망, 카메라/사무망, 원격 접속용 DMZ/VPN을 구분한다. '
            '클라우드 회선 장애와 무관하게 로컬 제어망이 살아야 한다.',
        kind: SectionKind.important,
      ),
      ContentSection(title: '장점', body: '장애 영향 범위 축소, 보안 경계 명확화, 점검 경로 단순화.'),
      ContentSection(title: '한계', body: '초기 설계·문서화 비용. 잘못 분리하면 필요한 데이터가 막힌다.'),
      ContentSection(title: '거리', body: '구역별 스위치 배치와 백본 경로를 도면에 명시한다.'),
      ContentSection(title: '속도', body: '제어 트래픽과 영상 트래픽 QoS/대역을 분리한다.'),
      ContentSection(
        title: '배선',
        body: '랙·접지·서지보호·라벨·케이블 경로 보호.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '주소',
        body: 'IP 계획표, DHCP 범위, 예약, DNS, VPN 계정을 관리한다.',
      ),
      ContentSection(
        title: '오류',
        body: '라우팅 루프, 잘못된 ACL, 단일 회선 의존, 문서 없는 임시 설정.',
      ),
      ContentSection(
        title: '진단',
        body: '구간별 ping/traceroute, 스위치 로그, 방화벽 hit count.',
      ),
      ContentSection(
        title: '적용사례',
        body: '온실 제어 VLAN과 방문객 Wi-Fi 분리, 원격은 VPN만 허용.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'comm-offline',
    title: '오프라인·인터넷 단절 대응',
    summary:
        '회선 장애·클라우드 장애 시에도 로컬 수집·알람·안전 제어가 동작해야 한다. '
        '원격 앱이 안 된다고 현장이 멈추면 설계가 잘못된 것이다.',
    category: '통신',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: [FarmType.general],
    keywords: ['오프라인', '로컬제어', '버퍼', '단절', '엣지'],
    relatedIds: ['sw-offline', 'comm-farm-network', 'safety-emergency'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(title: '용도', body: '단절 시 운전 지속, 데이터 유실 최소화, 복구 후 동기화.'),
      ContentSection(
        title: '연결구조',
        body:
            'PLC 로컬 로직 → 로컬 SCADA/앱 → (가능 시) 클라우드. '
            '클라우드를 제어 루프의 필수 조건으로 두지 않는다.',
        kind: SectionKind.flow,
      ),
      ContentSection(title: '장점', body: '기상·공사·회선 장애에 대한 회복력.'),
      ContentSection(
        title: '한계',
        body: '로컬 저장 용량·충돌 해결·시계 동기 문제를 별도로 설계해야 한다.',
      ),
      ContentSection(title: '거리', body: '오프라인 모드는 현장 내부 통신 범위에서 완결되어야 한다.'),
      ContentSection(title: '속도', body: '단절 중에도 필수 폴링 주기를 유지할 자원을 확보한다.'),
      ContentSection(title: '배선', body: '로컬 서버/PLC 전원·UPS를 인터넷 모뎀보다 우선 보호한다.'),
      ContentSection(
        title: '주소',
        body: '로컬 DNS/호스트 파일, 고정 IP로 클라우드 이름 해석 실패에 대비한다.',
      ),
      ContentSection(
        title: '오류',
        body: '큐 overflow, 중복 업로드, 시간역전, 원격 전용 제어 의존.',
      ),
      ContentSection(
        title: '진단',
        body: '의도적 인터넷 차단 시험으로 로컬 환기·관수·알람을 검증한다.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '적용사례',
        body: '회선 장애 2시간 동안 PLC 자동 환기 유지, 복구 후 CSV/DB 동기화.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'comm-diagnostics',
    title: '통신 진단 절차',
    summary: '물리→링크→프로토콜→애플리케이션 순으로 원인을 좁히는 현장 점검법.',
    category: '통신',
    difficulty: Difficulty.basic,
    contentType: ContentType.troubleshooting,
    farmTypes: [FarmType.general],
    keywords: ['진단', '타임아웃', 'CRC', '핑', '로그'],
    relatedIds: ['comm-basics', 'comm-modbus-rtu', 'ops-incident'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(title: '용도', body: '통신 불량 시 빠른 원인 분리와 재발 방지 기록.'),
      ContentSection(
        title: '연결구조',
        body: '점검 경로: 케이블/안테나 → 포트/전원 → 주소·속도 → 프레임 → 앱 파싱.',
        kind: SectionKind.flow,
      ),
      ContentSection(title: '장점', body: '감으로 설정만 바꾸지 않고 근거 있게 복구할 수 있다.'),
      ContentSection(title: '한계', body: '도구·권한·매뉴얼이 없으면 추측 정비로 흐르기 쉽다.'),
      ContentSection(title: '거리', body: '구간을 나눠 끝단부터 또는 중간 분기점부터 측정한다.'),
      ContentSection(title: '속도', body: '속도/타임아웃을 임시로 바꾸기 전에 현재 설정을 백업한다.'),
      ContentSection(title: '배선', body: '흔들림·수분·설치 후 재작업 흔적을 육안으로 본다.'),
      ContentSection(title: '주소', body: '설정표와 실기를 대조. 중복 ID/IP를 최우선 확인.'),
      ContentSection(title: '오류', body: '간헐 오류는 온도·습도·시간대·부하와 상관을 기록한다.'),
      ContentSection(
        title: '진단',
        body:
            '1) 전원/링크 2) 단독 장치 통신 3) 버스/스위치 복원 '
            '4) 애플리케이션 로그 5) 변경점 문서화.',
        kind: SectionKind.fieldCheck,
      ),
      ContentSection(
        title: '적용사례',
        body: 'Modbus 타임아웃 → 중복 슬레이브 ID 발견 → 표 수정 후 정상화.',
      ),
    ],
  ),
];
