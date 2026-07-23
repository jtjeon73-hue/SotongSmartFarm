import 'package:flutter/material.dart';

import '../core/calc/practical_calcs.dart';
import '../core/theme/app_theme.dart';
import '../models/smart_farm_content.dart';
import '../widgets/content_widgets.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({super.key});

  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  final _ma = TextEditingController(text: '12');
  final _engMin = TextEditingController(text: '0');
  final _engMax = TextEditingController(text: '100');
  final _raw = TextEditingController(text: '16384');
  final _rawMin = TextEditingController(text: '0');
  final _rawMax = TextEditingController(text: '32767');
  final _flow = TextEditingController(text: '20');
  final _minutes = TextEditingController(text: '15');
  final _hex = TextEditingController(text: '01 03 00 00 00 0A');
  final _process = TextEditingController(text: '28');
  final _setpoint = TextEditingController(text: '26');
  final _hyst = TextEditingController(text: '1');
  final _nodes = TextEditingController(text: '8');
  final _regs = TextEditingController(text: '20');
  final _interval = TextEditingController(text: '1');
  final _maxRegs = TextEditingController(text: '10');

  bool _coolOn = false;
  String _result = '교육용 계산기입니다. 현장 적용 전 제조사·전기설계를 확인하세요.';

  double? _d(TextEditingController c) => double.tryParse(c.text.trim());
  int? _i(TextEditingController c) => int.tryParse(c.text.trim());

  @override
  void dispose() {
    for (final c in [
      _ma,
      _engMin,
      _engMax,
      _raw,
      _rawMin,
      _rawMax,
      _flow,
      _minutes,
      _hex,
      _process,
      _setpoint,
      _hyst,
      _nodes,
      _regs,
      _interval,
      _maxRegs,
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
                  '실무 계산·시뮬레이터',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 8),
                const CalloutBox(
                  title: '교육용 도구',
                  body:
                      '특정 PLC RAW 범위나 센서 스펙을 기본값으로 확정하지 않습니다. '
                      '입력 단위·공식·제한을 확인한 뒤 현장 적용 전 제조사 매뉴얼과 시험을 거치세요.',
                  kind: SectionKind.caution,
                ),
                _toolCard(
                  title: '1) 4–20mA 스케일링',
                  formula:
                      'Eng = EngMin + (mA - 4) × (EngMax - EngMin) / (20 - 4)',
                  children: [
                    _num('mA', _ma),
                    _num('EngMin', _engMin),
                    _num('EngMax', _engMax),
                    FilledButton(
                      onPressed: () {
                        try {
                          final mA = _d(_ma)!;
                          final emin = _d(_engMin)!;
                          final emax = _d(_engMax)!;
                          final eng = ScalingCalc.milliampToEngineering(
                            milliamp: mA,
                            engMin: emin,
                            engMax: emax,
                          );
                          final health = ScalingCalc.classifyMilliamp(mA);
                          setState(() {
                            _result =
                                '공학값=$eng / 신호상태=$health\n'
                                '4mA는 live zero(단선 감지용). RAW 범위는 모듈마다 다름.';
                          });
                        } catch (e) {
                          setState(() => _result = '입력 오류: $e');
                        }
                      },
                      child: const Text('계산'),
                    ),
                  ],
                ),
                _toolCard(
                  title: '2) RAW → 공학단위',
                  formula:
                      'Eng = EngMin + (Raw-RawMin)×(EngMax-EngMin)/(RawMax-RawMin)',
                  children: [
                    _num('Raw', _raw),
                    _num('RawMin', _rawMin),
                    _num('RawMax', _rawMax),
                    _num('EngMin', _engMin),
                    _num('EngMax', _engMax),
                    FilledButton(
                      onPressed: () {
                        try {
                          final eng = ScalingCalc.rawToEngineering(
                            raw: _d(_raw)!,
                            rawMin: _d(_rawMin)!,
                            rawMax: _d(_rawMax)!,
                            engMin: _d(_engMin)!,
                            engMax: _d(_engMax)!,
                          );
                          setState(() => _result = '공학값=$eng');
                        } catch (e) {
                          setState(() => _result = '입력 오류: $e');
                        }
                      },
                      child: const Text('변환'),
                    ),
                  ],
                ),
                _toolCard(
                  title: '3) Modbus RTU CRC',
                  formula: 'CRC-16 poly 0xA001, low byte first',
                  children: [
                    TextField(
                      controller: _hex,
                      decoration: const InputDecoration(
                        labelText: '프레임 바이트(HEX, CRC 제외 또는 포함)',
                      ),
                    ),
                    Wrap(
                      spacing: 8,
                      children: [
                        FilledButton(
                          onPressed: () {
                            try {
                              final bytes = ModbusCrc.parseHex(_hex.text);
                              final crc = ModbusCrc.crcBytes(bytes);
                              setState(() {
                                _result =
                                    'CRC=${crc.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')} '
                                    '/ 전체=${[...bytes, ...crc].map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}';
                              });
                            } catch (e) {
                              setState(() => _result = 'HEX 오류: $e');
                            }
                          },
                          child: const Text('CRC 생성'),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            try {
                              final bytes = ModbusCrc.parseHex(_hex.text);
                              final ok = ModbusCrc.verify(bytes);
                              setState(
                                () => _result = ok
                                    ? 'CRC 일치(검증 통과)'
                                    : 'CRC 불일치 또는 프레임 길이 부족',
                              );
                            } catch (e) {
                              setState(() => _result = 'HEX 오류: $e');
                            }
                          },
                          child: const Text('CRC 검사'),
                        ),
                      ],
                    ),
                  ],
                ),
                _toolCard(
                  title: '4) 유량·시간 → 관수량',
                  formula: 'Volume(L) = Flow(L/min) × Minutes',
                  children: [
                    _num('유량 L/min', _flow),
                    _num('시간 min', _minutes),
                    FilledButton(
                      onPressed: () {
                        try {
                          final v = FlowTimeCalc.volumeLiters(
                            flowLitersPerMin: _d(_flow)!,
                            minutes: _d(_minutes)!,
                          );
                          setState(() => _result = '관수량 ≈ $v L (교육용)');
                        } catch (e) {
                          setState(() => _result = '입력 오류: $e');
                        }
                      },
                      child: const Text('계산'),
                    ),
                  ],
                ),
                _toolCard(
                  title: '5) 데이터 품질 판정 실습',
                  formula:
                      '우선순위: comm > missing > manual > stale > range > spike > flatline',
                  children: [
                    FilledButton(
                      onPressed: () {
                        final q = DataQualityJudge.judge(
                          value: 55,
                          minPhysical: 0,
                          maxPhysical: 100,
                          previous: 20,
                          maxDelta: 10,
                          isStale: false,
                          commError: false,
                          flatlineSuspected: false,
                          manual: false,
                          estimated: false,
                          calibrationDue: false,
                        );
                        setState(
                          () => _result =
                              '예제 value=55 previous=20 maxDelta=10 → $q (원본은 삭제하지 말고 quality 부여)',
                        );
                      },
                      child: const Text('스파이크 예제 실행'),
                    ),
                  ],
                ),
                _toolCard(
                  title: '6) 알람 데드밴드·지연',
                  formula: '활성 중에는 deadband로 해제, 비활성은 delay 후 발생',
                  children: [
                    FilledButton(
                      onPressed: () {
                        final raise = AlarmLogic.shouldRaise(
                          value: 31,
                          threshold: 30,
                          deadband: 1,
                          currentlyActive: false,
                          timeAbove: const Duration(seconds: 20),
                          delay: const Duration(seconds: 10),
                          highAlarm: true,
                        );
                        setState(
                          () => _result =
                              '고온알람 예제 value=31 threshold=30 delay=10s → raise=$raise',
                        );
                      },
                      child: const Text('시뮬레이트'),
                    ),
                  ],
                ),
                _toolCard(
                  title: '7) 폴링 부하',
                  formula: 'req/s ≈ nodes × ceil(regs/maxPerReq) / interval',
                  children: [
                    _num('노드 수', _nodes),
                    _num('노드당 레지스터', _regs),
                    _num('폴링 주기(s)', _interval),
                    _num('요청당 최대 레지스터', _maxRegs),
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
                _toolCard(
                  title: '8) ON/OFF 히스테리시스(냉각)',
                  formula: 'ON: process≥SP+Hyst / OFF: process≤SP-Hyst',
                  children: [
                    _num('현재값', _process),
                    _num('설정값', _setpoint),
                    _num('히스테리시스', _hyst),
                    Text('현재 출력: ${_coolOn ? 'ON' : 'OFF'}'),
                    FilledButton(
                      onPressed: () {
                        final next = HysteresisControl.coolingOn(
                          process: _d(_process)!,
                          setpoint: _d(_setpoint)!,
                          hysteresis: _d(_hyst)!,
                          currentlyOn: _coolOn,
                        );
                        setState(() {
                          _coolOn = next;
                          _result = '냉각 출력 → ${_coolOn ? 'ON' : 'OFF'}';
                        });
                      },
                      child: const Text('한 스텝 진행'),
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

  Widget _toolCard({
    required String title,
    required String formula,
    required List<Widget> children,
  }) {
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
