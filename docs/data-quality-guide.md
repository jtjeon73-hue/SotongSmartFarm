# 데이터 품질 가이드 (2단계)

## quality 상태 예

good, stale, missing, outOfRange, spike, flatline, communicationError, calibrationRequired, manualValue, estimated

## 원칙

이상값을 무조건 삭제하지 않는다. 원본값·quality·보정값·보정이유를 구분한다.

## 알람 상태

발생 → 확인 → 조치 중 → 복구 → 종료 (+ 지연·데드밴드·반복억제)

## 관련 ID

ai-data-quality, sw-collection, sw-storage, sw-monitoring, sw-alarm
