/// Practical checklists (display-only; not persisted).
class PracticalChecklist {
  const PracticalChecklist({
    required this.id,
    required this.title,
    required this.category,
    required this.items,
  });

  final String id;
  final String title;
  final String category;
  final List<ChecklistItem> items;
}

class ChecklistItem {
  const ChecklistItem({
    required this.what,
    required this.how,
    required this.role,
    required this.evidence,
    required this.doneCriteria,
    required this.riskIfSkipped,
  });

  final String what;
  final String how;
  final String role;
  final String evidence;
  final String doneCriteria;
  final String riskIfSkipped;

  String toCopyBlock() =>
      '- [ ] $what\n  방법: $how\n  담당: $role\n  증거: $evidence\n  완료기준: $doneCriteria\n  미완료위험: $riskIfSkipped';
}

const List<PracticalChecklist> practicalChecklists = [
  PracticalChecklist(
    id: 'chk-site',
    title: '현장조사',
    category: '구축',
    items: [
      ChecklistItem(
        what: '전원·접지·분전반 위치 확인',
        how: '사진·단선도·차단기 용량 기록',
        role: '전기기술자',
        evidence: '사진/용량표',
        doneCriteria: '용량·접지 경로 문서화',
        riskIfSkipped: '과부하·감전·오결선',
      ),
      ChecklistItem(
        what: '통신 경로·차폐·접지 계획',
        how: '케이블 루트·스타배선 여부 점검',
        role: '제어·통신',
        evidence: '배선도',
        doneCriteria: '데이지체인·종단 계획 확정',
        riskIfSkipped: '간헐 통신장애',
      ),
    ],
  ),
  PracticalChecklist(
    id: 'chk-sensor',
    title: '센서 선정·설치',
    category: '센서',
    items: [
      ChecklistItem(
        what: '측정목적·출력방식·환경등급 확인',
        how: '데이터시트 항목 체크',
        role: '계측/구축',
        evidence: '데이터시트 체크표',
        doneCriteria: '출력·전원·정확도 항목 확인',
        riskIfSkipped: '호환 불가·오차',
      ),
      ChecklistItem(
        what: '대표성 있는 설치 위치',
        how: '직사광·결로·급기 바람 회피',
        role: '현장운영',
        evidence: '설치좌표/사진',
        doneCriteria: '교차측정 가능',
        riskIfSkipped: '잘못된 제어 판단',
      ),
    ],
  ),
  PracticalChecklist(
    id: 'chk-plc',
    title: 'PLC I/O·인터록',
    category: '제어',
    items: [
      ChecklistItem(
        what: 'I/O 목록과 현장 태그 일치',
        how: 'DI/DO/AI/AO 표 대조',
        role: 'PLC',
        evidence: 'I/O 리스트',
        doneCriteria: '전 점 매핑 완료',
        riskIfSkipped: '오동작',
      ),
      ChecklistItem(
        what: '비상정지·수동우선 인터록',
        how: '강제 시험·회로 검토',
        role: '안전/전기',
        evidence: '시험기록',
        doneCriteria: '원격으로 E-stop 우회 불가',
        riskIfSkipped: '인명·설비 사고',
      ),
    ],
  ),
  PracticalChecklist(
    id: 'chk-comm',
    title: '통신·네트워크',
    category: '통신',
    items: [
      ChecklistItem(
        what: 'A/B 극성·종단·Slave ID',
        how: '멀티미터·스코프·스캐너',
        role: '통신',
        evidence: '통신로그',
        doneCriteria: '전 노드 응답',
        riskIfSkipped: 'CRC/timeout',
      ),
      ChecklistItem(
        what: '인터넷 단절 시 로컬 필수제어',
        how: 'WAN 차단 시험',
        role: '시스템',
        evidence: '시험보고',
        doneCriteria: '환기/급수 로컬 유지',
        riskIfSkipped: '정전급 운영중단',
      ),
    ],
  ),
  PracticalChecklist(
    id: 'chk-data',
    title: '데이터·알람',
    category: '소프트웨어',
    items: [
      ChecklistItem(
        what: 'quality 상태와 원본값 보존',
        how: '이상주입 테스트',
        role: 'SW',
        evidence: '로그샘플',
        doneCriteria: '원본/품질/보정 구분',
        riskIfSkipped: '분석 왜곡',
      ),
      ChecklistItem(
        what: '알람 지연·데드밴드·확인 절차',
        how: '시나리오 시험',
        role: '운영',
        evidence: '알람이력',
        doneCriteria: '채attering 억제',
        riskIfSkipped: '알람 피로',
      ),
    ],
  ),
  PracticalChecklist(
    id: 'chk-commission',
    title: '시운전·교육·유지관리',
    category: '운영',
    items: [
      ChecklistItem(
        what: '수동/자동/비상 전환 훈련',
        how: '운영자 시나리오 실습',
        role: '운영자/구축',
        evidence: '교육기록',
        doneCriteria: '독립 운전 가능',
        riskIfSkipped: '장애 대응 지연',
      ),
      ChecklistItem(
        what: '정기 교정·필터·접점 점검 주기',
        how: '유지관리표 작성',
        role: '유지보수',
        evidence: '점검표',
        doneCriteria: '주기·담당 명시',
        riskIfSkipped: '드리프트·고장',
      ),
    ],
  ),
];
