import 'package:flutter_test/flutter_test.dart';
import 'package:sotong_smart_farm/core/calc/expert_calcs.dart';

void main() {
  test('availability', () {
    expect(
      AvailabilityCalc.availability(uptimeHours: 99, downtimeHours: 1),
      closeTo(0.99, 1e-9),
    );
  });

  test('data validity', () {
    expect(
      DataValidityCalc.validRatio(validSamples: 980, totalSamples: 1000),
      closeTo(0.98, 1e-9),
    );
  });

  test('alarm KPI', () {
    expect(AlarmKpiCalc.meanTimeToAcknowledgeMinutes(ackMinutes: [5, 15]), 10);
    expect(AlarmKpiCalc.meanTimeToRecoverMinutes(recoverMinutes: [10, 30]), 20);
  });

  test('confusion matrix', () {
    const m = ConfusionMatrixCalc(tp: 40, fp: 10, tn: 100, fn: 5);
    expect(m.precision, closeTo(0.8, 1e-9));
    expect(m.recall, closeTo(40 / 45, 1e-9));
    expect(m.f1, greaterThan(0));
  });

  test('energy KPI', () {
    expect(EnergyKpiCalc.energyPerYield(kWh: 100, yieldAmount: 50), 2);
    expect(EnergyKpiCalc.energyPerArea(kWh: 100, areaSquareMeters: 20), 5);
  });

  test('FMEA RPN educational', () {
    expect(FmeaPriority.rpn(severity: 7, occurrence: 5, detection: 4), 140);
    expect(
      () => FmeaPriority.rpn(severity: 0, occurrence: 5, detection: 4),
      throwsArgumentError,
    );
  });
}
