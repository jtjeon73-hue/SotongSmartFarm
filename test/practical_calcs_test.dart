import 'package:flutter_test/flutter_test.dart';
import 'package:sotong_smart_farm/core/calc/practical_calcs.dart';

void main() {
  group('ScalingCalc', () {
    test('4-20mA midpoint', () {
      final v = ScalingCalc.milliampToEngineering(
        milliamp: 12,
        engMin: 0,
        engMax: 100,
      );
      expect(v, closeTo(50, 1e-9));
    });

    test('live-zero classification', () {
      expect(ScalingCalc.classifyMilliamp(2.0), 'underRangeOrBreak');
      expect(ScalingCalc.classifyMilliamp(12), 'inRange');
      expect(ScalingCalc.classifyMilliamp(21), 'overRange');
    });

    test('generic raw scaling', () {
      final v = ScalingCalc.rawToEngineering(
        raw: 16383.5,
        rawMin: 0,
        rawMax: 32767,
        engMin: -50,
        engMax: 150,
      );
      expect(v, closeTo(50, 0.01));
    });
  });

  group('ModbusCrc', () {
    test('known request CRC', () {
      // 01 03 00 00 00 0A -> CRC 0xCDC5 (low byte first C5 CD)
      final body = [0x01, 0x03, 0x00, 0x00, 0x00, 0x0A];
      final crc = ModbusCrc.crcBytes(body);
      expect(crc, [0xC5, 0xCD]);
      expect(ModbusCrc.verify([...body, ...crc]), isTrue);
      expect(ModbusCrc.verify([...body, 0x00, 0x00]), isFalse);
    });
  });

  group('FlowTimeCalc', () {
    test('volume', () {
      expect(FlowTimeCalc.volumeLiters(flowLitersPerMin: 20, minutes: 15), 300);
    });
  });

  group('DataQualityJudge', () {
    test('spike wins over good', () {
      final q = DataQualityJudge.judge(
        value: 50,
        minPhysical: 0,
        maxPhysical: 100,
        previous: 10,
        maxDelta: 5,
        isStale: false,
        commError: false,
        flatlineSuspected: false,
        manual: false,
        estimated: false,
        calibrationDue: false,
      );
      expect(q, DataQuality.spike);
    });
  });

  group('AlarmLogic', () {
    test('delay required before raise', () {
      expect(
        AlarmLogic.shouldRaise(
          value: 31,
          threshold: 30,
          deadband: 1,
          currentlyActive: false,
          timeAbove: const Duration(seconds: 5),
          delay: const Duration(seconds: 10),
          highAlarm: true,
        ),
        isFalse,
      );
      expect(
        AlarmLogic.shouldRaise(
          value: 31,
          threshold: 30,
          deadband: 1,
          currentlyActive: false,
          timeAbove: const Duration(seconds: 10),
          delay: const Duration(seconds: 10),
          highAlarm: true,
        ),
        isTrue,
      );
    });
  });

  group('HysteresisControl', () {
    test('cooling band', () {
      expect(
        HysteresisControl.coolingOn(
          process: 28,
          setpoint: 26,
          hysteresis: 1,
          currentlyOn: false,
        ),
        isTrue,
      );
      expect(
        HysteresisControl.coolingOn(
          process: 25.5,
          setpoint: 26,
          hysteresis: 1,
          currentlyOn: true,
        ),
        isTrue,
      );
      expect(
        HysteresisControl.coolingOn(
          process: 24.9,
          setpoint: 26,
          hysteresis: 1,
          currentlyOn: true,
        ),
        isFalse,
      );
    });
  });

  group('PollingLoad', () {
    test('requests per second', () {
      final rps = PollingLoad.requestsPerSecond(
        nodeCount: 8,
        registersPerNode: 20,
        pollIntervalSeconds: 1,
        maxRegistersPerRequest: 10,
      );
      expect(rps, 16);
    });
  });
}
