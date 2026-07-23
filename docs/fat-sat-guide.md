# FAT·SAT 시험 가이드 (교육용)

## 정의

| 구분 | 장소 | 목적 |
|------|------|------|
| **FAT** (Factory Acceptance Test) | 공장·SI·시뮬 환경 | 논리·시퀀스·I/O 매핑·알람·인터록 |
| **SAT** (Site Acceptance Test) | 현장 | 실제 센서·구동·배선·안전·운영자 교육 |

본 템플릿(`lib/data/fatsat_data.dart`)은 **교육용**입니다.  
**실제 시험·증거 없이 합격 처리 금지** ([전문가 표준](expert-content-standard.md)).

## 시험 케이스 필드

testId, phase(FAT/SAT), requirement, preconditions, procedure, expected, actual, evidence, passFail, defect, action, retest, approver

- `passFail`: 미실시 항목은 **공란** 또는 `not_run`
- evidence: 체크시트, 화면 캡처, 로그 export, 버전 태그

## FAT 후보 (≥10 권장)

1. I/O 시뮬 — DI/DO/AI 논리명·주소 매핑
2. 펌프·밸브 시작/정지 **시퀀스·상태머신**
3. 알람 발생·확인·복귀·이력
4. **인터록** — 금지 조건에서 출력 차단
5. Modbus/RS-485 통신·타임아웃
6. HMI 화면·권한·감사
7. 데이터 저장·시각 동기
8. 정전·복전 fail-safe
9. 오류 주입 — 센서 고정값·통신 끊김
10. 원격 쓰기 잠금·모드 충돌

[제어 검증](control-validation-guide.md) 시험 목록과 1:1 매핑 권장.

## SAT 후보

- 실제 센서·구동기 응답·방향·피드백
- 안전 장치·E-stop·현장 인터록
- 통신 품질·지연·품질 플래그
- 수동/자동·원격 전환·운영자 교육
- 백업·복구·비상 운전 drill

현장 조건: [센서 통합](sensor-integration-guide.md), [PLC](plc-control-guide.md), [통신](communication-troubleshooting-guide.md).

## 결함·재시험

1. 결함 ID·심각도·담당·목표일
2. 수정 후 **동일 케이스** 재시험
3. 회귀 영향 구간 추가 시험 ([변경관리](change-management-guide.md))
4. 승인자 서명·버전 고정

## FMEA·런북 연계

- FAT/SAT 실패 패턴 → [FMEA](fmea-guide.md) 검출·대책 보강
- 현장 인수 후 장애 → [운영 런북](operations-runbook.md)

## 관련

- 앱: `expert-fat-sat`, `ops-commissioning`
- [2단계](phase2-completion-report.md) 실무 콘텐츠
- [3단계 완료 보고](phase3-completion-report.md) · [품질 분석](content-quality-report.md)
