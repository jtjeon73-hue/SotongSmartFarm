# SotongSmartFarm

스마트농업에 사용되는 AI·하드웨어·소프트웨어·PLC·센서·통신·데이터 분석·자동제어 기술을 체계적으로 설명하는 Flutter Web 기술정보 사이트입니다.

과장된 “AI가 알아서 농사” 표현을 쓰지 않으며, AI 결과와 제어 명령을 구분하고 수동운전·인터록·비상정지의 필요성을 함께 설명합니다.

## 주요 이용자

- 농민·귀농 준비자·스마트팜 운영자
- 농업계 학생
- 센서·전기·전자·PLC 기술자
- Flutter·웹·MFC·AI 개발자
- 농업기관·구축업체 관계자

## 기술 스택

- Flutter Web
- go_router
- 로컬 정적 콘텐츠 데이터
- Firebase Hosting
- GitHub Actions

## 메뉴 구조

1. 스마트팜 이해
2. 재배·축산 환경
3. 센서와 계측
4. 제어와 PLC
5. 하드웨어
6. 통신과 네트워크
7. 소프트웨어
8. AI와 데이터 분석
9. 구축과 운영
10. 안전과 보안
11. 사례와 프로젝트 / 프롬프트 라이브러리
12. 용어·자료
13. 검색 / 개발·배포 기록

## 로컬 실행

```bash
flutter pub get
flutter run -d chrome
```

## 검사

```bash
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
```

## Release 빌드

```bash
flutter build web --release
```

## Firebase 배포

- Project ID: `sotong-smart-farm`
- Hosting public: `build/web`
- SPA rewrite: `**` → `/index.html`

```powershell
.\tool\deploy_web.ps1
```

또는

```bash
flutter build web --release
firebase deploy --only hosting --project sotong-smart-farm
```

## 자동배포

- Workflow: `.github/workflows/firebase-hosting.yml`
- `main` push: 검사 + release 빌드 + Hosting 배포
- PR: 검사 + 빌드만 (운영 배포 없음)
- Secret: `FIREBASE_SERVICE_ACCOUNT_SOTONG_SMART_FARM`

## 1단계 구현 범위

- 전체 메뉴·라우트
- 입문·기초 중심 학습 콘텐츠
- 검색·필터·연관 콘텐츠·이전/다음
- 교육용 사례 10개
- 프롬프트 라이브러리 15개 이상
- 개발·배포 기록 복사
- Firebase Hosting + GitHub Actions 기반

## 2단계 계획

- 실무 심화: 제어 시퀀스 예제, 통신 진단 절차, 데이터 품질 실무 체크
- 현장 검증 상태 보강, 제조사 매뉴얼 링크 정리

## 3단계 계획

- 전문가 심화: 분석 예제, 모델 평가 절차, 운영 KPI 템플릿
- 공식 출처 verified 확대

## 운영 주소

- https://sotong-smart-farm.web.app
- https://sotong-smart-farm.firebaseapp.com

## 문서

- `docs/content-roadmap.md`
- `docs/smart-farm-content-standard.md`
- `docs/deployment-guide.md`
- `docs/source-verification-guide.md`
- `docs/phase1-completion-report.md`
