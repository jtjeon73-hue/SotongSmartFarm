# 제어 안정성·검증 가이드 (교육용)

## 목적

상태머신·모드·인터록·fail-safe·타임아웃·피드백을 **시험 가능한 형태**로 정의합니다.  
본 가이드는 시험 절차 교육용이며, 합격·인증을 대체하지 않습니다.

## 핵심 용어

| 용어 | 의미 |
|------|------|
| Permissive | 기동·개방 **허용** 조건 |
| Trip | 조건 위반 시 **차단** |
| Fail-safe | 장애 시 안전 쪽으로 수렴 |
| Watchdog | 통신·프로세스 생존 감시 |
| Debounce / Hysteresis | 채터·왕복 방지 |
| Minimum on/off | 설비 보호 최소 가동/정지 시간 |
| Bumpless transfer | 모드 전환 시 출력 급변 방지 |

[PLC 제어 가이드](plc-control-guide.md)의 모드·인터록 페이지와 함께 읽으세요.

## 모드 전환 표 (권장 필드)

모드 | 허용명령 | 금지명령 | 전환조건 | 복귀조건 | 기록

대표 모드: 정지 · 수동 · 자동 · 원격 · 점검 · 장애 · 비상  
원격·자동 충돌, 점검 중 원격 쓰기 등 **금지 조합**을 명시합니다.

## 시험 시나리오 (최소)

1. 정상 시작/정지 시퀀스
2. 센서 단선·고정값·범위 이탈
3. 통신 끊김·CRC 증가 ([통신 가이드](communication-troubleshooting-guide.md))
4. 피드백 불일치(명령 vs 상태)
5. 과부하·dry-run·타임아웃
6. 정전·복전 후 fail-safe
7. 원격·HMI·PLC 명령 충돌
8. E-stop·인터록 ([FMEA](fmea-guide.md)와 연계)

## 시험 기록 필드

시험ID, 사전조건, 입력, 예상전이, 예상출력, 알람, 안전상태, 통과기준, 증거, 결과, 복구

**실제 시험 없이 `pass`로 기록하지 마세요.**  
공장·현장 시험 템플릿은 [FAT/SAT 가이드](fat-sat-guide.md)를 참고합니다.

## 제조사·현장

- 타이머·주소·모듈 동작: `manufacturerManualRequired`
- 현장 배선·부하·안전회로: `fieldValidationRequired`
- [실무 콘텐츠 표준](practical-content-standard.md) 원칙 준수

## 도구·콘텐츠

- 앱: `expert-control-validation`, `control-interlock`, `control-manual-auto`
- FAT 템플릿: `lib/data/fatsat_data.dart` (시퀀스·인터록 항목)
- 변경 후 재시험: [변경관리](change-management-guide.md)

## 관련 문서

- [참조 아키텍처](reference-architecture.md) · [FMEA](fmea-guide.md)
- [3단계 완료 보고](phase3-completion-report.md) · [품질 분석](content-quality-report.md)
