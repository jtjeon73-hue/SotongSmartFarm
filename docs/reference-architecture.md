# 스마트팜 참조 아키텍처 (교육용)

## 한 줄 요약

스마트팜은 센서·구동·안전·PLC·통신·화면·분석·운영이 **계층**으로 연결된 시스템입니다.  
안전·필수 제어는 상위(클라우드) 장애와 **분리**해야 합니다.

## 13계층 개요

| # | 계층 | 역할 | 장애 시 |
|---|------|------|---------|
| 1 | 물리환경 | 온실·축사·배관 | 현장 조건 |
| 2 | 센서 | 측정 | 해당 루프 degraded |
| 3 | 구동기 | 밸브·팬·펌프 | 설비 정지 |
| 4 | 안전회로 | E-stop·인터록 | **즉시 차단** |
| 5 | PLC | 시퀀스·로직 | 구역 제어 상실 |
| 6 | 원격 I/O | 필드 확장 | 버스 의존 구간 |
| 7 | 게이트웨이 | 프로토콜·집계 | 수집·원격 중단 |
| 8 | 현장 저장 | 버퍼·이력 | 감사 공백 |
| 9 | HMI/MFC | 현장 조작 | 로컬 운전 가능 여부 중요 |
| 10 | 웹·모바일 | 원격 UI | 모니터링만 |
| 11 | 분석·AI | 예측·이상 | **제어 명령 아님** |
| 12 | 클라우드 | 중앙·다농장 | 현장 로컬 유지 |
| 13 | 감사·백업 | 로그·복구 | 규정·RCA |

각 계층마다 **입력·출력·장애영향·독립운전 가능 여부**를 문서화하세요.

## 배치 패턴

### 소형 단일 하우스

- PLC + 로컬 HMI 중심, 인터넷 의존 최소화
- 운영인력 1~2인, 확장성 제한

### 중형 다동

- 구역·게이트웨이 분리로 **장애 범위 국소화**
- [통신 트러블슈팅](communication-troubleshooting-guide.md)·[농장망](communication-troubleshooting-guide.md) 설계 병행

### 다농장 플랫폼

- 중앙 모니터링·데이터 활용 유리
- [산업 보안](industrial-security-guide.md)·권한·[변경관리](change-management-guide.md) 필수
- **현장 로컬 제어 포기 금지**

## 설계 판단 체크

비교 항목: 초기비용 | 운영복잡도 | 인터넷의존 | 확장성 | 장애범위 | 유지관리 | 데이터활용 | 보안 | 인력

비용만으로 클라우드 일체형을 고르지 말고, [신뢰성](reference-architecture.md)(`expert-reliability`)·SLO·복구시간을 함께 봅니다.

## Edge vs Cloud

- Edge: 지연·오프라인·안전 루프에 유리
- Cloud: 다농장·장기 분석·MLOps ([MLOps·드리프트](mlops-drift-guide.md))
- AI 추천은 Edge 또는 Cloud에서 **권고만** — 실행은 PLC·인터록 ([AI 평가](ai-model-evaluation-guide.md))

## 현장 검증

아키텍처 다이어그램은 **전원·통신·안전회로 실측** 후 확정합니다.  
교육용 다이어그램은 `educationalExample`로 표시 ([전문가 표준](expert-content-standard.md)).

## 관련

- 앱: `expert-architecture`, `expert-edge-cloud`, `expert-reliability`
- [2단계](phase2-completion-report.md) 센서·PLC·통신 가이드
- [제어 검증](control-validation-guide.md) · [운영 런북](operations-runbook.md)
