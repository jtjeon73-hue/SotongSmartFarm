import 'package:flutter/material.dart';

import '../core/calc/expert_calcs.dart';
import '../core/calc/practical_calcs.dart';
import '../core/theme/app_theme.dart';
import '../core/utils/clipboard_utils.dart';
import '../models/smart_farm_content.dart';
import '../widgets/content_widgets.dart';

/// Phase-3 expert calculators / template generators (educational).
class ExpertToolsPage extends StatefulWidget {
  const ExpertToolsPage({super.key});

  @override
  State<ExpertToolsPage> createState() => _ExpertToolsPageState();
}

class _ExpertToolsPageState extends State<ExpertToolsPage> {
  final _up = TextEditingController(text: '8700');
  final _down = TextEditingController(text: '12');
  final _valid = TextEditingController(text: '980');
  final _total = TextEditingController(text: '1000');
  final _ack = TextEditingController(text: '5,8,12');
  final _rec = TextEditingController(text: '20,30,45');
  final _tp = TextEditingController(text: '40');
  final _fp = TextEditingController(text: '10');
  final _tn = TextEditingController(text: '100');
  final _fn = TextEditingController(text: '5');
  final _kwh = TextEditingController(text: '1200');
  final _yield = TextEditingController(text: '800');
  final _area = TextEditingController(text: '1000');
  final _sev = TextEditingController(text: '7');
  final _occ = TextEditingController(text: '5');
  final _det = TextEditingController(text: '4');
  final _nodes = TextEditingController(text: '8');
  final _regs = TextEditingController(text: '20');
  final _interval = TextEditingController(text: '1');
  final _maxRegs = TextEditingController(text: '10');
  final _ioCount = TextEditingController(text: '16');
  final _incident = TextEditingController(text: '펌프 미기동');

  String _result = '교육용 전문가 도구입니다. 안전승인·설계인증을 대신하지 않습니다.';

  double? _d(TextEditingController c) => double.tryParse(c.text.trim());
  int? _i(TextEditingController c) => int.tryParse(c.text.trim());

  List<double> _list(TextEditingController c) => c.text
      .split(RegExp(r'[,;\s]+'))
      .where((e) => e.isNotEmpty)
      .map(double.parse)
      .toList();

  @override
  void dispose() {
    for (final c in [
      _up,
      _down,
      _valid,
      _total,
      _ack,
      _rec,
      _tp,
      _fp,
      _tn,
      _fn,
      _kwh,
      _yield,
      _area,
      _sev,
      _occ,
      _det,
      _nodes,
      _regs,
      _interval,
      _maxRegs,
      _ioCount,
      _incident,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '전문가 도구·템플릿',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 8),
                const CalloutBox(
                  title: '교육용 표시',
                  body:
                      '입력 단위·공식을 확인하고 초기화한 뒤 사용하세요. '
                      '결과는 현장 안전승인·설계인증을 대신하지 않습니다.',
                  kind: SectionKind.caution,
                ),
                _card('1) I/O 목록 작성기', '논리명, DI/DO/AI/AO, 주소(문서값), 스케일, 비고', [
                  _num('채널 수(예제 행)', _ioCount),
                  FilledButton(
                    onPressed: () {
                      final n = _i(_ioCount) ?? 0;
                      final buf = StringBuffer(
                        'tag,type,address,engMin,engMax,note\n',
                      );
                      for (var i = 1; i <= n; i++) {
                        buf.writeln('TAG_$i,DI,문서확인필요,,,,교육용');
                      }
                      final text = buf.toString();
                      setState(() => _result = text);
                      copyToClipboard(context, text, message: 'I/O 표 복사');
                    },
                    child: const Text('CSV 생성·복사'),
                  ),
                ]),
                _card('2) 모드·인터록 매트릭스', '모드 × 명령 허용/금지', [
                  FilledButton(
                    onPressed: () {
                      const text =
                          '모드,기동,정지,원격쓰기,점검강제\n정지,금지,허용,금지,조건부\n수동,허용,허용,금지,조건부\n자동,조건부,허용,조건부,금지\n비상,금지,허용,금지,금지\n';
                      setState(() => _result = text);
                      copyToClipboard(context, text, message: '매트릭스 복사');
                    },
                    child: const Text('템플릿 복사'),
                  ),
                ]),
                _card('3) 제어 시퀀스 시험표', '시험ID,사전조건,입력,예상전이,출력,알람,통과기준,증거', [
                  FilledButton(
                    onPressed: () {
                      const text =
                          'testId,precondition,input,expectedTransition,output,alarm,passCriteria,evidence,result\nSEQ-01,수동모드,시작명령,Idle→Run,펌프ON,없음,상태일치,로그,미실시\n';
                      setState(() => _result = text);
                      copyToClipboard(context, text, message: '시험표 복사');
                    },
                    child: const Text('템플릿 복사'),
                  ),
                ]),
                _card('4) FMEA RPN 계산', 'RPN = S × O × D (각 1..10, 교육용)', [
                  _num('Severity', _sev),
                  _num('Occurrence', _occ),
                  _num('Detection', _det),
                  FilledButton(
                    onPressed: () {
                      try {
                        final r = FmeaPriority.rpn(
                          severity: _i(_sev)!,
                          occurrence: _i(_occ)!,
                          detection: _i(_det)!,
                        );
                        setState(
                          () => _result =
                              'RPN(교육)=$r — 절대 안전판정이 아닙니다. 현장 재평가 필요.',
                        );
                      } catch (e) {
                        setState(() => _result = '입력 오류: $e');
                      }
                    },
                    child: const Text('계산'),
                  ),
                ]),
                _card(
                  '5) 통신 폴링·대역(확장)',
                  'req/s ≈ nodes × ceil(regs/max) / interval',
                  [
                    _num('노드', _nodes),
                    _num('레지스터/노드', _regs),
                    _num('주기(s)', _interval),
                    _num('요청당 최대', _maxRegs),
                    FilledButton(
                      onPressed: () {
                        try {
                          final rps = PollingLoad.requestsPerSecond(
                            nodeCount: _i(_nodes)!,
                            registersPerNode: _i(_regs)!,
                            pollIntervalSeconds: _d(_interval)!,
                            maxRegistersPerRequest: _i(_maxRegs)!,
                          );
                          setState(() => _result = '대략 $rps requests/s');
                        } catch (e) {
                          setState(() => _result = '입력 오류: $e');
                        }
                      },
                      child: const Text('계산'),
                    ),
                  ],
                ),
                _card('6) 데이터 유효률', 'validRatio = valid / total', [
                  _num('유효 샘플', _valid),
                  _num('전체 샘플', _total),
                  FilledButton(
                    onPressed: () {
                      try {
                        final r = DataValidityCalc.validRatio(
                          validSamples: _i(_valid)!,
                          totalSamples: _i(_total)!,
                        );
                        setState(
                          () =>
                              _result = '유효률=${(r * 100).toStringAsFixed(2)}%',
                        );
                      } catch (e) {
                        setState(() => _result = '입력 오류: $e');
                      }
                    },
                    child: const Text('계산'),
                  ),
                ]),
                _card('7) 가용성·중단시간', 'A = uptime / (uptime+downtime)', [
                  _num('가동(h)', _up),
                  _num('중단(h)', _down),
                  FilledButton(
                    onPressed: () {
                      try {
                        final a = AvailabilityCalc.availability(
                          uptimeHours: _d(_up)!,
                          downtimeHours: _d(_down)!,
                        );
                        setState(
                          () => _result =
                              '가용성=${(a * 100).toStringAsFixed(3)}% (목표 SLO는 농장별로 설정)',
                        );
                      } catch (e) {
                        setState(() => _result = '입력 오류: $e');
                      }
                    },
                    child: const Text('계산'),
                  ),
                ]),
                _card('8) 알람 KPI', 'MTTA / MTTR (분 목록 평균)', [
                  _num('인지시간 목록(분)', _ack),
                  _num('복구시간 목록(분)', _rec),
                  FilledButton(
                    onPressed: () {
                      try {
                        final mtta = AlarmKpiCalc.meanTimeToAcknowledgeMinutes(
                          ackMinutes: _list(_ack),
                        );
                        final mttr = AlarmKpiCalc.meanTimeToRecoverMinutes(
                          recoverMinutes: _list(_rec),
                        );
                        setState(
                          () => _result =
                              'MTTA=${mtta.toStringAsFixed(1)}분, MTTR=${mttr.toStringAsFixed(1)}분',
                        );
                      } catch (e) {
                        setState(() => _result = '입력 오류: $e');
                      }
                    },
                    child: const Text('계산'),
                  ),
                ]),
                _card('9) Confusion matrix', 'precision / recall / F1', [
                  _num('TP', _tp),
                  _num('FP', _fp),
                  _num('TN', _tn),
                  _num('FN', _fn),
                  FilledButton(
                    onPressed: () {
                      final m = ConfusionMatrixCalc(
                        tp: _i(_tp)!,
                        fp: _i(_fp)!,
                        tn: _i(_tn)!,
                        fn: _i(_fn)!,
                      );
                      setState(
                        () => _result =
                            'P=${m.precision.toStringAsFixed(3)}, R=${m.recall.toStringAsFixed(3)}, F1=${m.f1.toStringAsFixed(3)} (실험값 없이 현장 성능 주장 금지)',
                      );
                    },
                    child: const Text('계산'),
                  ),
                ]),
                _card('10) 에너지 KPI', 'kWh/생산량, kWh/㎡', [
                  _num('kWh', _kwh),
                  _num('생산량', _yield),
                  _num('면적(㎡)', _area),
                  FilledButton(
                    onPressed: () {
                      try {
                        final y = EnergyKpiCalc.energyPerYield(
                          kWh: _d(_kwh)!,
                          yieldAmount: _d(_yield)!,
                        );
                        final a = EnergyKpiCalc.energyPerArea(
                          kWh: _d(_kwh)!,
                          areaSquareMeters: _d(_area)!,
                        );
                        setState(
                          () => _result =
                              'kWh/생산=${y.toStringAsFixed(3)}, kWh/㎡=${a.toStringAsFixed(3)} (미측정 절감률 표시 금지)',
                        );
                      } catch (e) {
                        setState(() => _result = '입력 오류: $e');
                      }
                    },
                    child: const Text('계산'),
                  ),
                ]),
                _card('11) FAT·SAT 체크리스트 생성', '미실시 상태로 헤더 생성', [
                  FilledButton(
                    onPressed: () {
                      const text =
                          'testId,phase,requirement,preconditions,procedure,expected,evidence,passFail,defect,action,retest,approver\nFAT-01,FAT,시퀀스,시뮬준비,시작정지,상태일치,로그,미실시,,,,\nSAT-01,SAT,실구동기,현장안전,방향확인,방향일치,영상,미실시,,,,\n';
                      setState(() => _result = text);
                      copyToClipboard(context, text, message: '체크리스트 복사');
                    },
                    child: const Text('생성·복사'),
                  ),
                ]),
                _card('12) 장애보고 Markdown', '증상·영향·조치·근본원인 골격', [
                  TextField(
                    controller: _incident,
                    decoration: const InputDecoration(labelText: '사건 제목'),
                  ),
                  FilledButton(
                    onPressed: () {
                      final title = _incident.text.trim().isEmpty
                          ? '장애 사건'
                          : _incident.text.trim();
                      final text =
                          '''
# 장애보고: $title

## 1. 증상
## 2. 영향(구역·설비)
## 3. 안전조치
## 4. 타임라인
## 5. 증거(로그·사진, 비밀제외)
## 6. 임시복구
## 7. 정상복구
## 8. 확인시험
## 9. 근본원인
## 10. 재발방지·담당·기한
'''
                              .trim();
                      setState(() => _result = text);
                      copyToClipboard(context, text, message: '장애보고 복사');
                    },
                    child: const Text('생성·복사'),
                  ),
                ]),
                const SizedBox(height: 8),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () => setState(
                        () => _result = '교육용 전문가 도구입니다. 안전승인·설계인증을 대신하지 않습니다.',
                      ),
                      child: const Text('초기화'),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: () => copyToClipboard(
                        context,
                        _result,
                        message: '결과를 복사했습니다.',
                      ),
                      icon: const Icon(Icons.copy),
                      label: const Text('결과 복사'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TechCard(title: '결과', body: _result),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _num(String label, TextEditingController c) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: c,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  Widget _card(String title, String formula, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            SelectableText(formula),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }
}
