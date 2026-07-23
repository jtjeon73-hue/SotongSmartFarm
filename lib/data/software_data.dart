import '../models/smart_farm_content.dart';

/// 스마트팜 소프트웨어 교육 콘텐츠.
/// 기본 흐름: 센서·PLC→수집→검증→저장→분석→화면→알람→사용자판단→제어요청→안전조건→PLC실행
const List<SmartFarmContent> softwareContents = [
  SmartFarmContent(
    id: 'sw-architecture',
    title: '소프트웨어 아키텍처',
    summary:
        '현장 제어(PLC)·수집·저장·화면·알람·원격을 계층으로 나누고, '
        '인터넷 없이도 핵심 운전이 가능한 구조를 우선한다.',
    category: '소프트웨어',
    difficulty: Difficulty.beginner,
    contentType: ContentType.concept,
    farmTypes: [FarmType.general],
    keywords: ['아키텍처', '계층', '엣지', '로컬', '클라우드'],
    relatedIds: ['sw-collection', 'sw-cloud', 'sw-offline'],
    sourceIds: ['src-flutter'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '목적',
        body: '역할 분리로 장애 전파를 줄이고, 기술 스택을 목적에 맞게 선택한다.',
      ),
      ContentSection(
        title: '권장 흐름',
        body:
            '센서·PLC → 수집 → 검증 → 저장 → 분석 → 화면 → 알람 → '
            '사용자 판단 → 제어 요청 → 안전 조건 → PLC 실행',
        bullets: [
          'AI·클라우드는 분석·권고 단계에 두고, PLC 출력에 직접 연결하지 않는다.',
          '로컬 계층이 클라우드보다 먼저 살아 있어야 한다.',
        ],
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '기술 선택 예',
        body: '목적별 예시(현장·버전에 따라 달라짐).',
        bullets: [
          'Flutter: 크로스플랫폼 모니터/교육 앱',
          'Web: 관리자 대시보드',
          'Android: 현장 태블릿',
          'MFC/C++: 레거시 Windows 수집·제어 HMI',
          'Python: 분석·배치·프로토타입',
          'DB / CSV / SQLite: 저장',
          'API·서버·Firebase·클라우드: 원격 동기·인증(선택)',
        ],
      ),
      ContentSection(
        title: '로컬 vs 클라우드',
        body:
            '로컬은 지연·가용성·필수 제어에 유리하고, '
            '클라우드는 백업·다중 농장 조회·협업에 유리하다. '
            '어느 한쪽만으로 모든 요구를 충족한다고 단정하지 않는다.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '주의',
        body: '화면이 화려해도 수집·검증·안전 인터록이 없으면 운영 소프트웨어가 아니다.',
        kind: SectionKind.expertNote,
      ),
    ],
  ),
  SmartFarmContent(
    id: 'sw-collection',
    title: '데이터 수집',
    summary: 'PLC·센서에서 값을 읽고 타임스탬프·품질 플래그와 함께 넘긴다.',
    category: '소프트웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general],
    keywords: ['수집', '폴링', '타임스탬프', '품질'],
    relatedIds: ['sw-storage', 'ai-data-quality', 'comm-modbus-rtu'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(title: '역할', body: '주기적 폴링 또는 이벤트 수신으로 raw 데이터를 확보한다.'),
      ContentSection(
        title: '구현 포인트',
        body: '세부 항목은 아래 목록을 참고한다.',
        bullets: [
          '장치 시계와 서버 시계 동기',
          '타임아웃·재시도·백오프',
          '단위·스케일·엔디안은 매뉴얼 확인',
          '수집 실패도 로그로 남겨 공백을 숨기지 않음',
        ],
      ),
      ContentSection(
        title: '기술 예',
        body:
            'MFC/C++ 시리얼·소켓, Python pymodbus류, 게이트웨이 MQTT, Flutter는 주로 API 소비.',
      ),
      ContentSection(
        title: '검증 연결',
        body: '수집 직후 범위·변화율·통신 품질 검사를 거친다.',
        kind: SectionKind.flow,
      ),
    ],
  ),
  SmartFarmContent(
    id: 'sw-storage',
    title: '데이터 저장',
    summary: 'CSV·SQLite·DB·클라우드에 목적별로 저장하고, 보존 기간과 백업을 정의한다.',
    category: '소프트웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general],
    keywords: ['저장', 'SQLite', 'CSV', 'DB', '백업'],
    relatedIds: ['sw-collection', 'safety-backup', 'ai-data-quality'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '선택 기준',
        body: '세부 항목은 아래 목록을 참고한다.',
        bullets: [
          'CSV: 단순 내보내기·교육·소규모',
          'SQLite: 로컬 앱·오프라인',
          '서버 DB: 다중 사용자·장기 이력',
          'Firebase 등: 동기·인증이 필요할 때(보안 설정 필수)',
        ],
      ),
      ContentSection(
        title: '필드 예',
        body:
            'timestamp, farmId, zoneId, deviceId, sensorType, value, unit, quality 등.',
      ),
      ContentSection(
        title: '주의',
        body: '덮어쓰기만 하고 이력이 없으면 사고 분석이 불가능하다.',
        kind: SectionKind.important,
      ),
    ],
  ),
  SmartFarmContent(
    id: 'sw-monitoring',
    title: '모니터링',
    summary: '현재값·추세·통신상태를 사람이 빠르게 판단할 수 있게 보여준다.',
    category: '소프트웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general, FarmType.greenhouse],
    keywords: ['모니터링', '실시간', '상태', '품질표시'],
    relatedIds: ['sw-dashboard', 'sw-alarm', 'ai-ops-monitoring'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '필수 표시',
        body: '세부 항목은 아래 목록을 참고한다.',
        bullets: [
          '측정값과 단위',
          '최종 수신 시각',
          '통신/품질 상태',
          '자동·수동·원격 모드',
          '출력(팬·펌프 등) 상태',
        ],
      ),
      ContentSection(
        title: '원칙',
        body: '예쁜 차트보다 “지금 믿을 수 있는가”가 우선이다.',
        kind: SectionKind.important,
      ),
    ],
  ),
  SmartFarmContent(
    id: 'sw-dashboard',
    title: '대시보드 설계',
    summary: '구역·설비 단위로 요약하고, 경보·추세·작업 메모를 한 화면에서 연결한다.',
    category: '소프트웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.procedure,
    farmTypes: [FarmType.general],
    keywords: ['대시보드', '요약', 'KPI', 'UI'],
    relatedIds: ['sw-monitoring', 'ops-kpi', 'sw-mobile'],
    sourceIds: ['src-flutter'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '구성',
        body: '세부 항목은 아래 목록을 참고한다.',
        bullets: ['상단: 치명 알람', '중앙: 구역 카드/맵(과도한 카드 남발 지양)', '하단/상세: 시계열·장비 상태'],
      ),
      ContentSection(
        title: '기술',
        body: 'Flutter Web/모바일, 또는 Web 프론트 + API. 데이터는 검증된 저장소에서.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'sw-alarm',
    title: '알람 설계',
    summary: '임계·통신두절·품질불량·안전인터록을 구분하고, 경보 폭주(알람 홍수)를 막는다.',
    category: '소프트웨어',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: [FarmType.general],
    keywords: ['알람', '임계', '히스테리시스', '확인'],
    relatedIds: ['sw-monitoring', 'safety-remote', 'ops-incident'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '등급',
        body: '세부 항목은 아래 목록을 참고한다.',
        bullets: ['정보', '주의', '위험', '안전정지'],
      ),
      ContentSection(
        title: '설계 팁',
        body: '세부 항목은 아래 목록을 참고한다.',
        bullets: ['히스테리시스·지속시간으로 채터링 방지', '센서 고장과 실제 이상 환경 구분', '알람 확인자·시각 기록'],
      ),
      ContentSection(
        title: '주의',
        body: '임의 “공식 설정값”을 앱이 단정하지 않는다. 작물·시설별로 현장 합의한다.',
        kind: SectionKind.important,
      ),
    ],
  ),
  SmartFarmContent(
    id: 'sw-remote',
    title: '원격 감시·제어',
    summary: '원격은 편의 기능이다. 쓰기 권한·승인·인터록·감사로그 없이 열면 위험하다.',
    category: '소프트웨어',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general],
    keywords: ['원격', 'VPN', '승인', '감사로그'],
    relatedIds: ['safety-remote', 'sw-auth', 'comm-offline'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '권장',
        body: '세부 항목은 아래 목록을 참고한다.',
        bullets: [
          '기본은 감시(읽기)',
          '제어는 역할 기반 + 2차 확인',
          '안전 조건 미충족 시 거부',
          '인터넷 단절 시 로컬 우선',
        ],
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '흐름',
        body: '사용자 판단 → 제어요청 → 안전조건 → PLC실행',
        kind: SectionKind.flow,
      ),
    ],
  ),
  SmartFarmContent(
    id: 'sw-auth',
    title: '인증과 권한',
    summary: '누가 무엇을 읽고/쓸 수 있는지 명확히 한다. 공용 계정은 사고 추적을 막는다.',
    category: '소프트웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.procedure,
    farmTypes: [FarmType.general],
    keywords: ['인증', 'RBAC', '계정', '권한'],
    relatedIds: ['safety-accounts', 'sw-remote', 'safety-privacy'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '역할 예',
        body: '세부 항목은 아래 목록을 참고한다.',
        bullets: ['조회자', '작업자', '관리자', '유지보수', '외부지원(임시)'],
      ),
      ContentSection(
        title: '기술',
        body: 'Firebase Auth, 자체 API 토큰, OS 계정 등. 비밀키는 저장소·CI에 하드코딩하지 않는다.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'sw-mobile',
    title: 'Flutter·모바일 앱',
    summary: '현장 조회·알람·체크리스트에 적합. 필수 제어의 유일한 수단으로 두지 않는다.',
    category: '소프트웨어',
    difficulty: Difficulty.basic,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general],
    keywords: ['Flutter', '모바일', 'Android', '오프라인캐시'],
    relatedIds: ['sw-dashboard', 'sw-offline', 'sw-auth'],
    sourceIds: ['src-flutter'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '적합 기능',
        body: '세부 항목은 아래 목록을 참고한다.',
        bullets: ['현황 조회', '알람 확인', '작업 기록', '교육 콘텐츠'],
      ),
      ContentSection(
        title: '주의',
        body: '배터리·전파·OS 백그라운드 제한으로 항상 연결된다고 가정하지 않는다.',
        kind: SectionKind.important,
      ),
    ],
  ),
  SmartFarmContent(
    id: 'sw-mfc',
    title: 'MFC/C++ 수집·HMI',
    summary: 'Windows 기반 레거시/산업 현장에서 시리얼·소켓 수집과 운전화면에 쓰인다.',
    category: '소프트웨어',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general],
    keywords: ['MFC', 'C++', 'HMI', '시리얼'],
    relatedIds: ['sw-collection', 'comm-modbus-rtu', 'case-plc-mfc'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(title: '강점', body: '저수준 포트 제어, 기존 설비 친화, 로컬 실시간 UI.'),
      ContentSection(
        title: '한계',
        body: '모바일·배포·인력 수급. Flutter/Web과 역할 분담이 현실적이다.',
      ),
      ContentSection(
        title: '연동',
        body: 'MFC가 수집·제어, Flutter/Web이 조회·보고인 하이브리드가 흔하다.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'sw-cloud',
    title: '클라우드·API·Firebase',
    summary: '원격 동기·다중 단말·백업에 유용하나, 제어 루프의 필수 조건으로 두면 위험하다.',
    category: '소프트웨어',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: [FarmType.general],
    keywords: ['클라우드', 'API', 'Firebase', '서버'],
    relatedIds: ['sw-offline', 'sw-architecture', 'safety-data'],
    verificationStatus: VerificationStatus.versionDependent,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '적합한 일',
        body: '세부 항목은 아래 목록을 참고한다.',
        bullets: ['이력 백업', '다중 농장 조회', '모바일 동기', '협업'],
      ),
      ContentSection(
        title: '부적합한 전제',
        body: '클라우드 응답이 와야만 팬이 도는 구조.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '비교',
        body: '로컬: 가용성·지연. 클라우드: 확장·접근성. 병행 설계가 일반적이다.',
      ),
    ],
  ),
  SmartFarmContent(
    id: 'sw-offline',
    title: '오프라인 소프트웨어 전략',
    summary: '로컬 큐·SQLite·재동기화로 단절을 견딘다. 화면 캐시만으로 제어했다고 착각하지 않는다.',
    category: '소프트웨어',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: [FarmType.general],
    keywords: ['오프라인', '큐', '동기화', '충돌'],
    relatedIds: ['comm-offline', 'sw-storage', 'sw-cloud'],
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '구성',
        body: '세부 항목은 아래 목록을 참고한다.',
        bullets: [
          '로컬 저장(SQLite/CSV)',
          '송신 큐와 재시도',
          '충돌 정책(서버권위/최신권위 명시)',
          '단절 모드 UI 표시',
        ],
      ),
      ContentSection(
        title: '시험',
        body: '비행기모드·회선차단으로 수집·알람·로컬제어를 검증한다.',
        kind: SectionKind.fieldCheck,
      ),
    ],
  ),
];
