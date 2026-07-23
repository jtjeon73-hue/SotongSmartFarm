/// Educational code examples with explicit validation status.
enum CodeExampleStatus {
  runnable,
  compileValidated,
  staticValidated,
  pseudocode,
  educationalExample,
  manufacturerReviewRequired,
  fieldValidationRequired,
}

class CodeExample {
  const CodeExample({
    required this.id,
    required this.language,
    required this.title,
    required this.status,
    required this.summary,
    required this.code,
    this.notes = const [],
  });

  final String id;
  final String language;
  final String title;
  final CodeExampleStatus status;
  final String summary;
  final String code;
  final List<String> notes;
}

const List<CodeExample> educationalCodeExamples = [
  CodeExample(
    id: 'py-dq',
    language: 'Python',
    title: '센서 데이터 품질 판정',
    status: CodeExampleStatus.runnable,
    summary: '범위·결측·stale 판정 교육용 함수',
    code: '''
from dataclasses import dataclass
from datetime import datetime, timedelta

@dataclass
class Sample:
    value: float | None
    ts: datetime
    lo: float
    hi: float

def quality(s: Sample, now: datetime, stale_after: timedelta) -> str:
    if s.value is None:
        return "missing"
    if not (s.lo <= s.value <= s.hi):
        return "out_of_range"
    if now - s.ts > stale_after:
        return "stale"
    return "ok"
''',
    notes: ['현장 임계값은 문서화 후 적용', '정확도 %를 가정하지 않음'],
  ),
  CodeExample(
    id: 'py-agg',
    language: 'Python',
    title: 'CSV 시계열 집계',
    status: CodeExampleStatus.educationalExample,
    summary: 'pandas 없이도 가능한 단순 평균 집계 개념',
    code: '''
# educational: group by hour key "YYYY-MM-DD HH"
from collections import defaultdict

def hourly_mean(rows):
    buckets = defaultdict(list)
    for ts, value in rows:
        buckets[ts[:13]].append(value)
    return {k: sum(v)/len(v) for k, v in buckets.items() if v}
''',
  ),
  CodeExample(
    id: 'py-cm',
    language: 'Python',
    title: 'confusion matrix 지표',
    status: CodeExampleStatus.runnable,
    summary: 'TP/FP/TN/FN → precision/recall/F1',
    code: '''
def prf(tp, fp, tn, fn):
    p = tp / (tp + fp) if (tp + fp) else 0.0
    r = tp / (tp + fn) if (tp + fn) else 0.0
    f1 = 2 * p * r / (p + r) if (p + r) else 0.0
    return p, r, f1
''',
    notes: ['실험 없는 정확도 주장 금지'],
  ),
  CodeExample(
    id: 'dart-sensor',
    language: 'Dart',
    title: '타입이 있는 센서 모델·품질상태',
    status: CodeExampleStatus.staticValidated,
    summary: 'Flutter/Dart 교육용 모델',
    code: '''
enum Quality { ok, missing, outOfRange, stale }

class SensorReading {
  const SensorReading({required this.value, required this.ts, required this.quality});
  final double? value;
  final DateTime ts;
  final Quality quality;
}
''',
  ),
  CodeExample(
    id: 'dart-retry',
    language: 'Dart',
    title: '재시도 정책·오프라인 버퍼 개념',
    status: CodeExampleStatus.educationalExample,
    summary: '지수 백오프와 로컬 큐 개념',
    code: '''
Duration backoff(int attempt) => Duration(milliseconds: 200 * (1 << attempt.clamp(0, 5)));

class OfflineBuffer {
  final List<Map<String, Object?>> _q = [];
  void enqueue(Map<String, Object?> e) => _q.add(e);
  List<Map<String, Object?>> drain([int n = 50]) {
    final out = _q.take(n).toList();
    _q.removeRange(0, out.length);
    return out;
  }
}
''',
  ),
  CodeExample(
    id: 'cpp-mfc-comm',
    language: 'C++/MFC',
    title: '통신 작업 스레드·타임아웃 개념',
    status: CodeExampleStatus.pseudocode,
    summary: 'MFC 컴파일 환경 없음 — 의사코드',
    code: '''
// educationalExample / pseudocode — not compileValidated
// Worker thread: request queue -> send -> wait(timeout) -> UI PostMessage
// On cancel: set stop flag, join thread, flush logs (no secrets)
''',
    notes: ['MFC 환경에서 컴파일 검증하지 않음'],
  ),
  CodeExample(
    id: 'st-mode',
    language: 'PLC ST',
    title: '모드·인터록·피드백 타임아웃',
    status: CodeExampleStatus.pseudocode,
    summary: '제조사 ST 방언 차이 — 의사코드',
    code: '''
(* educational / manufacturerReviewRequired *)
(* IF EStop OR NOT Permissive THEN Mode := Safe; OUT := FALSE; *)
(* ELSIF Mode = Auto AND FeedbackOK AND NOT FeedbackTimeout THEN ... *)
''',
    notes: ['제조사 매뉴얼·현장시험 필수', '컴파일 검증하지 않음'],
  ),
];
