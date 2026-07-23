# MLOps·드리프트 가이드 (교육용)

## 왜 필요한가

센서 교체·교정, 계절·작물 변경, 시설 개조, 운영 규칙 변경으로 **모델 입력·개념이 달라질** 수 있습니다.  
성능 저하를 조기에 감지하고 버전·승인·롤백을 남기는 것이 MLOps의 핵심입니다.

## 드리프트 유형

| 유형 | 예 | 징후 |
|------|-----|------|
| 입력 드리프트 | 센서 교체, 스케일 변경 | 특징 분포 변화 |
| 개념 드리프트 | 품종·관수 정책 변경 | 동일 입력·다른 결과 |
| 운영 드리프트 | 알람 임계값·스케줄 변경 | 오탐/미탐 급변 |
| 인프라 | 카메라·조명·게이트웨이 | 영상·지연 품질 저하 |

[AI 모델 평가](ai-model-evaluation-guide.md)의 오프라인 지표만으로는 부족 — **운영 KPI** 병행.

## 운영 기록 (권장 필드)

modelVer, dataVer, featureVer, trainRange, metrics, approver, deployedAt, threshold, rollbackVer

배포마다:

1. 오프라인 평가 스냅샷
2. shadow/제한 운영 기간
3. 승인자·변경 티켓 ([변경관리](change-management-guide.md))
4. 롤백 모델 ID·절차

## 재학습 트리거 (예)

- MAE/F1 등 **사전 정의 임계** 초과 (현장에서 목표 설정)
- 입력 분포 통계·PSI 등 (도구는 조직 선택)
- 설비·센서·라벨 정책 변경
- [FMEA](fmea-guide.md) 개선조치 반영

**자동 재학습 → 자동 제어 승격**은 별도 승인·시험.

## 모니터링

- 예측 vs 실측 잔차, 오탐/미탐율
- 알람 건수·운영자 override 빈도
- [SLO](reference-architecture.md) (`expert-slo`) — 데이터 유효률·지연
- [로그·감사](operations-runbook.md) — `expert-logging`

## 롤백

- 이전 modelVer 즉시 전환 경로
- PLC·규칙 엔진과 **동시 버전** 호환 확인
- 배포 후 장애: [런북](operations-runbook.md) `rb-deploy-regression`

## 교육 vs 운영

본 가이드와 `expert-mlops`는 **절차 교육**입니다.  
실제 MLOps 플랫폼·CI/CD·모델 레지스트리는 조직 인프라에 맞게 구축하세요.

## 관련

- 앱: `expert-mlops`, `ai-ops-monitoring`
- [산업 보안](industrial-security-guide.md) — 모델·데이터 접근
- [3단계 완료 보고](phase3-completion-report.md)
