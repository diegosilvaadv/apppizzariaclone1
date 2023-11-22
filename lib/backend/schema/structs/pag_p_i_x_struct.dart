// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PagPIXStruct extends BaseStruct {
  PagPIXStruct({
    String? status,
    String? chavepix,
    int? idPedido,
  })  : _status = status,
        _chavepix = chavepix,
        _idPedido = idPedido;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "chavepix" field.
  String? _chavepix;
  String get chavepix => _chavepix ?? '';
  set chavepix(String? val) => _chavepix = val;
  bool hasChavepix() => _chavepix != null;

  // "id_pedido" field.
  int? _idPedido;
  int get idPedido => _idPedido ?? 0;
  set idPedido(int? val) => _idPedido = val;
  void incrementIdPedido(int amount) => _idPedido = idPedido + amount;
  bool hasIdPedido() => _idPedido != null;

  static PagPIXStruct fromMap(Map<String, dynamic> data) => PagPIXStruct(
        status: data['status'] as String?,
        chavepix: data['chavepix'] as String?,
        idPedido: castToType<int>(data['id_pedido']),
      );

  static PagPIXStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PagPIXStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'chavepix': _chavepix,
        'id_pedido': _idPedido,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'chavepix': serializeParam(
          _chavepix,
          ParamType.String,
        ),
        'id_pedido': serializeParam(
          _idPedido,
          ParamType.int,
        ),
      }.withoutNulls;

  static PagPIXStruct fromSerializableMap(Map<String, dynamic> data) =>
      PagPIXStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        chavepix: deserializeParam(
          data['chavepix'],
          ParamType.String,
          false,
        ),
        idPedido: deserializeParam(
          data['id_pedido'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PagPIXStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PagPIXStruct &&
        status == other.status &&
        chavepix == other.chavepix &&
        idPedido == other.idPedido;
  }

  @override
  int get hashCode => const ListEquality().hash([status, chavepix, idPedido]);
}

PagPIXStruct createPagPIXStruct({
  String? status,
  String? chavepix,
  int? idPedido,
}) =>
    PagPIXStruct(
      status: status,
      chavepix: chavepix,
      idPedido: idPedido,
    );
