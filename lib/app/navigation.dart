class NavItem {
  const NavItem({
    required this.id,
    required this.title,
    required this.route,
    this.contentId,
  });

  final String id;
  final String title;
  final String route;
  final String? contentId;
}

class NavGroup {
  const NavGroup({
    required this.id,
    required this.title,
    required this.iconName,
    required this.items,
  });

  final String id;
  final String title;
  final String iconName;
  final List<NavItem> items;
}

class AppNavigation {
  static const List<NavGroup> groups = [
    NavGroup(
      id: 'overview',
      title: '스마트팜 이해',
      iconName: 'school',
      items: [
        NavItem(
          id: 'ov-what',
          title: '스마트팜이란',
          route: '/overview/what-is-smart-farm',
          contentId: 'overview-what',
        ),
        NavItem(
          id: 'ov-arch',
          title: '스마트팜의 구성',
          route: '/overview/architecture',
          contentId: 'overview-architecture',
        ),
        NavItem(
          id: 'ov-flow',
          title: '데이터에서 제어까지',
          route: '/overview/data-to-control',
          contentId: 'overview-data-to-control',
        ),
        NavItem(
          id: 'ov-pros',
          title: '장점과 한계',
          route: '/overview/pros-cons',
          contentId: 'overview-pros-cons',
        ),
        NavItem(
          id: 'ov-types',
          title: '농장 유형별 차이',
          route: '/overview/farm-types',
          contentId: 'overview-farm-types',
        ),
        NavItem(
          id: 'ov-check',
          title: '도입 전 확인사항',
          route: '/overview/before-intro',
          contentId: 'overview-before-intro',
        ),
      ],
    ),
    NavGroup(
      id: 'environment',
      title: '재배·축산 환경',
      iconName: 'eco',
      items: [
        NavItem(
          id: 'env-gh',
          title: '시설원예',
          route: '/environment/greenhouse',
          contentId: 'env-greenhouse',
        ),
        NavItem(
          id: 'env-of',
          title: '노지농업',
          route: '/environment/open-field',
          contentId: 'env-open-field',
        ),
        NavItem(
          id: 'env-or',
          title: '과수',
          route: '/environment/orchard',
          contentId: 'env-orchard',
        ),
        NavItem(
          id: 'env-hy',
          title: '수경재배',
          route: '/environment/hydroponics',
          contentId: 'env-hydroponics',
        ),
        NavItem(
          id: 'env-mu',
          title: '버섯재배',
          route: '/environment/mushroom',
          contentId: 'env-mushroom',
        ),
        NavItem(
          id: 'env-li',
          title: '축산',
          route: '/environment/livestock',
          contentId: 'env-livestock',
        ),
        NavItem(
          id: 'env-st',
          title: '저장·선별시설',
          route: '/environment/storage',
          contentId: 'env-storage',
        ),
      ],
    ),
    NavGroup(
      id: 'sensors',
      title: '센서와 계측',
      iconName: 'sensors',
      items: [
        NavItem(
          id: 'sen-th',
          title: '온도·습도 센서',
          route: '/sensors/temp-humidity',
          contentId: 'sensor-temp-humidity',
        ),
        NavItem(
          id: 'sen-sm',
          title: '토양수분 센서',
          route: '/sensors/soil-moisture',
          contentId: 'sensor-soil-moisture',
        ),
        NavItem(
          id: 'sen-li',
          title: '일사·광량 센서',
          route: '/sensors/light',
          contentId: 'sensor-light',
        ),
        NavItem(
          id: 'sen-co2',
          title: 'CO₂ 센서',
          route: '/sensors/co2',
          contentId: 'sensor-co2',
        ),
        NavItem(
          id: 'sen-ph',
          title: 'pH·EC 센서',
          route: '/sensors/ph-ec',
          contentId: 'sensor-ph-ec',
        ),
        NavItem(
          id: 'sen-fl',
          title: '수위·유량·압력',
          route: '/sensors/level-flow-pressure',
          contentId: 'sensor-level-flow',
        ),
        NavItem(
          id: 'sen-wx',
          title: '풍향·풍속·강우',
          route: '/sensors/weather',
          contentId: 'sensor-weather',
        ),
        NavItem(
          id: 'sen-cam',
          title: '카메라·영상 센서',
          route: '/sensors/camera',
          contentId: 'sensor-camera',
        ),
        NavItem(
          id: 'sen-sel',
          title: '센서 선정과 설치',
          route: '/sensors/selection',
          contentId: 'sensor-selection',
        ),
        NavItem(
          id: 'sen-cal',
          title: '교정·오류·유지관리',
          route: '/sensors/calibration',
          contentId: 'sensor-calibration',
        ),
      ],
    ),
    NavGroup(
      id: 'control',
      title: '제어와 PLC',
      iconName: 'memory',
      items: [
        NavItem(
          id: 'ctl-base',
          title: '자동제어 기초',
          route: '/control/basics',
          contentId: 'control-basics',
        ),
        NavItem(
          id: 'ctl-plc',
          title: 'PLC 기본',
          route: '/control/plc-basics',
          contentId: 'control-plc-basics',
        ),
        NavItem(
          id: 'ctl-scan',
          title: 'PLC 스캔 사이클',
          route: '/control/scan-cycle',
          contentId: 'control-scan-cycle',
        ),
        NavItem(
          id: 'ctl-io',
          title: '입력·출력',
          route: '/control/io',
          contentId: 'control-io',
        ),
        NavItem(
          id: 'ctl-ladder',
          title: '래더 기초',
          route: '/control/ladder',
          contentId: 'control-ladder',
        ),
        NavItem(
          id: 'ctl-timer',
          title: '타이머·카운터',
          route: '/control/timer-counter',
          contentId: 'control-timer-counter',
        ),
        NavItem(
          id: 'ctl-interlock',
          title: '인터록·비상정지',
          route: '/control/interlock',
          contentId: 'control-interlock',
        ),
        NavItem(
          id: 'ctl-scale',
          title: '아날로그 스케일링',
          route: '/control/analog-scaling',
          contentId: 'control-analog-scaling',
        ),
        NavItem(
          id: 'ctl-env',
          title: '온도·관수·환기 제어',
          route: '/control/env-control',
          contentId: 'control-env',
        ),
        NavItem(
          id: 'ctl-drive',
          title: '인버터·모터·밸브',
          route: '/control/drives',
          contentId: 'control-drives',
        ),
        NavItem(
          id: 'ctl-mode',
          title: '수동·자동 운전',
          route: '/control/manual-auto',
          contentId: 'control-manual-auto',
        ),
        NavItem(
          id: 'ctl-fault',
          title: '고장과 안전상태',
          route: '/control/fault-safe',
          contentId: 'control-fault-safe',
        ),
      ],
    ),
    NavGroup(
      id: 'hardware',
      title: '하드웨어',
      iconName: 'developer_board',
      items: [
        NavItem(
          id: 'hw-panel',
          title: '제어반',
          route: '/hardware/panel',
          contentId: 'hw-panel',
        ),
        NavItem(
          id: 'hw-power',
          title: '전원과 보호장치',
          route: '/hardware/power',
          contentId: 'hw-power',
        ),
        NavItem(
          id: 'hw-ipc',
          title: '산업용 PC',
          route: '/hardware/ipc',
          contentId: 'hw-ipc',
        ),
        NavItem(
          id: 'hw-rio',
          title: 'PLC·원격 I/O',
          route: '/hardware/remote-io',
          contentId: 'hw-remote-io',
        ),
        NavItem(
          id: 'hw-gw',
          title: '게이트웨이',
          route: '/hardware/gateway',
          contentId: 'hw-gateway',
        ),
        NavItem(
          id: 'hw-act',
          title: '액추에이터',
          route: '/hardware/actuators',
          contentId: 'hw-actuators',
        ),
        NavItem(
          id: 'hw-cam',
          title: '카메라',
          route: '/hardware/camera',
          contentId: 'hw-camera',
        ),
        NavItem(
          id: 'hw-hmi',
          title: '현장 표시장치',
          route: '/hardware/hmi',
          contentId: 'hw-hmi',
        ),
        NavItem(
          id: 'hw-ups',
          title: 'UPS·비상전원',
          route: '/hardware/ups',
          contentId: 'hw-ups',
        ),
        NavItem(
          id: 'hw-env',
          title: '방수·방진·내환경',
          route: '/hardware/enclosure',
          contentId: 'hw-enclosure',
        ),
      ],
    ),
    NavGroup(
      id: 'comm',
      title: '통신과 네트워크',
      iconName: 'lan',
      items: [
        NavItem(
          id: 'com-base',
          title: '통신 기초',
          route: '/communication/basics',
          contentId: 'comm-basics',
        ),
        NavItem(
          id: 'com-rs',
          title: 'RS-232·RS-485',
          route: '/communication/rs232-485',
          contentId: 'comm-rs',
        ),
        NavItem(
          id: 'com-mbr',
          title: 'Modbus RTU',
          route: '/communication/modbus-rtu',
          contentId: 'comm-modbus-rtu',
        ),
        NavItem(
          id: 'com-eth',
          title: 'Ethernet',
          route: '/communication/ethernet',
          contentId: 'comm-ethernet',
        ),
        NavItem(
          id: 'com-mbt',
          title: 'Modbus TCP',
          route: '/communication/modbus-tcp',
          contentId: 'comm-modbus-tcp',
        ),
        NavItem(
          id: 'com-wifi',
          title: 'Wi-Fi',
          route: '/communication/wifi',
          contentId: 'comm-wifi',
        ),
        NavItem(
          id: 'com-lora',
          title: 'LoRa·저전력 무선',
          route: '/communication/lora',
          contentId: 'comm-lora',
        ),
        NavItem(
          id: 'com-mqtt',
          title: 'MQTT',
          route: '/communication/mqtt',
          contentId: 'comm-mqtt',
        ),
        NavItem(
          id: 'com-gw',
          title: '게이트웨이',
          route: '/communication/gateway',
          contentId: 'comm-gateway',
        ),
        NavItem(
          id: 'com-net',
          title: '농장 네트워크',
          route: '/communication/farm-network',
          contentId: 'comm-farm-network',
        ),
        NavItem(
          id: 'com-off',
          title: '인터넷 장애 대응',
          route: '/communication/offline',
          contentId: 'comm-offline',
        ),
        NavItem(
          id: 'com-diag',
          title: '통신 진단',
          route: '/communication/diagnostics',
          contentId: 'comm-diagnostics',
        ),
      ],
    ),
    NavGroup(
      id: 'software',
      title: '소프트웨어',
      iconName: 'code',
      items: [
        NavItem(
          id: 'sw-arch',
          title: '소프트웨어 구조',
          route: '/software/architecture',
          contentId: 'sw-architecture',
        ),
        NavItem(
          id: 'sw-collect',
          title: '데이터 수집',
          route: '/software/collection',
          contentId: 'sw-collection',
        ),
        NavItem(
          id: 'sw-store',
          title: '데이터 저장',
          route: '/software/storage',
          contentId: 'sw-storage',
        ),
        NavItem(
          id: 'sw-mon',
          title: '실시간 모니터링',
          route: '/software/monitoring',
          contentId: 'sw-monitoring',
        ),
        NavItem(
          id: 'sw-dash',
          title: '대시보드',
          route: '/software/dashboard',
          contentId: 'sw-dashboard',
        ),
        NavItem(
          id: 'sw-alarm',
          title: '알람',
          route: '/software/alarm',
          contentId: 'sw-alarm',
        ),
        NavItem(
          id: 'sw-remote',
          title: '원격제어',
          route: '/software/remote-control',
          contentId: 'sw-remote',
        ),
        NavItem(
          id: 'sw-auth',
          title: '사용자 권한',
          route: '/software/auth',
          contentId: 'sw-auth',
        ),
        NavItem(
          id: 'sw-mobile',
          title: '모바일 앱',
          route: '/software/mobile',
          contentId: 'sw-mobile',
        ),
        NavItem(
          id: 'sw-mfc',
          title: 'MFC 현장 프로그램',
          route: '/software/mfc',
          contentId: 'sw-mfc',
        ),
        NavItem(
          id: 'sw-cloud',
          title: '클라우드',
          route: '/software/cloud',
          contentId: 'sw-cloud',
        ),
        NavItem(
          id: 'sw-offline',
          title: '오프라인 운영',
          route: '/software/offline',
          contentId: 'sw-offline',
        ),
      ],
    ),
    NavGroup(
      id: 'ai',
      title: 'AI와 데이터 분석',
      iconName: 'psychology',
      items: [
        NavItem(
          id: 'ai-base',
          title: 'AI 기본',
          route: '/ai/basics',
          contentId: 'ai-basics',
        ),
        NavItem(
          id: 'ai-dq',
          title: '데이터 품질',
          route: '/ai/data-quality',
          contentId: 'ai-data-quality',
        ),
        NavItem(
          id: 'ai-ts',
          title: '시계열 분석',
          route: '/ai/timeseries',
          contentId: 'ai-timeseries',
        ),
        NavItem(
          id: 'ai-ad',
          title: '이상 감지',
          route: '/ai/anomaly',
          contentId: 'ai-anomaly',
        ),
        NavItem(
          id: 'ai-pred',
          title: '예측',
          route: '/ai/prediction',
          contentId: 'ai-prediction',
        ),
        NavItem(
          id: 'ai-vision',
          title: '영상 분석',
          route: '/ai/vision',
          contentId: 'ai-vision',
        ),
        NavItem(
          id: 'ai-growth',
          title: '생육 분석',
          route: '/ai/growth',
          contentId: 'ai-growth',
        ),
        NavItem(
          id: 'ai-energy',
          title: '에너지 분석',
          route: '/ai/energy',
          contentId: 'ai-energy',
        ),
        NavItem(
          id: 'ai-rec',
          title: '관수·환기 추천',
          route: '/ai/recommendations',
          contentId: 'ai-recommendations',
        ),
        NavItem(
          id: 'ai-limit',
          title: 'AI 의사결정의 한계',
          route: '/ai/limits',
          contentId: 'ai-limits',
        ),
        NavItem(
          id: 'ai-eval',
          title: '모델 평가',
          route: '/ai/evaluation',
          contentId: 'ai-evaluation',
        ),
        NavItem(
          id: 'ai-ops',
          title: '운영 모니터링',
          route: '/ai/ops-monitoring',
          contentId: 'ai-ops-monitoring',
        ),
      ],
    ),
    NavGroup(
      id: 'ops',
      title: '구축과 운영',
      iconName: 'engineering',
      items: [
        NavItem(
          id: 'ops-req',
          title: '요구사항 조사',
          route: '/operations/requirements',
          contentId: 'ops-requirements',
        ),
        NavItem(
          id: 'ops-site',
          title: '농장 현장조사',
          route: '/operations/site-survey',
          contentId: 'ops-site-survey',
        ),
        NavItem(
          id: 'ops-equip',
          title: '설비 목록',
          route: '/operations/equipment',
          contentId: 'ops-equipment',
        ),
        NavItem(
          id: 'ops-sensor',
          title: '센서 선정',
          route: '/operations/sensor-selection',
          contentId: 'ops-sensor-selection',
        ),
        NavItem(
          id: 'ops-ctl',
          title: '제어 설계',
          route: '/operations/control-design',
          contentId: 'ops-control-design',
        ),
        NavItem(
          id: 'ops-sw',
          title: '소프트웨어 설계',
          route: '/operations/software-design',
          contentId: 'ops-software-design',
        ),
        NavItem(
          id: 'ops-install',
          title: '설치·시운전',
          route: '/operations/commissioning',
          contentId: 'ops-commissioning',
        ),
        NavItem(
          id: 'ops-train',
          title: '운영자 교육',
          route: '/operations/training',
          contentId: 'ops-training',
        ),
        NavItem(
          id: 'ops-maint',
          title: '유지관리',
          route: '/operations/maintenance',
          contentId: 'ops-maintenance',
        ),
        NavItem(
          id: 'ops-cost',
          title: '비용과 확장',
          route: '/operations/cost',
          contentId: 'ops-cost',
        ),
        NavItem(
          id: 'ops-inc',
          title: '장애 대응',
          route: '/operations/incident',
          contentId: 'ops-incident',
        ),
        NavItem(
          id: 'ops-kpi',
          title: '성과 측정',
          route: '/operations/kpi',
          contentId: 'ops-kpi',
        ),
      ],
    ),
    NavGroup(
      id: 'safety',
      title: '안전과 보안',
      iconName: 'security',
      items: [
        NavItem(
          id: 'sf-elec',
          title: '전기 안전',
          route: '/safety/electrical',
          contentId: 'safety-electrical',
        ),
        NavItem(
          id: 'sf-mech',
          title: '기계 안전',
          route: '/safety/mechanical',
          contentId: 'safety-mechanical',
        ),
        NavItem(
          id: 'sf-fire',
          title: '화재·누전',
          route: '/safety/fire',
          contentId: 'safety-fire',
        ),
        NavItem(
          id: 'sf-pump',
          title: '펌프·모터 안전',
          route: '/safety/pump-motor',
          contentId: 'safety-pump-motor',
        ),
        NavItem(
          id: 'sf-chem',
          title: '약품·양액 안전',
          route: '/safety/chemical',
          contentId: 'safety-chemical',
        ),
        NavItem(
          id: 'sf-remote',
          title: '원격제어 안전',
          route: '/safety/remote',
          contentId: 'safety-remote',
        ),
        NavItem(
          id: 'sf-data',
          title: '데이터 보안',
          route: '/safety/data',
          contentId: 'safety-data',
        ),
        NavItem(
          id: 'sf-auth',
          title: '계정과 권한',
          route: '/safety/accounts',
          contentId: 'safety-accounts',
        ),
        NavItem(
          id: 'sf-net',
          title: '네트워크 보안',
          route: '/safety/network',
          contentId: 'safety-network',
        ),
        NavItem(
          id: 'sf-backup',
          title: '백업과 복구',
          route: '/safety/backup',
          contentId: 'safety-backup',
        ),
        NavItem(
          id: 'sf-privacy',
          title: '개인정보',
          route: '/safety/privacy',
          contentId: 'safety-privacy',
        ),
        NavItem(
          id: 'sf-emergency',
          title: '비상운전',
          route: '/safety/emergency',
          contentId: 'safety-emergency',
        ),
      ],
    ),
    NavGroup(
      id: 'expert',
      title: '전문가 심화',
      iconName: 'workspace_premium',
      items: [
        NavItem(
          id: 'ex-arch',
          title: '참조 아키텍처',
          route: '/expert/architecture',
          contentId: 'expert-architecture',
        ),
        NavItem(
          id: 'ex-edge',
          title: 'Edge·Cloud 배치',
          route: '/expert/edge-cloud',
          contentId: 'expert-edge-cloud',
        ),
        NavItem(
          id: 'ex-ctl',
          title: '제어 안정성·검증',
          route: '/expert/control-validation',
          contentId: 'expert-control-validation',
        ),
        NavItem(
          id: 'ex-fmea-c',
          title: 'FMEA 개념',
          route: '/expert/fmea-concept',
          contentId: 'expert-fmea',
        ),
        NavItem(
          id: 'ex-safe',
          title: '전기·기계·공정 안전',
          route: '/expert/safety-process',
          contentId: 'expert-safety-process',
        ),
        NavItem(
          id: 'ex-sec',
          title: '산업제어 보안',
          route: '/expert/security',
          contentId: 'expert-security',
        ),
        NavItem(
          id: 'ex-ai',
          title: 'AI 모델 평가',
          route: '/expert/ai-evaluation',
          contentId: 'expert-ai-evaluation',
        ),
        NavItem(
          id: 'ex-mlops',
          title: '드리프트·MLOps',
          route: '/expert/mlops',
          contentId: 'expert-mlops',
        ),
        NavItem(
          id: 'ex-twin',
          title: '디지털 트윈',
          route: '/expert/digital-twin',
          contentId: 'expert-digital-twin',
        ),
        NavItem(
          id: 'ex-energy',
          title: '에너지·자원',
          route: '/expert/energy',
          contentId: 'expert-energy',
        ),
        NavItem(
          id: 'ex-rel',
          title: '신뢰성·가용성',
          route: '/expert/reliability',
          contentId: 'expert-reliability',
        ),
        NavItem(
          id: 'ex-slo',
          title: '운영지표·SLO',
          route: '/expert/slo',
          contentId: 'expert-slo',
        ),
        NavItem(
          id: 'ex-log',
          title: '로그·감사',
          route: '/expert/logging',
          contentId: 'expert-logging',
        ),
        NavItem(
          id: 'ex-rb-c',
          title: '런북 개념',
          route: '/expert/runbooks-concept',
          contentId: 'expert-runbooks',
        ),
        NavItem(
          id: 'ex-fat-c',
          title: 'FAT·SAT 개념',
          route: '/expert/fat-sat-concept',
          contentId: 'expert-fat-sat',
        ),
        NavItem(
          id: 'ex-chg',
          title: '변경관리',
          route: '/expert/change-mgmt',
          contentId: 'expert-change-mgmt',
        ),
        NavItem(
          id: 'ex-fmea',
          title: 'FMEA 목록',
          route: '/fmea',
          contentId: null,
        ),
        NavItem(
          id: 'ex-runbooks',
          title: '런북 목록',
          route: '/runbooks',
          contentId: null,
        ),
        NavItem(
          id: 'ex-fatsat',
          title: 'FAT·SAT 목록',
          route: '/fat-sat',
          contentId: null,
        ),
        NavItem(
          id: 'ex-tools',
          title: '전문가 도구',
          route: '/expert-tools',
          contentId: null,
        ),
        NavItem(
          id: 'ex-code',
          title: '코드 예제',
          route: '/code-examples',
          contentId: null,
        ),
      ],
    ),
    NavGroup(
      id: 'cases',
      title: '사례와 프로젝트',
      iconName: 'folder_special',
      items: [
        NavItem(
          id: 'cases-list',
          title: '교육용 사례 목록',
          route: '/cases',
          contentId: null,
        ),
        NavItem(
          id: 'prompts',
          title: '프롬프트 라이브러리',
          route: '/prompts',
          contentId: null,
        ),
        NavItem(
          id: 'tools',
          title: '실무 계산 도구',
          route: '/tools',
          contentId: null,
        ),
        NavItem(
          id: 'checklists',
          title: '실무 체크리스트',
          route: '/checklists',
          contentId: null,
        ),
      ],
    ),
    NavGroup(
      id: 'glossary',
      title: '용어·자료',
      iconName: 'menu_book',
      items: [
        NavItem(
          id: 'gl-smart',
          title: '스마트팜 용어',
          route: '/glossary/smart-farm',
          contentId: 'glossary-smart-farm',
        ),
        NavItem(
          id: 'gl-sensor',
          title: '센서 용어',
          route: '/glossary/sensors',
          contentId: 'glossary-sensors',
        ),
        NavItem(
          id: 'gl-plc',
          title: 'PLC·제어 용어',
          route: '/glossary/plc',
          contentId: 'glossary-plc',
        ),
        NavItem(
          id: 'gl-comm',
          title: '통신 용어',
          route: '/glossary/communication',
          contentId: 'glossary-communication',
        ),
        NavItem(
          id: 'gl-ai',
          title: 'AI·데이터 용어',
          route: '/glossary/ai',
          contentId: 'glossary-ai',
        ),
        NavItem(
          id: 'gl-agri',
          title: '농업환경 용어',
          route: '/glossary/agriculture',
          contentId: 'glossary-agriculture',
        ),
        NavItem(
          id: 'gl-src',
          title: '공식자료',
          route: '/glossary/sources',
          contentId: 'glossary-sources',
        ),
        NavItem(
          id: 'gl-road',
          title: '학습 로드맵',
          route: '/glossary/roadmap',
          contentId: 'glossary-roadmap',
        ),
        NavItem(
          id: 'gl-check',
          title: '체크리스트',
          route: '/glossary/checklist',
          contentId: 'glossary-checklist',
        ),
        NavItem(
          id: 'gl-faq',
          title: 'FAQ',
          route: '/glossary/faq',
          contentId: 'glossary-faq',
        ),
      ],
    ),
    NavGroup(
      id: 'project',
      title: '프로젝트 정보',
      iconName: 'info',
      items: [
        NavItem(id: 'search', title: '검색', route: '/search', contentId: null),
        NavItem(
          id: 'report',
          title: '개발·배포 기록',
          route: '/project/report',
          contentId: null,
        ),
      ],
    ),
  ];

  static NavItem? findByRoute(String route) {
    for (final group in groups) {
      for (final item in group.items) {
        if (item.route == route) return item;
      }
    }
    return null;
  }

  static List<NavItem> get allItems =>
      groups.expand((g) => g.items).toList(growable: false);

  static (NavItem?, NavItem?) neighbors(String route) {
    final items = allItems.where((e) => e.contentId != null).toList();
    final index = items.indexWhere((e) => e.route == route);
    if (index < 0) return (null, null);
    return (
      index > 0 ? items[index - 1] : null,
      index < items.length - 1 ? items[index + 1] : null,
    );
  }
}
