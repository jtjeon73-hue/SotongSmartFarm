# C/D 콘텐츠 정밀 분석 (마감 보정 후)

기준: ContentQualityGrader (유형별 필수 항목)  
실행: `dart run tool/print_quality.dart`, `dart run tool/analyze_cd.dart`  
상세 JSON: [cd-content-analysis.json](./cd-content-analysis.json)

## 보강 전후 등급

| | 보강 전(3단계 종료) | 마감 보정 후 |
|--|--|--|
| 전체 | 131 | 131 |
| A | 29 | 34 |
| B | 42 | 48 |
| C | 21 | 32 |
| D | 39 | 17 |

C가 늘어난 이유: 유형별 필수 기준으로 재계산되며, 예전 키워드 breadth A/B 일부가 C로 재배치됨. D는 39→17로 감소.

## 수동 보강 20건 (모두 B 이상)

expert-logging, sw-remote, sw-auth, sw-mobile, sw-mfc, sw-cloud, ops-site-survey, ops-equipment, ops-incident, ops-maintenance, ops-software-design, ops-training, safety-remote, safety-emergency, safety-mechanical, safety-fire, safety-backup, safety-pump-motor, env-orchard, ai-timeseries

## 잔여 D 17건 (대표 이유)

용어·체크리스트·일부 AI·운영 KPI 등 — 짧은 안내/용어 페이지이거나 필수 항목(출처·관련·절차) 미충족. 억지 장문 확장 대신 유형 기준 유지.

## 출처 vs 적용 검증

- sourceVerificationStatus: verified 9, versionDependent 8, needsReview 9, manufacturerManualRequired 1, educationalExample 11 (합 38)
- applicationValidationStatus: deskReviewed 102, fieldValidationRequired 29
- 출처 fieldValidationRequired 0 (혼동 해소)

## 자동 판정 한계

키워드·섹션 kind 기반. 정확성·현장증거는 미측정. 수동 표본과 불일치 가능.
