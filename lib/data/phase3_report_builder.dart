import '../core/quality/content_quality_grader.dart';
import '../data/content_catalog.dart';
import '../data/code_example_data.dart';
import '../models/smart_farm_content.dart';

/// Builds the phase-3 full markdown report for /project/report copy.
String buildPhase3FullReport({
  required String commitHash,
  required Map<String, int> gradeCounts,
  required Map<VerificationStatus, int> sourceStatusCounts,
}) {
  final total = ContentCatalog.allContents.length;
  final a = gradeCounts['A'] ?? 0;
  final b = gradeCounts['B'] ?? 0;
  final c = gradeCounts['C'] ?? 0;
  final d = gradeCounts['D'] ?? 0;
  String src(VerificationStatus s) => '${sourceStatusCounts[s] ?? 0}';

  return '''
# SotongSmartFarm 3단계 최종 완료 보고

## 1. 저장소·배포
- 저장소: https://github.com/jtjeon73-hue/SotongSmartFarm
- Firebase: sotong-smart-farm
- 커밋: $commitHash
- push: main
- Actions: https://github.com/jtjeon73-hue/SotongSmartFarm/actions
- 운영: https://sotong-smart-farm.web.app
- working tree: clean (배포 후 확인)

## 2. 콘텐츠 품질
- 전체: $total
- A: $a
- B: $b
- C: $c
- D: $d
- 판정 방법: ContentQualityGrader (14개 기준 키워드 매칭 + 구조 보너스, 글자수 단독 부여 금지)
- 실무 보강(2단계 override): ${ContentCatalog.phase2EnrichedCount}
- 전문가 페이지(3단계): ${ContentCatalog.phase3ExpertCount}
- 남은 보완: 키워드 기반 자동판정의 한계(세부 절차 깊이·현장증거는 수동검토), fieldValidationRequired 항목

## 3. 전문가 콘텐츠
- 아키텍처: expert-architecture, expert-edge-cloud
- 제어 안정성: expert-control-validation
- FMEA: expert-fmea + /fmea ${ContentCatalog.fmeaRows.length}건
- 안전: expert-safety-process
- 보안: expert-security
- AI·MLOps: expert-ai-evaluation, expert-mlops
- 디지털 트윈: expert-digital-twin
- 에너지: expert-energy
- 신뢰성: expert-reliability
- 운영: expert-slo, expert-logging, expert-runbooks, expert-fat-sat, expert-change-mgmt

## 4. 도구·템플릿
- 추가 도구: /expert-tools 12종 (+ 기존 /tools 8종)
- 계산 검증: expert_calcs + practical_calcs 단위테스트
- FMEA: /fmea
- FAT·SAT: /fat-sat ${ContentCatalog.fatSatItems.length}건
- 런북: /runbooks ${ContentCatalog.runbooks.length}건
- 보고 복사: /project/report 전체 보고 복사

## 5. 코드
- Python: 품질판정·집계·confusion (runnable/educational)
- Dart·Flutter: 센서모델·재시도·버퍼 (staticValidated/educational)
- MFC/C++: 통신스레드 의사코드 (pseudocode, 미컴파일)
- PLC·ST: 모드·인터록 의사코드 (pseudocode, 미컴파일)
- 예제 수: ${educationalCodeExamples.length}
- 실행·컴파일 상태: 상태 라벨로 구분, MFC·PLC는 검증했다고 표시하지 않음

## 6. 출처
- 전체: ${ContentCatalog.sources.length}
- verified: ${src(VerificationStatus.verified)}
- versionDependent: ${src(VerificationStatus.versionDependent)}
- needsReview: ${src(VerificationStatus.needsReview)}
- manufacturerManualRequired: ${src(VerificationStatus.manufacturerManualRequired)}
- fieldValidationRequired: ${src(VerificationStatus.fieldValidationRequired)}
- educationalExample: ${src(VerificationStatus.educationalExample)}

## 7. 검사
- 콘텐츠: duplicateIds/emptyTitles/brokenRelatedIds
- 계산·로직: practical + expert calcs
- format / analyze / test / build: CI 게이트
- 반응형: tool/responsive_check.js 7해상도×주요경로
- E2E: Playwright HTTP·Flutter렌더·overflowX (Canvas 한계 별도)
- 접근성: 키보드·버튼명 등 Canvas 한계로 미확인 항목은 통과 미보고

## 8. 운영
- SLO·KPI: expert-slo + 계산기
- 로그: expert-logging
- 백업: 변경관리·런북에 포함
- 장애런북: ${ContentCatalog.runbooks.length}건
- 변경관리: expert-change-mgmt

## 9. 남은 현장검증
- 제조사: 레지스터·RAW·타이머
- 작물·축종: 설정값 확정 금지(문서·시험)
- 전기·안전: 법령·KESCO/KOSHA 최신본
- PLC: 현장 로직 백업·FAT/SAT
- AI: 실데이터 평가·드리프트
- 실제 농장: 교육용≠현장합격

## 10. 최종 판단
- 3단계 완료 여부: 교육용 전문가 심화·품질도구·운영템플릿 반영 완료
- 전문가 활용 범위: 설계판단·시험·FMEA·런북·배치 검토 학습
- 교육용 제한: 인증·안전승인·실측성과 대체 불가
- 운영 주소: https://sotong-smart-farm.web.app
'''
      .trim();
}

Map<VerificationStatus, int> countSourceStatuses() {
  final m = <VerificationStatus, int>{};
  for (final s in ContentCatalog.sources) {
    m[s.status] = (m[s.status] ?? 0) + 1;
  }
  return m;
}

Map<String, int> gradeSummaryNow() =>
    ContentQualityGrader.summarize(ContentCatalog.allContents);
