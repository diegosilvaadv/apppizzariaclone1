// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PixPagStruct extends BaseStruct {
  PixPagStruct({
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

  static PixPagStruct fromMap(Map<String, dynamic> data) => PixPagStruct(
        status: data['status'] as String?,
        chavepix: data['chavepix'] as String?,
        idPedido: castToType<int>(data['id_pedido']),
      );

  static PixPagStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PixPagStruct.fromMap(data) : null;

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

  static PixPagStruct fromSerializableMap(Map<String, dynamic> data) =>
      PixPagStruct(
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
  String toString() => 'PixPagStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PixPagStruct &&
        status == other.status &&
        chavepix == other.chavepix &&
        idPedido == other.idPedido;
  }

  @override
  int get hashCode => const ListEquality().hash([status, chavepix, idPedido]);
}

PixPagStruct createPixPagStruct({
  String? status,
  String? chavepix,
  int? idPedido,
}) =>
    PixPagStruct(
      status: status,
      chavepix: chavepix,
      idPedido: idPedido,
    );
