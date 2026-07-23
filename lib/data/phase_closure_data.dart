import '../models/smart_farm_content.dart';

// Phase closure enrichment for priority D pages.
const Map<String, SmartFarmContent> phaseClosureOverrides = {
  'expert-logging': SmartFarmContent(
    id: 'expert-logging',
    title: '로그·감사기록',
    summary:
        '앱·통신·알람·제어·설정변경·AI·배포·백업 기록을 구분한다. '
        '비밀번호·토큰·불필요한 개인정보는 기록하지 않는다.',
    category: '전문가',
    difficulty: Difficulty.expert,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus: ApplicationValidationStatus.deskReviewed,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '로그는 “무슨 일이 언제, 누가, 어떤 결과로 일어났는지” 남기는 기록이다. '
            '감사기록은 특히 설정·권한·제어·배포처럼 책임 추적이 필요한 이벤트를 '
            '나중에 재현할 수 있게 남긴다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '이벤트 단위로 구조화된 필드를 남기면 검색·상관·재현이 쉬워진다. '
            'correlationId로 한 번의 사용자 조작→API→PLC→알람 흐름을 묶을 수 있다.',
        bullets: [
          'timestamp, source, farmId, zoneId, deviceId',
          'actor(사용자/시스템), eventType, previous/new',
          'reason, result, correlationId, severity',
        ],
        kind: SectionKind.important,
        copyText:
            'timestamp,source,farmId,zoneId,deviceId,actor,eventType,prev,new,reason,result,correlationId,severity',
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '장애 대응, 권한 분쟁, 설정 롤백, AI·알람 오탐 분석, '
            '원격 제어 감사, 배포 후 회귀 추적에 쓴다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '구성요소',
        body: '수집·전송·저장·검색·보존·접근제어·마스킹 정책을 분리해 설계한다.',
        bullets: [
          '앱/서버/PLC 게이트웨이별 로거',
          '중앙 저장(로컬 큐 + 원격 동기)',
          '보존 기간·용량·아카이브',
          '조회 권한(운영자 vs 외부지원)',
        ],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '기록 대상 정의 → 필드 표준 → 민감정보 마스킹 → 저장·보존 → '
            '장애 시 조회 절차 → 정기 검토 순으로 정한다.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '교육·현장 모두에서 흔히 나타나는 실수다.',
        bullets: [
          '비밀번호·API 토큰을 평문 로그에 남김',
          '“로그 많이 남김=안전”으로 오해',
          '제어 실패 원인 없이 result만 success/fail 표시',
          '시간대·서버 시계 불일치로 순서 해석 불가',
        ],
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '테스트 이벤트를 발생시켜 end-to-end로 기록·조회·상관이 되는지 확인한다.',
        bullets: [
          '설정 변경 → 감사 필드(prev/new) 존재',
          '원격 제어 → actor·reason·result·correlationId',
          '민감 필드 마스킹 여부',
        ],
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '로그 자체가 개인정보·보안 자산이 될 수 있다. '
            '접근·보존·내보내기를 통제하고, 로그만 있고 현장 안전 조치가 없다고 '
            '안전하다고 말하지 않는다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['감사', '로그', 'correlationId', '추적', '보존'],
    relatedIds: const ['expert-runbooks', 'sw-auth', 'ops-incident'],
    sourceIds: const ['src-flutter', 'src-overview-edu'],
  ),
  'sw-remote': SmartFarmContent(
    id: 'sw-remote',
    title: '원격 감시·제어',
    summary:
        '원격은 편의 기능이다. 쓰기 권한·승인·인터록·감사로그 없이 열면 위험하다. '
        '인터넷이 끊겨도 로컬 제어·안전측 동작은 유지되어야 한다.',
    category: '소프트웨어',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus: ApplicationValidationStatus.deskReviewed,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '집이나 사무실에서 농장 상태를 보거나, 허용된 범위에서 장치를 '
            '조작하는 기능이다. “앱에서 버튼 누르면 현장이 움직인다” 이전에 '
            '누가·언제·어떤 조건에서 가능한지가 더 중요하다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '모바일/웹 → API/게이트웨이 → 현장 PLC·컨트롤러 경로로 명령이 전달된다. '
            '읽기(감시)와 쓰기(제어)는 권한·지연·실패 처리가 다르다.',
        bullets: ['VPN·방화벽·망분리로 접근 경로 통제', '명령 큐·타임아웃·재시도', '현장 안전조건 검사 후 실행'],
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '야간·휴일 알람 확인, 다중 농장 현황 조회, '
            '승인된 범위의 환기·관수 조정, 외부 지원 원격 진단에 적합하다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '구성요소',
        body: '원격 기능은 소프트웨어만으로 완성되지 않는다.',
        bullets: [
          '역할 기반 권한·2차 확인 UI',
          '현장 인터록·로컬 우선 스위치',
          '감사 로그·명령 이력',
          '오프라인/단절 시 현장 자율 동작',
        ],
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '사용자 요청 → 권한 확인 → 안전조건 검사 → 현장 실행 → '
            '결과·로그 기록. 조건 미충족 시 거부하고 이유를 남긴다.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '데모용 원격 제어를 실제 안전 설계 없이 상용화하는 경우가 많다.',
        bullets: [
          '기본 권한을 “전체 제어”로 둠',
          '인터넷 단절 시 모든 구동기 정지(안전측 아님)',
          '승인·인터록 UI만 있고 PLC 쪽 미구현',
          '공용 계정으로 원격 기동',
        ],
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '권한별·단절·조건 위반 시나리오를 시험한다.',
        bullets: [
          '읽기 전용 계정으로 쓰기 거부',
          '안전조건 미충족 시 명령 거부',
          '회선 차단 후 로컬 수동·자동 유지',
        ],
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '원격은 편의와 위험이 함께 커진다. 위험 동작은 현장 확인·2차 승인·'
            '감사 로그 없이 열지 않는다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['원격', 'VPN', '승인', '감사로그', '로컬우선'],
    relatedIds: const ['safety-remote', 'sw-auth', 'comm-offline'],
    sourceIds: const ['src-flutter', 'src-firebase', 'src-control-safety'],
  ),
  'sw-auth': SmartFarmContent(
    id: 'sw-auth',
    title: '인증과 권한',
    summary:
        '누가 무엇을 읽고/쓸 수 있는지 명확히 한다. 공용 계정은 사고 추적을 막는다. '
        '제어 권한과 조회 권한은 분리한다.',
    category: '소프트웨어',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus: ApplicationValidationStatus.deskReviewed,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '로그인·권한은 “이 사람이 이 화면·이 버튼을 써도 되는가”를 정하는 문지기다. '
            '스마트팜에서는 조회만 하는 사람과 실제 밸브·팬을 건드릴 수 있는 사람을 '
            '구분해야 한다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '인증(누구인가)과 인가(무엇을 할 수 있는가)를 분리한다. '
            'RBAC(역할 기반)로 조회자·작업자·관리자·유지보수·외부지원 등을 정의한다.',
        bullets: [
          'Firebase Auth, API 토큰, OS/장비 계정 등 선택',
          '세션·토큰 만료·갱신',
          '최소 권한 원칙',
        ],
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '일상 조회, 알람 확인, 승인된 제어, 외부 업체 임시 접근, '
            '퇴사·계약 종료 시 권한 회수에 쓴다.',
      ),
      ContentSection(
        title: '구성요소',
        body: '계정·역할·권한표·감사·비밀정보 관리가 한 세트다.',
        bullets: [
          '개인 계정(공용 금지)',
          '역할·권한 매트릭스',
          'MFA(가능 시)',
          '비밀키·토큰은 저장소·CI에 하드코딩 금지',
        ],
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '역할 정의 → 화면·API·제어점 매핑 → 계정 발급 → '
            '정기 검토 → 퇴사·변경 시 즉시 회수.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '권한 설계 없이 “관리자 하나”로 운영하는 경우가 많다.',
        bullets: [
          'admin/admin 공유',
          '제어 권한을 모든 작업자에게 부여',
          '임시 외부 계정을 회수하지 않음',
          '앱 권한만 있고 PLC/HMI 계정은 방치',
        ],
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '역할별로 허용·거부 동작을 시험하고 감사 로그를 확인한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '인증 UI만 있고 현장 인터록·로컬 우선이 없으면 안전하지 않다. '
            '권한은 문서·코드·현장 장비에서 일치해야 한다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['인증', 'RBAC', '권한', 'MFA', '계정'],
    relatedIds: const ['safety-accounts', 'sw-remote', 'safety-remote'],
    sourceIds: const ['src-flutter', 'src-firebase'],
  ),
  'sw-mobile': SmartFarmContent(
    id: 'sw-mobile',
    title: 'Flutter·모바일 앱',
    summary:
        '현장 조회·알람·체크리스트에 적합하다. 필수 제어의 유일한 수단으로 두지 않는다. '
        '배터리·전파·백그라운드 제한을 전제로 설계한다.',
    category: '소프트웨어',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus: ApplicationValidationStatus.deskReviewed,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '스마트폰으로 농장 상태를 보고, 알람을 확인하고, 작업 기록을 남기는 앱이다. '
            'PC나 현장 HMI가 없어도 “보는 것”은 가능하지만, '
            '위험한 제어의 유일한 수단이 되면 안 된다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            'Flutter로 Android/iOS를 함께 개발할 수 있다. '
            'REST/WebSocket/MQTT 등으로 서버·게이트웨이와 통신하고, '
            '로컬 캐시·오프라인 큐로 단절을 견딘다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '현장 순찰 중 조회, 야간 알람 푸시, 점검 체크리스트, '
            '사진·메모 첨부, 교육 콘텐츠 열람에 적합하다.',
        bullets: ['현황 조회', '알람 확인', '작업 기록', '교육·매뉴얼'],
      ),
      ContentSection(
        title: '구성요소',
        body: 'UI·상태관리·네트워크·로컬DB·푸시·권한·버전 관리를 포함한다.',
        bullets: ['오프라인 캐시·동기화', '푸시 알림(중요도 구분)', '역할별 화면·버튼 노출'],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '필수 기능(조회·알람) → 오프라인 → 권한 → '
            '위험 제어(있더라도 2차 확인) → 현장 시험 순으로 구현한다.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '모바일만 있으면 된다고 가정하는 설계가 문제를 만든다.',
        bullets: [
          '배터리 방전·전파 음영을 무시',
          '앱 캐시 값을 “현재 현장값”으로 착각',
          '백그라운드에서 항상 실시간 제어 가정',
          '구버전 앱·OS 미지원 방치',
        ],
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '비행기 모드·약한 신호·백그라운드 전환·앱 재시작 시나리오를 시험한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '모바일은 보조 수단이다. 비상·필수 제어는 현장 스위치·PLC·HMI로 '
            '가능해야 한다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['Flutter', '모바일', 'Android', '오프라인', '푸시알람'],
    relatedIds: const ['sw-dashboard', 'sw-offline', 'sw-auth'],
    sourceIds: const ['src-flutter', 'src-firebase'],
  ),
  'sw-mfc': SmartFarmContent(
    id: 'sw-mfc',
    title: 'MFC/C++ 수집·HMI',
    summary:
        'Windows 기반 레거시·산업 현장에서 시리얼·소켓 수집과 운전화면에 쓰인다. '
        'Flutter/Web과 역할 분담하는 하이브리드가 현실적이다.',
    category: '소프트웨어',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus: ApplicationValidationStatus.deskReviewed,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            'PC에 설치되는 Windows 프로그램으로, COM 포트·소켓으로 센서·PLC 데이터를 '
            '읽고 화면에 보여 주거나 명령을 보낸다. 오래된 현장·장비와 잘 맞는 경우가 많다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            'MFC/C++는 저수준 포트 제어·실시간 UI·기존 DLL 연동에 강하다. '
            'Modbus RTU/TCP, 자체 프로토콜, OPC 등과 연결하는 수집·HMI 역할을 한다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '온실 PC 옆 상시 구동 HMI, 시리얼 변환기 연결, '
            '레거시 계측기 브릿지, 로컬 DB 적재 후 클라우드 동기에 쓴다.',
      ),
      ContentSection(
        title: '구성요소',
        body: '수집 스레드·프로토콜 드라이버·태그 DB·알람·트렌드·로그·백업.',
        bullets: ['포트/소켓 관리·재연결', '태그·스케일·단위 매핑', '로컬 저장·원격 업링크'],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '장비 목록·프로토콜 확정 → 태그 맵 → 수집 안정화 → '
            'HMI·알람 → 백업·원격 연동 순으로 진행한다.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: 'MFC만으로 모바일·다중 농장·배포까지 해결하려 하면 유지보수가 어려워진다.',
        bullets: ['프로토콜·주소를 코드에 하드코딩', 'PC 고장 시 대체 수단 없음', '관리자 PC에만 설치·백업 없음'],
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '포트 단절·재연결·장시간 구동·PC 재부팅 후 자동 기동을 시험한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            'HMI 버튼이 곧바로 구동기를 움직이면 인터록·권한·감사가 필요하다. '
            '교육용 임의 주소를 실제 장비에 적용하지 않는다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '전문가 메모',
        body: 'MFC=수집·로컬 HMI, Flutter=조회·알람·보고 역할 분담이 흔하다.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['MFC', 'C++', 'HMI', '시리얼', '수집'],
    relatedIds: const ['sw-collection', 'comm-modbus-rtu', 'sw-cloud'],
    sourceIds: const ['src-overview-edu', 'src-control-safety'],
  ),
  'sw-cloud': SmartFarmContent(
    id: 'sw-cloud',
    title: '클라우드·API·Firebase',
    summary:
        '원격 동기·다중 단말·백업에 유용하나, 제어 루프의 필수 조건으로 두면 위험하다. '
        '버전·요금·가용성은 서비스마다 다르다.',
    category: '소프트웨어',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus: ApplicationValidationStatus.deskReviewed,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '인터넷 너머 서버에 데이터를 모으고, 여러 기기에서 같은 정보를 보게 하는 방식이다. '
            'Firebase·자체 API·MQTT 브로커 등이 대표적이다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '현장 게이트웨이·앱이 API/실시간 DB/메시지 브로커로 업·다운로드한다. '
            '인증·규칙·인덱스·보존 정책이 설계의 핵심이다.',
        bullets: [
          'REST/GraphQL, WebSocket, MQTT',
          'Auth·Firestore rules·Storage 정책',
          '멀티 테넌트(농장별 분리)',
        ],
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '이력 백업, 다중 농장 대시보드, 모바일 동기, '
            '협업·보고, 원격 알람 라우팅에 적합하다.',
        bullets: ['이력 백업', '다중 농장 조회', '모바일 동기', '협업·보고'],
      ),
      ContentSection(
        title: '구성요소',
        body: '클라우드는 “서버만”이 아니다.',
        bullets: ['현장 업링크·오프라인 큐', 'API·DB·스토리지·푸시', '모니터링·비용·백업'],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '로컬 자율 동작 확보 → 동기 대상·주기 정의 → '
            '권한·규칙 → 장애·단절 시나리오 → 복구 시험.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '클라우드 응답이 와야만 팬·펌프가 도는 구조는 위험하다.',
        bullets: [
          '제어 루프를 클라우드 RTT에 의존',
          '규칙·키를 저장소에 커밋',
          '복원 시험 없이 “백업됨” 표시',
          '무료 티어 한도를 운영 한도로 착각',
        ],
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '진단·검증',
        body: '단절·지연·권한 오류·대량 업로드 시 현장·앱 동작을 확인한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body: '클라우드는 편의·가시성 레이어다. 필수 안전·제어는 로컬에 둔다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['클라우드', 'API', 'Firebase', '동기', '백업'],
    relatedIds: const ['sw-offline', 'sw-architecture', 'safety-data'],
    sourceIds: const ['src-flutter', 'src-firebase'],
  ),
  'ops-site-survey': SmartFarmContent(
    id: 'ops-site-survey',
    title: '현장 조사',
    summary:
        '전원·접지·수분·전자파·동선·통신 음영을 측정·기록한다. '
        '구매·배선 전에 “될 자리인지”를 확인하는 단계다.',
    category: '구축·운영',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [
      FarmType.general,
      FarmType.greenhouse,
      FarmType.livestock,
    ],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '장비를 사기 전·설치 전에 현장을 직접 보고, 전기·물·통신·작업 동선·'
            '안전 여건을 표로 남기는 작업이다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '센서·게이트웨이·Wi-Fi/LoRa는 설치 위치·금속·습기·거리에 민감하다. '
            '전원·접지·누전·침수 위험은 설비 수명과 안전에 직결된다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '실제 사용',
        body: '견적·설계·통신망·센서 위치·분전·UPS 범위·안전 펜스 계획의 입력 자료가 된다.',
      ),
      ContentSection(
        title: '구성요소',
        body: '조사 체크리스트·사진·도면·측정값·이슈 목록.',
        bullets: [
          '분전반·여유 차단기·접지',
          '배관·배수·침수 위험',
          'Wi-Fi/LoRa 시험 포인트',
          '작업 동선·가동부·비상구',
        ],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '사전 자료 수집 → 현장 walkthrough → 측정·사진 → '
            '이슈·리스크 기록 → 설계 반영 → 재확인.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '카탈로그만 보고 설치 후 통신·전원 문제가 터지는 경우가 많다.',
        bullets: ['통신 시험 없이 AP 수량만 추정', '접지·누전 미확인', '침수·결로 구역에 장비 배치'],
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '조사표·사진·측정값이 설계·시운전 체크리스트와 연결되는지 확인한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '전기·고소·밀폐 공간은 자격·안전수칙을 따른다. '
            '조사 결과는 현장별로 다르며 다른 농장에 그대로 복사하지 않는다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['현장조사', '전원', '접지', '음영', '침수'],
    relatedIds: const [
      'ops-requirements',
      'ops-equipment',
      'comm-farm-network',
    ],
    sourceIds: const ['src-kesco', 'src-overview-edu'],
  ),
  'ops-equipment': SmartFarmContent(
    id: 'ops-equipment',
    title: '설비·장비 구성',
    summary:
        '요구에 맞는 최소 구성부터 시작한다. 브랜드 나열보다 입출력·환경등급·'
        '유지보수·예비품이 중요하다.',
    category: '구축·운영',
    difficulty: Difficulty.practical,
    contentType: ContentType.checklist,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '“무엇을 재배·관리하려는지”에 맞춰 센서·제어·통신·PC·배선을 '
            '최소한으로 고르는 일이다. 많이 사는 것이 좋은 설계는 아니다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '목적→입출력(I/O) 목록→환경(IP·습도·화학)·전원·통신→후보 비교→'
            '유지보수성 순으로 선정한다.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '실제 사용',
        body: '견적·구매·배선·프로그램·교정·예비품·SLA 협의의 기준이 된다.',
      ),
      ContentSection(
        title: '구성요소',
        body: '측정·구동·제어·통신·전원·배선·설치·문서.',
        bullets: [
          '센서·변환기·PLC/컨트롤러',
          '게이트웨이·스위치·AP',
          '환경등급·케이블·배선함',
          '예비품·교정 주기',
        ],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '요구사항 → I/O·태그 목록 → 환경 조건 → 후보 2~3종 비교 → '
            '현장 조사 반영 → 발주·검수.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '유행 장비·할인 세트를 먼저 고르고 요구를 맞추는 역순 구매.',
        bullets: [
          '통신 방식 불일치(RS-485 vs 4–20mA 혼재)',
          '방수·내화학 등급 미달',
          '교정·소모품 계획 없음',
        ],
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '입고 검수·데이터시트·매뉴얼·I/O 목록과 실물 일치를 확인한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '카탈로그 수치를 현장 공식 설정값처럼 복사하지 않는다. '
            '제조사 매뉴얼·현장 조건이 우선이다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['장비', '구성', '환경등급', '예비품', 'I/O'],
    relatedIds: const [
      'ops-sensor-selection',
      'ops-control-design',
      'ops-cost',
    ],
    sourceIds: const ['src-overview-edu', 'src-rda'],
  ),
  'ops-incident': SmartFarmContent(
    id: 'ops-incident',
    title: '장애·사고 대응',
    summary:
        '증상→안전확보→원인분리→복구→재발방지 기록을 남긴다. '
        '사람·시설 안전이 데이터·가동보다 우선이다.',
    category: '구축·운영',
    difficulty: Difficulty.practical,
    contentType: ContentType.troubleshooting,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '알람·통신 끊김·펌프 이상·환경 급변 등 “문제가 터졌을 때” '
            '먼저 안전을 확보하고, 원인을 나눠 보고, 복구한 뒤 '
            '다시 안 생기게 기록하는 절차다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '계층별(센서·통신·제어·소프트웨어·전원)로 원인을 분리한다. '
            '로그·트렌드·현장 확인·최근 변경(배포·설정)을 함께 본다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '야간 알람, 통신 두절, 펌프·밸브 오동작, 클라우드 장애, '
            'AI 오탐 급증, 배포 후 회귀 대응.',
      ),
      ContentSection(
        title: '구성요소',
        body: '연락망·런북·권한·로그·백업·현장 수동 수단.',
        bullets: ['비상 연락·에스컬레이션', '증거 보존(로그·스냅샷)', '임시·정상 복구 절차'],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '증상·영향 파악 → 안전조치 → 즉시 확인 → 증거 보존 → '
            '진단 → 임시/정상 복구 → 확인 시험 → 보고 → 재발방지.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '원인 모른 채 재부팅만 반복하거나, 안전 확인 전 원격 기동.',
        bullets: ['로그·변경 이력 없이 “감으로” 조치', '임시 우회를 영구화', '포스트모템·재발방지 생략'],
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '복구 후 동일 시나리오·모의 주입으로 재발 여부를 확인한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '사람·동물·설비 안전 → 작물/가축 피해 최소화 → 데이터 보전 → '
            '원인 분석 순이다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['장애', '사고', '포스트모템', '복구', '에스컬레이션'],
    relatedIds: const [
      'comm-diagnostics',
      'safety-emergency',
      'expert-runbooks',
    ],
    sourceIds: const ['src-farm-safety', 'src-overview-edu'],
  ),
  'ops-maintenance': SmartFarmContent(
    id: 'ops-maintenance',
    title: '유지보수',
    summary:
        '교정·청소·펌웨어·백업·예비품을 일정표로 관리한다. '
        '“고장 나면 그때”는 가동률·품질·안전 모두에 불리하다.',
    category: '구축·운영',
    difficulty: Difficulty.practical,
    contentType: ContentType.checklist,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '센서 렌즈 닦기, 필터 교체, 교정, 백업, 펌웨어, 접점 점검처럼 '
            '미리 해두면 큰 사고·데이터 오류를 줄이는 정기 작업이다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '예방 정비는 고장률·데이터 품질·안전을 동시에 관리한다. '
            '주기는 장비·환경·사용 강도에 따라 현장에서 조정한다.',
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '일·주·월·분기 점검표, 교정 기록, 백업·복원 리허설, '
            '예비품 재고, 펌웨어 변경 이력.',
        bullets: ['일: 통신·알람·이상음', '주: 필터·렌즈·배수', '월/분기: 교정·백업·복원'],
      ),
      ContentSection(title: '구성요소', body: '점검표·교정 장비·예비품·백업 매체·변경 기록·담당자.'),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '장비 목록 → 주기·담당 → 점검표 → 기록 양식 → '
            '이상 시 에스컬레이션 → 연간 리뷰.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '백업만 하고 복원 시험을 안 하거나, 교정 만료를 방치.',
        bullets: ['알람만 많고 유지보수 일정 없음', '예비품 없이 단일 장애점', '펌웨어·설정 변경 기록 누락'],
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '복원 리허설·교정 전후 비교·점검 완료율을 KPI로 본다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '정비 시 LOTO·전원 차단 등 현장 절차를 따른다. '
            '주기 예시는 참고용이며 현장 합의가 필요하다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['유지보수', '교정', '예비품', '백업', '점검'],
    relatedIds: const ['safety-backup', 'ops-kpi', 'ops-training'],
    sourceIds: const ['src-rda', 'src-overview-edu'],
  ),
  'ops-software-design': SmartFarmContent(
    id: 'ops-software-design',
    title: '소프트웨어 설계',
    summary:
        '데이터 모델·화면·알람·권한·오프라인·배포를 요구사항에 연결한다. '
        '현장 I/O·안전·운영 절차 없이 화면만 만드는 설계는 부족하다.',
    category: '구축·운영',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus: ApplicationValidationStatus.deskReviewed,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '앱·서버·HMI가 “무슨 데이터를 어떻게 보여 주고, 누가 무엇을 할 수 있는지” '
            '를 문서와 구조로 정하는 단계다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '요구사항→도메인 모델→API/토픽/태그 매핑→UI→알람·권한→'
            '오프라인·배포·관측성 순으로 풀어낸다.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '실제 사용',
        body: '개발·시운전·교육·유지보수·확장의 공통 기준 문서가 된다.',
        bullets: ['화면 목록', '태그/API 매핑', '알람 정의서', '역할·권한 표'],
      ),
      ContentSection(
        title: '구성요소',
        body: '산출물을 미리 정하면 구현·시험이 수월하다.',
        bullets: [
          '데이터 모델·단위·타임존',
          '알람 등급·히스테리시스·확인',
          '오프라인·충돌 정책',
          '테스트·배포·롤백 시나리오',
        ],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '요구·현장 조사 → I/O·태그 → 화면·알람 → 권한 → '
            '오프라인 → 시험 계획 → FAT/SAT 연계.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '데모 화면만 만들고 알람·권한·오프라인·로그를 나중에 붙이는 방식.',
        bullets: ['태그·단위·스케일 불일치', '알람 정의 없이 임계값 하드코딩', '제어 버튼만 있고 안전조건·감사 없음'],
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '요구사항 추적표로 화면·알람·권한·시험 케이스가 연결되는지 확인한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body: '소프트웨어 설계는 현장 fail-safe·인터록·수동 우선과 함께 봐야 한다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['SW설계', '데이터모델', '알람', '권한', '배포'],
    relatedIds: const ['sw-architecture', 'sw-auth', 'ops-control-design'],
    sourceIds: const ['src-flutter', 'src-overview-edu'],
  ),
  'ops-training': SmartFarmContent(
    id: 'ops-training',
    title: '운영자 교육',
    summary:
        '화면 보는 법뿐 아니라 수동 전환·비상·일상 점검까지 실습한다. '
        '문서만 있고 훈련이 없으면 인수인계가 완료된 것이 아니다.',
    category: '구축·운영',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '새 시스템을 실제로 돌릴 사람에게 “평소에 뭘 보고, 알람 나오면 뭘 하고, '
            '위험할 땐 어떻게 멈추는지”를 손으로 익히게 하는 교육이다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '인지→실습→평가→기록→정기 재교육 순환으로 운영 역량을 유지한다. '
            '역할별(조회/작업/관리) 커리큘럼을 나눈다.',
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '시운전 후 인수, 신규 인력, 계절 전환, '
            '장비·소프트웨어 변경 후 재교육.',
        bullets: ['일상 점검 체크리스트', '알람 대응', '수동/자동 전환', '비상정지·복구'],
      ),
      ContentSection(title: '구성요소', body: '매뉴얼·동영상·체크리스트·연습 시나리오·평가표·연락망.'),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '역할 정의 → 교재·시나리오 → 이론 → 현장 실습 → '
            '비상 훈련 → 평가·서명 → 정기 리프레시.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '앱 사용법만 1시간 교육하고 비상·수동·LOTO는 생략.',
        bullets: ['교육 기록·담당자 부재', '외부 업체만 알고 운영자는 모름', '연락망·비상 스위치 위치 미숙지'],
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '모의 알람·통신 단절·수동 전환 실습을 정기적으로 반복한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body: '교육 중에도 실제 가동부·전기·약품 안전수칙을 지킨다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['교육', '매뉴얼', '인수인계', '실습', '비상훈련'],
    relatedIds: const [
      'ops-commissioning',
      'ops-maintenance',
      'safety-emergency',
    ],
    sourceIds: const ['src-farm-safety', 'src-overview-edu'],
  ),
  'safety-remote': SmartFarmContent(
    id: 'safety-remote',
    title: '원격제어 안전',
    summary:
        '원격 쓰기는 편의와 위험이 동시에 커진다. 미구현 승인·인터록을 '
        '“있는 것처럼” 포장하지 않는다.',
    category: '안전·보안',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '멀리서 밸브·팬·난방을 켜는 기능은 편하지만, '
            '현장에 사람이 있는지·안전 조건이 맞는지 확인 없이 쓰면 사고로 이어질 수 있다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '원격 명령은 앱→서버→게이트웨이→PLC 경로에서 각 단계마다 '
            '권한·안전조건·감사가 적용되어야 한다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '승인된 환기·관수 조정, 야간 알람 후 원격 확인, '
            '외부 지원 진단(읽기 위주).',
      ),
      ContentSection(
        title: '구성요소',
        body: '최소 조건을 모두 갖춰야 “원격 제어”라고 부를 수 있다.',
        bullets: [
          '역할 기반 권한',
          '위험 동작 2차 확인',
          '안전조건 미충족 시 거부',
          '감사 로그',
          '로컬 우선·원격 차단 스위치',
        ],
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '요청 → 권한 → 안전조건 → (필요 시) 2차 확인 → 실행 → '
            '결과·로그 → 현장 확인.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: 'UI에 “승인” 버튼만 있고 PLC 인터록이 없는 경우.',
        bullets: ['AI 권고를 한도·승인 없이 PLC에 직접 연결', '공용 계정 원격 기동', '원격 차단 스위치 없음'],
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '진단·검증',
        body: '조건 위반·단절·권한별 시나리오를 SAT에서 반드시 시험한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body: '원격은 보조다. 필수 안전·비상은 현장 장치·로컬 PLC에 둔다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['원격제어', '승인', '인터록', '감사로그', '로컬우선'],
    relatedIds: const ['sw-remote', 'sw-auth', 'ops-control-design'],
    sourceIds: const ['src-control-safety', 'src-farm-safety'],
  ),
  'safety-emergency': SmartFarmContent(
    id: 'safety-emergency',
    title: '비상운전',
    summary:
        '정전·통신두절·화재·누설 시 누가 무엇을 하는지 현장 중심으로 정한다. '
        '앱·클라우드가 멈춰도 로컬 수동·안전측 동작이 가능해야 한다.',
    category: '안전·보안',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '큰 문제(정전, 화재, 누수, 통신 끊김)가 났을 때 '
            '사람·동물·설비를 먼저 지키고, 수동으로 운전하는 방법이다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            'fail-safe·로컬 우선·UPS 범위·비상정지·수동 밸브/개폐 위치가 '
            '소프트웨어와 독립적으로 동작해야 한다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '정전, 인터넷·클라우드 장애, 화재·누액·가스, '
            '야간 무인 구간 긴급 대응.',
      ),
      ContentSection(
        title: '구성요소',
        body: '문서·훈련·현장 표시·연락망·예비전원이 한 세트다.',
        bullets: ['비상 연락망', '수동 개폐·밸브 위치 표시', 'UPS/예비전원 범위', '정기 훈련 기록'],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '위험 확인 → 사람·동물 대피/안전 → 수동·안전측 전환 → '
            '현장 점검 → 복구 → 보고.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '비상 매뉴얼만 있고 스위치 위치·훈련이 없는 경우.',
        bullets: ['앱만 보고 수동 방법을 모름', 'UPS 범위 착각(펌프·환기 전부 커버 X)', '연락망 미갱신'],
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '분기별 모의 훈련·정전·통신 단절 시험으로 절차를 검증한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '비상 시에도 자격 없는 전기·화학 작업은 금지. '
            '현장 절차·법규를 따른다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['비상', '정전', '수동운전', '연락망', 'fail-safe'],
    relatedIds: const ['comm-offline', 'ops-incident', 'ops-training'],
    sourceIds: const ['src-farm-safety', 'src-kesco'],
  ),
  'safety-mechanical': SmartFarmContent(
    id: 'safety-mechanical',
    title: '기계 안전',
    summary:
        '팬·개폐기·컨베이어 등 가동부는 끼임·충돌 위험이 있다. '
        '가드·비상정지·LOTO 없이 원격·자동만 믿지 않는다.',
    category: '안전·보안',
    difficulty: Difficulty.practical,
    contentType: ContentType.checklist,
    farmTypes: const [
      FarmType.general,
      FarmType.greenhouse,
      FarmType.livestock,
    ],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.needsReview,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '움직이는 부품(팬, 체인, 개폐기, 컨베이어)은 손·옷·도구가 '
            '끼일 수 있다. 보호 덮개와 비상정지가 필요하다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '기계 위험은 에너지(전기·압력·관성) 제거·차단·잠금(LOTO)으로 '
            '정비 중 기동을 막는다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '정비·청소·이물 제거, 개폐기 점검, 컨베이어 주변 작업, '
            '원격 기동 전 현장 확인.',
      ),
      ContentSection(
        title: '구성요소',
        body: '가드·비상정지·인터록·경고 표지·정비 절차.',
        bullets: ['가드·비상정지 동작 확인', '정비 시 전원 차단·잠금', '원격 기동 전 사람 유무 확인'],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '작업 범위 확인 → 기동 위험 제거 → LOTO → 작업 → '
            '해제·시험 → 기록.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '가드 제거·우회, 비상정지 미시험, 원격으로 정비 중 기동.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '진단·검증',
        body: '비상정지·인터록·LOTO 절차를 정기 시험하고 기록한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '현장 안전 절차·KOSHA 등 가이드를 따르고, '
            '장비별 매뉴얼이 우선이다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['기계안전', '끼임', '가드', 'LOTO', '비상정지'],
    relatedIds: const ['safety-pump-motor', 'safety-remote', 'ops-training'],
    sourceIds: const ['src-kosha', 'src-farm-safety'],
  ),
  'safety-fire': SmartFarmContent(
    id: 'safety-fire',
    title: '화재·누전',
    summary:
        '전열·합선·분진·화학물질이 겹치면 화재 위험이 커진다. '
        '알람만 있고 현장 대응·소화·대피 훈련이 없으면 불충분하다.',
    category: '안전·보안',
    difficulty: Difficulty.practical,
    contentType: ContentType.checklist,
    farmTypes: const [FarmType.general, FarmType.storage, FarmType.livestock],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.needsReview,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '농장·온실·축사·창고에는 전기·난방·건조·분진·가연물이 함께 있어 '
            '화재·누전 위험이 있다. 미리 점검하고 대응을 연습해야 한다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '과열·합선·누전·아크는 감지(차단기·누전차단·온도)와 '
            '물리적 예방(배선·거리·청소)로 줄인다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '분전·난방·건조기·케이블·분진 구역 점검, '
            '소화기·대피로·연락·훈련.',
      ),
      ContentSection(
        title: '구성요소',
        body: '전기·열·화학·대응 장비·훈련.',
        bullets: ['전열기기 주변 가연물', '케이블 과열·손상', '소화기·대피로', '누전차단·접지'],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '정기 점검 → 이상 발견 → 전원 차단·격리 → '
            '전문가 점검 → 복구·기록.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body: '알람 앱만 믿고 소화기·대피 훈련 없음, 임시 배선 방치.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '진단·검증',
        body: '누전·절연·온도 이상·소화기 유효기간을 정기 확인한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '전기·화재 작업은 자격·법규·KESCO 가이드를 따른다. '
            '교육용 일반 원칙이 현장 전부를 대체하지 않는다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['화재', '누전', '과열', '소화', '대피'],
    relatedIds: const [
      'safety-electrical',
      'safety-emergency',
      'ops-site-survey',
    ],
    sourceIds: const ['src-kesco', 'src-electrical-safety'],
  ),
  'safety-backup': SmartFarmContent(
    id: 'safety-backup',
    title: '백업과 복구',
    summary:
        '백업이 있어도 복원 시험이 없으면 신뢰할 수 없다. '
        'PLC 프로그램·설정·이력·알람 정의를 함께 관리한다.',
    category: '안전·보안',
    difficulty: Difficulty.practical,
    contentType: ContentType.checklist,
    farmTypes: const [FarmType.general],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.needsReview,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '고장·랜섬웨어·실수로 설정이 날아갔을 때 '
            '예전 상태로 되돌릴 수 있게 복사본을 두는 일이다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '대상·주기·보존·암호화·오프라인 사본·복원 RTO/RPO를 정의한다. '
            '백업=복사, 복구=검증된 절차.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '실제 사용',
        body:
            'PLC/HMI 교체, 서버 장애, 잘못된 설정 배포, '
            '데이터 DB 손상 후 복구.',
        bullets: ['PLC/HMI 프로그램', '네트워크·계정 설정', '이력 DB', '알람 정의'],
      ),
      ContentSection(title: '구성요소', body: '로컬·원격·오프라인 매체, 버전, 담당, 복원 체크리스트.'),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '대상 선정 → 자동/수동 백업 → 보존·암호화 → '
            '주기적 복원 리허설 → 결과 기록.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body:
            '백업 파일만 쌓고 한 번도 복원해 보지 않음, '
            '백업 매체가 현장 PC와 같이 손실.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '분기별 복원 리허설로 시간·누락·버전 호환을 확인한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '복구 중에도 안전측·수동 운전 가능성을 유지한다. '
            '백업 매체 접근 권한을 통제한다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['백업', '복원', '설정', 'RTO', '리허설'],
    relatedIds: const ['ops-maintenance', 'safety-data', 'sw-cloud'],
    sourceIds: const ['src-firebase', 'src-overview-edu'],
  ),
  'safety-pump-motor': SmartFarmContent(
    id: 'safety-pump-motor',
    title: '펌프·모터 안전',
    summary:
        '건식운전·과부하·역상·밸브 잠김은 설비·배관 사고를 유발한다. '
        '소프트웨어 타이머만으로 보호했다고 보지 않는다.',
    category: '안전·보안',
    difficulty: Difficulty.practical,
    contentType: ContentType.checklist,
    farmTypes: const [
      FarmType.hydroponics,
      FarmType.greenhouse,
      FarmType.general,
    ],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.needsReview,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '물 없이 펌프를 돌리거나(건식), 막힌 밸브 상태에서 돌리면 '
            '모터·배관·누수 사고가 난다. 현장 보호장치가 필요하다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '유량·압력·레벨·과전류·열동·역상·인터록으로 '
            '위험 조건에서 기동·운전을 막거나 정지한다.',
        kind: SectionKind.important,
      ),
      ContentSection(title: '실제 사용', body: '관수·양액·순환·배수 펌프, 환기팬·개폐기 모터 보호.'),
      ContentSection(
        title: '구성요소',
        body: '센서·릴레이·MC·인버터·PLC 인터록·수동 정지.',
        bullets: ['유량/압력/레벨 조건', '과전류·열동', '최대 연속 운전시간', '원격 기동 시 현장 허용 신호'],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '위험 시나리오 정의 → 현장 보호장치 → PLC 인터록 → '
            '알람 → 원격 조건 → SAT.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body:
            '앱 타이머만 있고 레벨·유량 보호 없음, '
            '원격 기동 시 현장 확인 생략.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '진단·검증',
        body: '건식·밸브 닫힘·과부하 모의로 정지·알람을 시험한다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '제조사 보호 계전·배선·매뉴얼을 따른다. '
            '교육용 인터록 예시를 현장 공식값으로 단정하지 않는다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['펌프', '모터', '건식운전', '과부하', '인터록'],
    relatedIds: const ['ops-control-design', 'safety-mechanical', 'sw-alarm'],
    sourceIds: const [
      'src-kosha',
      'src-control-safety',
      'src-electrical-safety',
    ],
  ),
  'env-orchard': SmartFarmContent(
    id: 'env-orchard',
    title: '과수',
    summary:
        '과원은 미세기후·관수·방제·서리 등 이슈가 섞인다. '
        '자동화는 관수·기상 관측·기록부터 현실적으로 시작하고, '
        '방제·수확 판단은 사람 중심이다.',
    category: '환경',
    difficulty: Difficulty.basic,
    contentType: ContentType.concept,
    farmTypes: const [FarmType.orchard],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '과수는 밭 한 덩어리가 아니라 구역·고도·수종마다 '
            '온도·서리·수분이 다르다. 센서·관수·기록으로 '
            '“대표 구역”을 관리하는 접근이 현실적이다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '기상·토양수분·강우·풍속 등으로 관수·서리 대응·작업 이력을 '
            '연결한다. 방제·수확 자동화는 규정·안전·오탐 이슈가 크다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '관수 스케줄·토양수분 참고, 서리·동해 경보 논의, '
            '작업·수확 이력, (신중히) 카메라·AI 보조.',
      ),
      ContentSection(
        title: '구성요소',
        body: '기상·토양 센서, 관수 밸브·펌프, 기록·알람, 현장 확인.',
        bullets: ['기온·습도·강우·풍속', '토양수분(대표 지점)', '관수·시비 이력', '서리 대응 설비(해당 시)'],
      ),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '대표 구역·센서 위치 선정 → 관수·기록 자동화 → '
            '알람·현장 확인 → 방제·수확은 사람 판단.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body:
            '센서 한 점으로 전 과원을 대표한다고 가정, '
            'AI 오탐으로 방제·수확 자동 실행.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body: '관수 후 실제 토양·수세·열매 상태와 센서 값을 함께 본다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '고소·농약·전기·펌프·야간 서리 설비 위험. '
            '자격·안전수칙·RDA·현장 경험을 병행한다.',
        kind: SectionKind.safety,
      ),
    ],
    keywords: const ['과수', '과원', '관수', '미세기후', '서리'],
    relatedIds: const [
      'sensor-weather',
      'sensor-soil-moisture',
      'overview-farm-types',
    ],
    sourceIds: const ['src-rda', 'src-overview-edu'],
  ),
  'ai-timeseries': SmartFarmContent(
    id: 'ai-timeseries',
    title: '시계열 분석',
    summary:
        '온습도·전력 등 시간 흐름을 요약·비교한다. '
        '미래를 확정 예고하는 도구가 아니다.',
    category: 'AI·분석',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.greenhouse,
      FarmType.livestock,
      FarmType.storage,
    ],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus: ApplicationValidationStatus.deskReviewed,
    checkedAt: '2026-07-23',
    sections: const [
      ContentSection(
        title: '쉬운 설명',
        body:
            '센서 값이 시간에 따라 어떻게 변했는지 그래프·통계로 '
            '“패턴을 읽는” 방법이다. 오늘 밤·내일을 단정하지 않는다.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '기술 원리',
        body:
            '이동평균·중앙값으로 노이즈를 줄이고, 계절·일주기를 나누며, '
            '변수 간 상관으로 설비·환경 관계를 탐색한다.',
        bullets: ['이동평균/중앙값 — 노이즈 완화', '계절 분해 — 주기 파악', '상관 — 환기·온도 관계 탐색'],
      ),
      ContentSection(
        title: '실제 사용',
        body:
            '일변화 확인, 설비 주기·이상 전조 탐색, '
            '리포트·교육용 추세 설명, 예측 모델 입력 전처리.',
      ),
      ContentSection(title: '구성요소', body: '수집·타임스탬프·결측 처리·리샘플·시각화·메타데이터.'),
      ContentSection(
        title: '작업·판단 순서',
        body:
            '데이터 품질 확인 → 기간·결측 정리 → 시각화 → '
            '패턴 해석 → (필요 시) 모델·알람 연계(한도·승인).',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '잘못된 사례',
        body:
            '짧은 기간·센서 교체 전후 데이터를 한 그래프에 섞어 '
            '“추세”라고 단정, 정확도 %를 주장.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '진단·검증',
        body:
            '결측·이상치·센서 교체 이력을 표시하고 '
            '해석 가능한 범위에서만 결론을 낸다.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '안전·제한',
        body:
            '분석 결과를 자동 제어·방제 지시로 바로 연결하지 않는다. '
            'AI 한계·현장 확인을 병행한다.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '전문가 메모',
        body: '시계열 요약(탐색)과 예측 모델(불확실성) 목적을 혼동하지 않는다.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const ['시계열', '추세', '계절성', '이동평균', '상관'],
    relatedIds: const ['ai-prediction', 'ai-anomaly', 'ai-data-quality'],
    sourceIds: const ['src-ai-caution', 'src-overview-edu'],
  ),
};
