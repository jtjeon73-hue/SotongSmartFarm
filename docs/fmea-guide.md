# 교육용 FMEA 가이드

## FMEA란

**Failure Mode and Effects Analysis** — 설비·기능별로 고장 형태, 원인, 영향, 검출, 대책을 표로 정리하는 **위험 사고 도구**입니다.  
본 프로젝트의 FMEA는 **학습·워크숍용**이며, 공인 안전판정·인증이 아닙니다.

## 필수 필드

설비 | 고장형태 | 원인 | 영향 | 검출 | 현재대책 | S | O | D | RPN | 개선조치 | 담당 | 검증 | 잔여위험

- **S** (Severity): 영향 심각도 — 조직·현장 기준으로 재정의
- **O** (Occurrence): 발생 가능성
- **D** (Detection): 검출 난이도 — 점수가 높을수록 검출 어려움(교육용 정의)
- **RPN** = S × O × D — **우선순위 참고용**, 절대 안전 등급 아님

## 스마트팜 대표 대상

| 자산 | 고장형태 예 |
|------|-------------|
| 온도·수분·pH/EC 센서 | 드리프트, 단선, 고정값 |
| PLC·RS-485 | 통신 단절, CRC, 주소 충돌 |
| 펌프·밸브·팬·측창 | 피드백 불일치, stuck |
| 정전·인터넷 | 로컬 fallback 상실 |
| 원격제어 | 무단 명령, 세션 탈취 |
| AI 추천 | 오탐·미탐, 드리프트 |

앱 예시 데이터: `lib/data/fmea_data.dart` (`educationalFmeaRows`)

## 작성 절차 (교육)

1. 기능·경계 정의 ([참조 아키텍처](reference-architecture.md))
2. 고장형태·원인 브레인스톰
3. 현재 대책·검출 수단 **실제 구현 여부** 확인
4. S/O/D 팀 합의(현장 재평가)
5. 개선조치·담당·검증 방법·잔여위험 기록
6. [제어 검증](control-validation-guide.md)·[FAT/SAT](fat-sat-guide.md) 시험과 연결

## 한계 (반드시 명시)

- 점수는 **교육 예시** — 농장·설비·운영마다 다름
- 법규·KOSHA·전기안전 수치는 공식자료 확인 ([전문가 표준](expert-content-standard.md))
- 단일 센서 구간·잔여위험은 현장 재평가 필요

## 워크숍 활용 (교육)

1. 팀별 자산 1개 선택 → 빈 FMEA 행 작성
2. S/O/D는 **상대 비교**만 — 절대값 논쟁 지양
3. “현재대책”은 문서가 아니라 **현장 구현** 기준으로 검증
4. 상위 3개 RPN → [제어 검증](control-validation-guide.md) 또는 [FAT](fat-sat-guide.md) 시험 케이스로 변환
5. 잔여위험은 [변경관리](change-management-guide.md) 티켓으로 추적

## RPN 계산 (교육)

`lib/core/calc/expert_calcs.dart`의 `FmeaPriority.rpn`으로 S×O×D를 계산할 수 있습니다.  
결과를 “허용 가능”으로 단정하지 마세요.

## 연계

- 장애 발생 시: [운영 런북](operations-runbook.md)
- 변경·개선 후: [변경관리](change-management-guide.md)
- 앱: `expert-fmea` · [품질 분석](content-quality-report.md)
