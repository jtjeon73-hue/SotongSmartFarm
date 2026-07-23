# 전문가 콘텐츠 표준 (3단계)

## 목적

3단계 전문가 페이지는 아키텍처·검증·위험·운영·보안·AI 평가를 **교육용**으로 정리합니다.  
현장 인증·합격·법규 충족을 대신하지 않습니다.

## 2단계와의 관계

- [실무 콘텐츠 표준](practical-content-standard.md): 센서·PLC·통신·데이터·AI 기본 실무
- 본 표준: 시스템 전체 설계, 시험, 장애대응, 변경·MLOps로 확장
- 품질 판정: [콘텐츠 품질 분석](content-quality-report.md)의 `ContentQualityGrader` 기준

## 필수 원칙

1. **미시험 합격 금지** — FAT/SAT, 제어검증, 모델 성능을 실행 전에 통과로 표시하지 않음
2. **AI 직결 제어 금지** — AI→규칙→승인→인터록→PLC 계층 유지 ([AI 모델 평가](ai-model-evaluation-guide.md))
3. **수치·RPN·SLO** — 교육 예시일 뿐, 현장·조직별 재평가 필요
4. **법령·제조사** — 전기·안전 수치, 레지스터 주소는 공식자료·매뉴얼 확인 후 기입
5. **로컬 안전 우선** — 클라우드·원격 장애 시에도 필수 환기·인터록은 현장에서 동작 가능해야 함

## 권장 섹션 (전문가)

쉬운 설명 → 개념/계층 → 절차·흐름 → 실무 표·copyText → 주의/위험 → 제조사 확인 → 현장 검증 → 출처

Callout 종류는 [실무 콘텐츠 표준](practical-content-standard.md)과 동일.  
`SectionKind.safety`, `danger`, `fieldValidation`, `manufacturer`, `expertNote`를 적극 사용.

## 검증 상태

| 상태 | 용도 |
|------|------|
| `educationalExample` | FMEA, 보안, MLOps, 런북 템플릿 |
| `fieldValidationRequired` | 제어검증, FAT/SAT, 에너지 KPI |
| `needsReview` | 안전·법령 연계, 출처 재확인 필요 |
| `manufacturerManualRequired` | PLC 타이머·주소·모듈 동작 |

## difficulty · contentType

- `Difficulty.expert` — 아키텍처·검증·MLOps 등 (grader 보너스 +1)
- `ContentType.procedure` — 절차·런북·변경관리
- `ContentType.checklist` — FMEA·FAT/SAT 필드
- `ContentType.concept` — 계층·신뢰성 (원리 criterion 충족 권장)

## relatedIds · sourceIds

- `relatedIds` ≥ 2 — [품질 grader](content-quality-report.md) 구조 보너스
- `sourceIds` — KOSHA·제조사·교육 출처; 비어 있으면 bonus 미부여
- 상호 링크: expert-architecture ↔ control-validation ↔ fat-sat ↔ change-mgmt

## 금지 표현 (요약)

- “IEC 62443 준수 완료”, “FAT 합격”, “모델 정확도 98%” (근거 없을 때)
- AI가 “자동으로 밸브를 연다” (인터록·승인 계층 없이)
- 법정 전기검사·안전인증 대체 문구

## 관련 문서

- [참조 아키텍처](reference-architecture.md)
- [제어 검증](control-validation-guide.md) · [FMEA](fmea-guide.md) · [FAT/SAT](fat-sat-guide.md)
- [산업 보안](industrial-security-guide.md) · [운영 런북](operations-runbook.md)
- [변경관리](change-management-guide.md) · [3단계 완료 보고](phase3-completion-report.md)
- 선행: [2단계 완료 보고](phase2-completion-report.md)

## 앱 매핑

- 콘텐츠: `lib/data/phase3_expert_data.dart` (`expert-*` ID)
- 계산: `lib/core/calc/expert_calcs.dart` (가용성, 혼동행렬, RPN 등 교육용)
- 데이터: `fmea_data.dart`, `runbook_data.dart`, `fatsat_data.dart`
