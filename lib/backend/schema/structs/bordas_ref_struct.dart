// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BordasRefStruct extends BaseStruct {
  BordasRefStruct({
    String? nomeBorda,
    double? precoBorda,
  })  : _nomeBorda = nomeBorda,
        _precoBorda = precoBorda;

  // "nome_borda" field.
  String? _nomeBorda;
  String get nomeBorda => _nomeBorda ?? '';
  set nomeBorda(String? val) => _nomeBorda = val;
  bool hasNomeBorda() => _nomeBorda != null;

  // "preco_borda" field.
  double? _precoBorda;
  double get precoBorda => _precoBorda ?? 0.0;
  set precoBorda(double? val) => _precoBorda = val;
  void incrementPrecoBorda(double amount) => _precoBorda = precoBorda + amount;
  bool hasPrecoBorda() => _precoBorda != null;

  static BordasRefStruct fromMap(Map<String, dynamic> data) => BordasRefStruct(
        nomeBorda: data['nome_borda'] as String?,
        precoBorda: castToType<double>(data['preco_borda']),
      );

  static BordasRefStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? BordasRefStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'nome_borda': _nomeBorda,
        'preco_borda': _precoBorda,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome_borda': serializeParam(
          _nomeBorda,
          ParamType.String,
        ),
        'preco_borda': serializeParam(
          _precoBorda,
          ParamType.double,
        ),
      }.withoutNulls;

  static BordasRefStruct fromSerializableMap(Map<String, dynamic> data) =>
      BordasRefStruct(
        nomeBorda: deserializeParam(
          data['nome_borda'],
          ParamType.String,
          false,
        ),
        precoBorda: deserializeParam(
          data['preco_borda'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BordasRefStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BordasRefStruct &&
        nomeBorda == other.nomeBorda &&
        precoBorda == other.precoBorda;
  }

  @override
  int get hashCode => const ListEquality().hash([nomeBorda, precoBorda]);
}

BordasRefStruct createBordasRefStruct({
  String? nomeBorda,
  double? precoBorda,
}) =>
    BordasRefStruct(
      nomeBorda: nomeBorda,
      precoBorda: precoBorda,
    );
