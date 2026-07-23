# 변경관리 가이드 (교육용)

## 범위

다음 변경은 **요청·영향분석·백업·시험·승인·기록** 없이 현장에 적용하지 않습니다.

- PLC 프로그램·타이머·인터록
- 센서 교체·스케일·알람 임계값
- 통신 주소·버스·게이트웨이
- HMI·수집·DB·앱 배포
- AI 모델·임계값·규칙 엔진
- 계정·권한·방화벽·VPN
- 네트워크·Wi‑Fi·원격 접속

## 절차 (10단계)

```
요청 → 영향분석 → 위험검토 → 백업 → 시험 → 승인
→ 적용 → 확인 → 기록 → 롤백준비
```

| 단계 | 산출물 |
|------|--------|
| 영향분석 | 영향 구역·루프·다운타임 |
| 위험검토 | [FMEA](fmea-guide.md)·안전·[보안](industrial-security-guide.md) |
| 백업 | PLC·설정·DB·모델 버전 스냅샷 |
| 시험 | FAT/SAT 또는 [제어 검증](control-validation-guide.md) 부분 시험 |
| 확인 | 태그·시퀀스·알람·로그 |
| 기록 | 전/후 값, 사유, 승인자, 증거 |
| 롤백준비 | 복원 절차·담당·시한 |

## 위험 (반드시 교육)

- **PLC 백업 없이 현장 직접 수정** — 복구 불능·인터록 손상
- 야간·수확기 **무승인 원격 쓰기**
- AI 모델 **자동 배포 + 자동 제어** 동시 활성화

## 변경 유형별 추가

### PLC·제어

- 시뮬·FAT 후 현장 적용
- [FAT/SAT](fat-sat-guide.md) 재시험 범위 명시

### AI·MLOps

- modelVer·rollbackVer ([MLOps](mlops-drift-guide.md))
- shadow → 제한 운영 → 승격 단계

### 보안

- 계정·방화벽 — 유지보수 창·비상 연락
- [런북](operations-runbook.md) 배포 후 회귀

## 감사 로그

`expert-logging` 필드: timestamp, actor, eventType, prev, new, reason, result, correlationId

변경 티켓 ID를 correlationId로 묶어 [장애 RCA](operations-runbook.md)와 연결.

## 교육 vs GxP

본 가이드는 **농장·SI 실무 교육**용입니다.  
제약·식품 GxP 등 규제 산업은 별도 절차·서명 체계가 필요합니다.

## 관련

- 앱: `expert-change-mgmt`
- [실무 표준](practical-content-standard.md) · [전문가 표준](expert-content-standard.md)
- [3단계 완료 보고](phase3-completion-report.md)
