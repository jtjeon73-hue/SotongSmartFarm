/// Phase-3 expert calculation helpers (educational; not certification).
class AvailabilityCalc {
  /// Availability = uptime / (uptime + downtime)
  static double availability({
    required double uptimeHours,
    required double downtimeHours,
  }) {
    final total = uptimeHours + downtimeHours;
    if (total <= 0) throw ArgumentError('total time must be > 0');
    if (uptimeHours < 0 || downtimeHours < 0) {
      throw ArgumentError('hours must be >= 0');
    }
    return uptimeHours / total;
  }

  static double downtimeHoursFromAvailability({
    required double periodHours,
    required double availability,
  }) {
    if (periodHours <= 0) throw ArgumentError('periodHours must be > 0');
    if (availability < 0 || availability > 1) {
      throw ArgumentError('availability must be 0..1');
    }
    return periodHours * (1 - availability);
  }
}

class DataValidityCalc {
  /// validRatio = validSamples / totalSamples
  static double validRatio({
    required int validSamples,
    required int totalSamples,
  }) {
    if (totalSamples <= 0) throw ArgumentError('totalSamples must be > 0');
    if (validSamples < 0 || validSamples > totalSamples) {
      throw ArgumentError('validSamples out of range');
    }
    return validSamples / totalSamples;
  }
}

class AlarmKpiCalc {
  static double meanTimeToAcknowledgeMinutes({
    required List<double> ackMinutes,
  }) {
    if (ackMinutes.isEmpty) throw ArgumentError('empty');
    return ackMinutes.reduce((a, b) => a + b) / ackMinutes.length;
  }

  static double meanTimeToRecoverMinutes({
    required List<double> recoverMinutes,
  }) {
    if (recoverMinutes.isEmpty) throw ArgumentError('empty');
    return recoverMinutes.reduce((a, b) => a + b) / recoverMinutes.length;
  }
}

class ConfusionMatrixCalc {
  const ConfusionMatrixCalc({
    required this.tp,
    required this.fp,
    required this.tn,
    required this.fn,
  });

  final int tp;
  final int fp;
  final int tn;
  final int fn;

  double get precision {
    final d = tp + fp;
    if (d == 0) return 0;
    return tp / d;
  }

  double get recall {
    final d = tp + fn;
    if (d == 0) return 0;
    return tp / d;
  }

  double get f1 {
    final p = precision;
    final r = recall;
    if (p + r == 0) return 0;
    return 2 * p * r / (p + r);
  }
}

class EnergyKpiCalc {
  /// kWh per unit production (educational).
  static double energyPerYield({
    required double kWh,
    required double yieldAmount,
  }) {
    if (yieldAmount <= 0) throw ArgumentError('yieldAmount must be > 0');
    if (kWh < 0) throw ArgumentError('kWh must be >= 0');
    return kWh / yieldAmount;
  }

  static double energyPerArea({
    required double kWh,
    required double areaSquareMeters,
  }) {
    if (areaSquareMeters <= 0) {
      throw ArgumentError('areaSquareMeters must be > 0');
    }
    if (kWh < 0) throw ArgumentError('kWh must be >= 0');
    return kWh / areaSquareMeters;
  }
}

class FmeaPriority {
  /// Educational RPN = severity * occurrence * detection (1..10 each).
  static int rpn({
    required int severity,
    required int occurrence,
    required int detection,
  }) {
    void check(int v, String name) {
      if (v < 1 || v > 10) {
        throw ArgumentError('$name must be 1..10');
      }
    }

    check(severity, 'severity');
    check(occurrence, 'occurrence');
    check(detection, 'detection');
    return severity * occurrence * detection;
  }
}
