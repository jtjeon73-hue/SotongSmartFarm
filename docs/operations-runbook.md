# 장애대응 운영 런북 (교육용)

## 형식

모든 교육용 런북은 **12단계**를 따릅니다 (`lib/data/runbook_data.dart`).

| # | 단계 | 목적 |
|---|------|------|
| 1 | 증상 | 관측 가능한 현상 |
| 2 | 영향 | 제어·작물·안전 범위 |
| 3 | 안전조치 | **진단 전** 사람·동물·설비 보호 |
| 4 | 즉시확인 | 전원·네트워크·프로세스 |
| 5 | 로그·증거보존 | RCA·분쟁 대비 |
| 6 | 진단 | 분리·축소 (전원→망→수집→버스→노드) |
| 7 | 임시복구 | 수동·degraded 운전 |
| 8 | 정상복구 | 근본 수리·설정 반영 |
| 9 | 확인시험 | 샘플 태그·품질·시퀀스 |
| 10 | 보고 | 시각·영향·조치·잔여리스크 |
| 11 | 근본원인 | SPOF·변경·용량 |
| 12 | 재발방지 | 알람·예비·[변경관리](change-management-guide.md) |

## 교육용 시나리오 (앱 `/runbooks`)

- 전체·다수 센서 데이터 중단
- RS-485 CRC 오류 증가
- PLC 통신 단절
- 펌프·밸브·팬 이상
- 인터넷·클라우드 단절
- 정전·복전
- pH/EC 급변
- 축사 비상 환기
- 계정 침해 의심
- AI 경보 급증
- 배포 후 회귀

각 시나리오는 **훈련·워크숍**용입니다. 현장 연락처·SLA·장비 ID는 농장별로 채웁니다.

## 안전 우선

- 위험 루프: **수동 전환**, 원격 쓰기 잠금, 현장 순회
- E-stop·인터록은 소프트웨어 알람과 구분 ([제어 검증](control-validation-guide.md))
- 축사: 정전·통신 장애 시 **필수 환기** 로컬 유지

## 진단 순서 (공통)

```
전원 → 네트워크·스위치 → 게이트웨이·수집기
→ 버스·종단·접지 → 개별 노드·센서
```

[통신 트러블슈팅](communication-troubleshooting-guide.md) · [센서 가이드](sensor-integration-guide.md) 참조.

## 보고·감사

- 시작/종료 시각, 영향 구역, 변경 이력, 증거 링크
- [로그 필드](reference-architecture.md) (`expert-logging`) — correlationId로 사건 묶기
- [FMEA](fmea-guide.md) 잔여위험·개선조치 업데이트

## FAT/SAT·변경과 연계

- 확인시험(9단계)은 [FAT/SAT](fat-sat-guide.md) 체크리스트와 형식 통일
- 배포·설정 변경 후: [변경관리](change-management-guide.md) 재시험

## 관련

- 앱: `expert-runbooks`, `ops-incident`
- [참조 아키텍처](reference-architecture.md) · [산업 보안](industrial-security-guide.md)
- [3단계 완료 보고](phase3-completion-report.md)
