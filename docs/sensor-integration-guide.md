# 센서 통합 가이드 (2단계)

## 핵심

- 정확도 ≠ 분해능
- 설치 위치·오염·결로·노이즈가 값의 대표성을 좌우
- 4–20mA는 live zero(4mA)로 단선 감지 가능
- RAW→공학단위 변환식은 공용이지만 RAW 범위는 모듈·제조사별 확인

## 이상 진단 흐름

값 이상 → quality → 전원 → 배선 → 통신 → 기준기 비교 → 환경 → 교정 → 교체 → 재검증

센서 이상을 곧바로 “농장환경 변화”로 단정하지 말 것.

## 관련 콘텐츠 ID

sensor-temp-humidity, sensor-soil-moisture, sensor-ph-ec, sensor-level-flow, sensor-co2, sensor-calibration, sensor-selection, control-analog-scaling
