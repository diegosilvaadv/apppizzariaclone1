// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SaboresRefStruct extends BaseStruct {
  SaboresRefStruct({
    String? nomeSabor1,
    String? nomeSabor2,
    String? nomeSabor3,
    String? nomeSabor4,
    double? precoSabor1,
    double? precoSabor2,
    double? precoSabor3,
    double? precoSabor4,
  })  : _nomeSabor1 = nomeSabor1,
        _nomeSabor2 = nomeSabor2,
        _nomeSabor3 = nomeSabor3,
        _nomeSabor4 = nomeSabor4,
        _precoSabor1 = precoSabor1,
        _precoSabor2 = precoSabor2,
        _precoSabor3 = precoSabor3,
        _precoSabor4 = precoSabor4;

  // "NomeSabor1" field.
  String? _nomeSabor1;
  String get nomeSabor1 => _nomeSabor1 ?? '';
  set nomeSabor1(String? val) => _nomeSabor1 = val;
  bool hasNomeSabor1() => _nomeSabor1 != null;

  // "NomeSabor2" field.
  String? _nomeSabor2;
  String get nomeSabor2 => _nomeSabor2 ?? '';
  set nomeSabor2(String? val) => _nomeSabor2 = val;
  bool hasNomeSabor2() => _nomeSabor2 != null;

  // "NomeSabor3" field.
  String? _nomeSabor3;
  String get nomeSabor3 => _nomeSabor3 ?? '';
  set nomeSabor3(String? val) => _nomeSabor3 = val;
  bool hasNomeSabor3() => _nomeSabor3 != null;

  // "NomeSabor4" field.
  String? _nomeSabor4;
  String get nomeSabor4 => _nomeSabor4 ?? '';
  set nomeSabor4(String? val) => _nomeSabor4 = val;
  bool hasNomeSabor4() => _nomeSabor4 != null;

  // "PrecoSabor1" field.
  double? _precoSabor1;
  double get precoSabor1 => _precoSabor1 ?? 0.0;
  set precoSabor1(double? val) => _precoSabor1 = val;
  void incrementPrecoSabor1(double amount) =>
      _precoSabor1 = precoSabor1 + amount;
  bool hasPrecoSabor1() => _precoSabor1 != null;

  // "PrecoSabor2" field.
  double? _precoSabor2;
  double get precoSabor2 => _precoSabor2 ?? 0.0;
  set precoSabor2(double? val) => _precoSabor2 = val;
  void incrementPrecoSabor2(double amount) =>
      _precoSabor2 = precoSabor2 + amount;
  bool hasPrecoSabor2() => _precoSabor2 != null;

  // "PrecoSabor3" field.
  double? _precoSabor3;
  double get precoSabor3 => _precoSabor3 ?? 0.0;
  set precoSabor3(double? val) => _precoSabor3 = val;
  void incrementPrecoSabor3(double amount) =>
      _precoSabor3 = precoSabor3 + amount;
  bool hasPrecoSabor3() => _precoSabor3 != null;

  // "PrecoSabor4" field.
  double? _precoSabor4;
  double get precoSabor4 => _precoSabor4 ?? 0.0;
  set precoSabor4(double? val) => _precoSabor4 = val;
  void incrementPrecoSabor4(double amount) =>
      _precoSabor4 = precoSabor4 + amount;
  bool hasPrecoSabor4() => _precoSabor4 != null;

  static SaboresRefStruct fromMap(Map<String, dynamic> data) =>
      SaboresRefStruct(
        nomeSabor1: data['NomeSabor1'] as String?,
        nomeSabor2: data['NomeSabor2'] as String?,
        nomeSabor3: data['NomeSabor3'] as String?,
        nomeSabor4: data['NomeSabor4'] as String?,
        precoSabor1: castToType<double>(data['PrecoSabor1']),
        precoSabor2: castToType<double>(data['PrecoSabor2']),
        precoSabor3: castToType<double>(data['PrecoSabor3']),
        precoSabor4: castToType<double>(data['PrecoSabor4']),
      );

  static SaboresRefStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SaboresRefStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'NomeSabor1': _nomeSabor1,
        'NomeSabor2': _nomeSabor2,
        'NomeSabor3': _nomeSabor3,
        'NomeSabor4': _nomeSabor4,
        'PrecoSabor1': _precoSabor1,
        'PrecoSabor2': _precoSabor2,
        'PrecoSabor3': _precoSabor3,
        'PrecoSabor4': _precoSabor4,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'NomeSabor1': serializeParam(
          _nomeSabor1,
          ParamType.String,
        ),
        'NomeSabor2': serializeParam(
          _nomeSabor2,
          ParamType.String,
        ),
        'NomeSabor3': serializeParam(
          _nomeSabor3,
          ParamType.String,
        ),
        'NomeSabor4': serializeParam(
          _nomeSabor4,
          ParamType.String,
        ),
        'PrecoSabor1': serializeParam(
          _precoSabor1,
          ParamType.double,
        ),
        'PrecoSabor2': serializeParam(
          _precoSabor2,
          ParamType.double,
        ),
        'PrecoSabor3': serializeParam(
          _precoSabor3,
          ParamType.double,
        ),
        'PrecoSabor4': serializeParam(
          _precoSabor4,
          ParamType.double,
        ),
      }.withoutNulls;

  static SaboresRefStruct fromSerializableMap(Map<String, dynamic> data) =>
      SaboresRefStruct(
        nomeSabor1: deserializeParam(
          data['NomeSabor1'],
          ParamType.String,
          false,
        ),
        nomeSabor2: deserializeParam(
          data['NomeSabor2'],
          ParamType.String,
          false,
        ),
        nomeSabor3: deserializeParam(
          data['NomeSabor3'],
          ParamType.String,
          false,
        ),
        nomeSabor4: deserializeParam(
          data['NomeSabor4'],
          ParamType.String,
          false,
        ),
        precoSabor1: deserializeParam(
          data['PrecoSabor1'],
          ParamType.double,
          false,
        ),
        precoSabor2: deserializeParam(
          data['PrecoSabor2'],
          ParamType.double,
          false,
        ),
        precoSabor3: deserializeParam(
          data['PrecoSabor3'],
          ParamType.double,
          false,
        ),
        precoSabor4: deserializeParam(
          data['PrecoSabor4'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SaboresRefStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SaboresRefStruct &&
        nomeSabor1 == other.nomeSabor1 &&
        nomeSabor2 == other.nomeSabor2 &&
        nomeSabor3 == other.nomeSabor3 &&
        nomeSabor4 == other.nomeSabor4 &&
        precoSabor1 == other.precoSabor1 &&
        precoSabor2 == other.precoSabor2 &&
        precoSabor3 == other.precoSabor3 &&
        precoSabor4 == other.precoSabor4;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nomeSabor1,
        nomeSabor2,
        nomeSabor3,
        nomeSabor4,
        precoSabor1,
        precoSabor2,
        precoSabor3,
        precoSabor4
      ]);
}

SaboresRefStruct createSaboresRefStruct({
  String? nomeSabor1,
  String? nomeSabor2,
  String? nomeSabor3,
  String? nomeSabor4,
  double? precoSabor1,
  double? precoSabor2,
  double? precoSabor3,
  double? precoSabor4,
}) =>
    SaboresRefStruct(
      nomeSabor1: nomeSabor1,
      nomeSabor2: nomeSabor2,
      nomeSabor3: nomeSabor3,
      nomeSabor4: nomeSabor4,
      precoSabor1: precoSabor1,
      precoSabor2: precoSabor2,
      precoSabor3: precoSabor3,
      precoSabor4: precoSabor4,
    );
