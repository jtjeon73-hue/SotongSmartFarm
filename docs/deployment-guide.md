# 배포 가이드

## 사전 조건

- Flutter stable
- Firebase CLI 로그인
- Project ID: `sotong-smart-farm`

## 수동 배포

```powershell
.\tool\deploy_web.ps1
```

## GitHub Actions

1. Firebase 서비스 계정 JSON을 준비한다.
2. GitHub Secret `FIREBASE_SERVICE_ACCOUNT_SOTONG_SMART_FARM`에 등록한다.
3. `main`에 push하면 검사·빌드 후 Hosting live 배포가 실행된다.
4. PR에서는 배포하지 않는다.

## SPA 확인

- `/overview/what-is-smart-farm` 직접 접속
- `/search`, `/cases`, `/prompts`, `/project/report` 직접 접속
- 새로고침 시 404/흰 화면이 없어야 한다.
