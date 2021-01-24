import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'machine_params.dart';

class Machine {
  final int id;
  final String photoUrl;
  final String type;
  final String serialNumber;
  final MachineParams params;
  final List<String> warnings;
  final bool isStopped;

  Machine({
    @required this.id,
    @required this.photoUrl,
    @required this.type,
    @required this.serialNumber,
    @required this.params,
    @required this.warnings,
    this.isStopped = false,
  });

  Machine copyWith({
    int id,
    String photoUrl,
    String type,
    String serialNumber,
    MachineParams params,
    List<String> warnings,
    bool isStopped,
  }) {
    return Machine(
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
      type: type ?? this.type,
      serialNumber: serialNumber ?? this.serialNumber,
      params: params ?? this.params,
      warnings: warnings ?? this.warnings,
      isStopped: isStopped ?? this.isStopped,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'photoUrl': photoUrl,
      'type': type,
      'serialNumber': serialNumber,
      'params': params?.toMap(),
      'warnings': warnings,
    };
  }

  factory Machine.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Machine(
      id: map['id'],
      photoUrl: map['photoUrl'],
      type: map['type'],
      serialNumber: map['serialNumber'],
      params: MachineParams.fromMap(map['params']),
      warnings: List<String>.from(map['warnings']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Machine.fromJson(String source) =>
      Machine.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Machine(id: $id, photoUrl: $photoUrl, type: $type, serialNumber: $serialNumber, params: $params, warnings: $warnings)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Machine &&
        o.id == id &&
        o.photoUrl == photoUrl &&
        o.type == type &&
        o.serialNumber == serialNumber &&
        o.params == params &&
        listEquals(o.warnings, warnings);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        photoUrl.hashCode ^
        type.hashCode ^
        serialNumber.hashCode ^
        params.hashCode ^
        warnings.hashCode;
  }
}
