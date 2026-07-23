# AI 모델 평가 가이드 (교육용)

## 원칙

- **실험 없는 정확도·F1·MAPE 수치를 만들지 않음**
- AI 출력 ≠ 제어 명령 ([실무 표준](practical-content-standard.md), [AI 현장 검증](ai-field-validation-guide.md))
- 현장 시범·롤백·감사 로그까지 포함한 **절차**가 목표

## 평가 단계

```
문제정의 → 기준모델 → 데이터·라벨 → 분할·누수방지
→ 학습 → 오프라인 평가 → 현장 시범 → 제한 운영
→ 모니터링 → 재학습 → 롤백
```

각 단계마다 **승인자·증거·한계**를 기록 ([변경관리](change-management-guide.md)).

## 과제별 지표

### 회귀·예측 (온도·수분·수확량 등)

- MAE, RMSE, MAPE — MAPE는 0 근처·계절별 왜곡 주의
- **기준모델** 대비 개선 여부(단순 평균·규칙·전일값)
- 구역·계절·작물별 오차 분해

### 분류·이상

- Precision, Recall, F1, Confusion matrix
- **오탐 vs 미탐 비용** — 농장마다 다름
- 임계값은 운영 정책과 연동

`lib/core/calc/expert_calcs.dart` — `ConfusionMatrixCalc`

### 영상·질병

- IoU·mAP 개념 — 클래스 불균형·조명·각도
- **사진 한 장으로 질병 확정 금지** — 현장 샘플·전문가 확인

## 안전 계층 (권장)

```
AI 결과 → 신뢰도/제한 → 규칙 검증 → 승인 → PLC 인터록 → 실행 → 피드백 → 감사
```

자동 제어 **승격**은 별도 위험검토·시험 ([제어 검증](control-validation-guide.md)).

## 데이터 품질

- 라벨 오류·센서 드리프트·결측 — [데이터 품질](data-quality-guide.md)
- Train/test **누수** — 시간·구역·설비 기준 분할
- 드리프트: [MLOps 가이드](mlops-drift-guide.md)

## 현장 시범 체크

- shadow mode(권고만) 기간
- 오탐·미탐 알람 부하
- 작물·동물·에너지 **부작용** 모니터링
- 롤백 모델·임계값 사전 준비

## 관련

- 앱: `expert-ai-evaluation`, `ai-limits`, `ai-anomaly`, `ai-vision`
- [FMEA](fmea-guide.md) — AI 추천 고장형태
- [3단계 완료 보고](phase3-completion-report.md) · [품질 분석](content-quality-report.md)
