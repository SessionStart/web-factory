import 'dart:convert';

import 'package:flutter/foundation.dart';

class MachineParams {
  MachineParams({
    @required this.machineTime,
    @required this.downtime,
    @required this.isRunning,
    @required this.temperature,
  });

  final int machineTime;
  final int downtime;
  final bool isRunning;
  final int temperature;

  MachineParams copyWith({
    int machineTime,
    int downtime,
    bool isRunning,
    int temperature,
  }) {
    return MachineParams(
      machineTime: machineTime ?? this.machineTime,
      downtime: downtime ?? this.downtime,
      isRunning: isRunning ?? this.isRunning,
      temperature: temperature ?? this.temperature,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'machineTime': machineTime,
      'downtime': downtime,
      'isRunning': isRunning,
      'temperature': temperature,
    };
  }

  factory MachineParams.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MachineParams(
      machineTime: map['machineTime'],
      downtime: map['downtime'],
      isRunning: map['isRunning'] == 1,
      temperature: map['temperature'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MachineParams.fromJson(String source) =>
      MachineParams.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MachineParams(machineTime: $machineTime, downtime: $downtime, isRunning: $isRunning, temperature: $temperature)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MachineParams &&
        o.machineTime == machineTime &&
        o.downtime == downtime &&
        o.isRunning == isRunning &&
        o.temperature == temperature;
  }

  @override
  int get hashCode {
    return machineTime.hashCode ^
        downtime.hashCode ^
        isRunning.hashCode ^
        temperature.hashCode;
  }
}
