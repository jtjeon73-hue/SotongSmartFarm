/// Pure calculation helpers for educational farm tools.
/// All formulas are unit-documented; PLC RAW ranges are caller-provided.
class ScalingCalc {
  /// Generic RAW → engineering unit conversion.
  static double rawToEngineering({
    required double raw,
    required double rawMin,
    required double rawMax,
    required double engMin,
    required double engMax,
  }) {
    if (rawMax == rawMin) {
      throw ArgumentError('rawMax must differ from rawMin');
    }
    return engMin + (raw - rawMin) * (engMax - engMin) / (rawMax - rawMin);
  }

  /// 4–20 mA loop to engineering value (live zero at 4 mA).
  static double milliampToEngineering({
    required double milliamp,
    required double engMin,
    required double engMax,
  }) {
    return rawToEngineering(
      raw: milliamp,
      rawMin: 4,
      rawMax: 20,
      engMin: engMin,
      engMax: engMax,
    );
  }

  /// Classify 4–20 mA signal health (education heuristic).
  static String classifyMilliamp(double milliamp) {
    if (milliamp < 3.6) return 'underRangeOrBreak';
    if (milliamp < 4.0) return 'nearLiveZero';
    if (milliamp <= 20.0) return 'inRange';
    if (milliamp <= 20.5) return 'nearOverRange';
    return 'overRange';
  }
}

class FlowTimeCalc {
  /// Volume (L) from flow (L/min) and minutes.
  static double volumeLiters({
    required double flowLitersPerMin,
    required double minutes,
  }) {
    if (flowLitersPerMin < 0 || minutes < 0) {
      throw ArgumentError('flow and minutes must be >= 0');
    }
    return flowLitersPerMin * minutes;
  }

  /// Minutes needed for target volume.
  static double minutesForVolume({
    required double volumeLiters,
    required double flowLitersPerMin,
  }) {
    if (flowLitersPerMin <= 0) {
      throw ArgumentError('flowLitersPerMin must be > 0');
    }
    if (volumeLiters < 0) {
      throw ArgumentError('volumeLiters must be >= 0');
    }
    return volumeLiters / flowLitersPerMin;
  }
}

class ModbusCrc {
  /// Modbus RTU CRC-16 (poly 0xA001), returns low-byte-first CRC bytes.
  static List<int> crcBytes(List<int> data) {
    var crc = 0xFFFF;
    for (final b in data) {
      crc ^= (b & 0xFF);
      for (var i = 0; i < 8; i++) {
        if ((crc & 0x0001) != 0) {
          crc = (crc >> 1) ^ 0xA001;
        } else {
          crc >>= 1;
        }
      }
    }
    return [crc & 0xFF, (crc >> 8) & 0xFF];
  }

  static bool verify(List<int> frameWithCrc) {
    if (frameWithCrc.length < 3) return false;
    final body = frameWithCrc.sublist(0, frameWithCrc.length - 2);
    final expected = crcBytes(body);
    return expected[0] == frameWithCrc[frameWithCrc.length - 2] &&
        expected[1] == frameWithCrc[frameWithCrc.length - 1];
  }

  /// Parse hex string like "01 03 00 00 00 0A" into bytes.
  static List<int> parseHex(String hex) {
    final cleaned = hex
        .replaceAll(',', ' ')
        .replaceAll('0x', ' ')
        .replaceAll('0X', ' ');
    final parts = cleaned
        .split(RegExp(r'[^0-9A-Fa-f]+'))
        .where((p) => p.isNotEmpty)
        .toList();
    return parts.map((p) {
      if (p.length > 2) {
        throw FormatException('hex byte too long: $p');
      }
      return int.parse(p, radix: 16);
    }).toList();
  }
}

enum DataQuality {
  good,
  stale,
  missing,
  outOfRange,
  spike,
  flatline,
  communicationError,
  calibrationRequired,
  manualValue,
  estimated,
}

class DataQualityJudge {
  static DataQuality judge({
    required double? value,
    required double minPhysical,
    required double maxPhysical,
    required double? previous,
    required double maxDelta,
    required bool isStale,
    required bool commError,
    required bool flatlineSuspected,
    required bool manual,
    required bool estimated,
    required bool calibrationDue,
  }) {
    if (commError) return DataQuality.communicationError;
    if (value == null) return DataQuality.missing;
    if (manual) return DataQuality.manualValue;
    if (estimated) return DataQuality.estimated;
    if (calibrationDue) return DataQuality.calibrationRequired;
    if (isStale) return DataQuality.stale;
    if (value < minPhysical || value > maxPhysical) {
      return DataQuality.outOfRange;
    }
    if (previous != null && (value - previous).abs() > maxDelta) {
      return DataQuality.spike;
    }
    if (flatlineSuspected) return DataQuality.flatline;
    return DataQuality.good;
  }
}

class AlarmLogic {
  /// Returns true when alarm should be active after delay/deadband.
  static bool shouldRaise({
    required double value,
    required double threshold,
    required double deadband,
    required bool currentlyActive,
    required Duration timeAbove,
    required Duration delay,
    required bool highAlarm,
  }) {
    final trip = highAlarm ? value >= threshold : value <= threshold;
    final clear = highAlarm
        ? value <= threshold - deadband
        : value >= threshold + deadband;

    if (currentlyActive) {
      return !clear;
    }
    return trip && timeAbove >= delay;
  }
}

class HysteresisControl {
  /// Simple ON/OFF with hysteresis for cooling (ON when high).
  static bool coolingOn({
    required double process,
    required double setpoint,
    required double hysteresis,
    required bool currentlyOn,
  }) {
    if (currentlyOn) {
      return process > setpoint - hysteresis;
    }
    return process >= setpoint + hysteresis;
  }
}

class PollingLoad {
  /// Rough poll load: requests per second across nodes.
  static double requestsPerSecond({
    required int nodeCount,
    required int registersPerNode,
    required double pollIntervalSeconds,
    required int maxRegistersPerRequest,
  }) {
    if (pollIntervalSeconds <= 0 || maxRegistersPerRequest <= 0) {
      throw ArgumentError('interval and maxRegistersPerRequest must be > 0');
    }
    final requestsPerNode = (registersPerNode / maxRegistersPerRequest)
        .ceil()
        .clamp(1, 1000000);
    return nodeCount * requestsPerNode / pollIntervalSeconds;
  }
}
