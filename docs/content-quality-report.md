# 콘텐츠 품질 분석 보고

기준일: 2026-07-23  
분석 대상: `ContentCatalog.allContents` **131**건  
판정 구현: `lib/core/quality/content_quality_grader.dart`  
실행: `dart run tool/print_quality.dart`

## 실제 등급 집계

| 등급 | 건수 |
|------|------|
| A | 29 |
| B | 42 |
| C | 21 |
| D | 39 |
| **합계** | **131** |

검증: 29+42+21+39 = 131.

### 2단계 실무 보강 32건

| 등급 | 건수 |
|------|------|
| A | 19 |
| B | 13 |
| C | 0 |
| D | 0 |

### 3단계 전문가 페이지 16건

| ID | 등급 | matched |
|----|------|---------|
| expert-architecture | B | 10 |
| expert-edge-cloud | A | 11 |
| expert-control-validation | A | 11 |
| expert-fmea | B | 9 |
| expert-safety-process | C | 7 |
| expert-security | B | 8 |
| expert-ai-evaluation | B | 9 |
| expert-mlops | C | 5 |
| expert-digital-twin | B | 8 |
| expert-energy | C | 7 |
| expert-reliability | C | 6 |
| expert-slo | B | 8 |
| expert-logging | D | 4 |
| expert-runbooks | B | 8 |
| expert-fat-sat | B | 8 |
| expert-change-mgmt | C | 6 |

메타 `qualityGrade` 필드는 참고용이며, **공식 집계는 grader 결과**만 사용한다.

## 등급 정의

- **A**: 기준을 폭넓게 충족 (설계·절차·안전·한계 등)
- **B**: 학습 + 일부 실무 적용
- **C**: 개념·부분 절차
- **D**: 기준 충족 폭이 좁음

**글자 수만으로 A를 부여하지 않는다.**

## 판정 방법

1. **14개 내용 기준** 키워드 매칭  
2. **섹션 kind·제목 증거** (safety/danger→safety, fieldValidation→diagnosis/limits, flow→dataFlow 등) — 길이 아님  
3. **구조 보너스** (sections≥8, copyText, sources, relatedIds, 특수 kind, practical/expert)  
4. 임계값: A matched≥11 & score≥14 / B matched≥8 & score≥10 / C matched≥5 / 그 외 D

## 대표 수동 검토

### A 샘플

- `overview-what`, `overview-data-to-control` — 개념+흐름  
- `sensor-temp-humidity`, `sensor-soil-moisture` — phase2 실무 보강  
- `expert-edge-cloud`, `expert-control-validation` — 배치·검증 절차

### D 샘플 (보완 우선)

- `env-orchard` — 환경 소개 위주  
- `sw-remote`, `sw-auth`, `sw-mobile`, `sw-mfc` — 소프트웨어 입문 위주  
- `expert-logging` — 필드 권장만 있어 폭이 좁음

수동 검토: A/B는 학습·절차 참고에 유용. D는 입문으로 유효하나 전문가 판단 근거로는 추가 보강 필요. **현장 합격·인증과 무관**.

## 관련 자산 실측

| 항목 | 개수 |
|------|------|
| 전체 콘텐츠 | 131 |
| 2단계 override | 32 |
| 3단계 전문가 페이지 | 16 |
| 프롬프트 | 56 |
| FMEA | 14 |
| 런북 | 20 |
| FAT/SAT | 23 |
| 사례 | 10 |
| 출처 | 38 |

### 출처 상태

| 상태 | 개수 |
|------|------|
| verified | 9 |
| versionDependent | 6 |
| needsReview | 11 |
| manufacturerManualRequired | 1 |
| fieldValidationRequired | 0 |
| educationalExample | 11 |
| **합계** | **38** |

## 자동 판정의 한계

1. 키워드·섹션 kind 기반이라 동의어·표만 있는 문서는 과소/과대 가능  
2. 내용의 **정확성·현장증거**는 측정하지 않음  
3. 중복 문장·템플릿 반복의 정밀 탐지는 제한적  
4. 전수 전문가 리뷰가 아님 (표본 수동 검토)  
5. A 등급 ≠ 현장 적용 승인

## 남은 보완

- D 페이지(특히 SW·환경·logging)에 진단·시험·한계 섹션 추가  
- 출처 fieldValidationRequired 연결  
- 제조사 매뉴얼·실설비 FAT/SAT

## 관련 문서

- [expert-content-standard.md](./expert-content-standard.md)
- [phase3-completion-report.md](./phase3-completion-report.md)
- [practical-content-standard.md](./practical-content-standard.md)
