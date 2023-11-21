// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosStruct extends BaseStruct {
  PedidosStruct({
    String? nomeProduto,
    String? img,
    int? quanty,
    double? precoTotal,
    double? precoBorda,
    String? nomeBorda,
    bool? massaGratis,
    double? subtotal,
  })  : _nomeProduto = nomeProduto,
        _img = img,
        _quanty = quanty,
        _precoTotal = precoTotal,
        _precoBorda = precoBorda,
        _nomeBorda = nomeBorda,
        _massaGratis = massaGratis,
        _subtotal = subtotal;

  // "nomeProduto" field.
  String? _nomeProduto;
  String get nomeProduto => _nomeProduto ?? '';
  set nomeProduto(String? val) => _nomeProduto = val;
  bool hasNomeProduto() => _nomeProduto != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;
  bool hasImg() => _img != null;

  // "quanty" field.
  int? _quanty;
  int get quanty => _quanty ?? 0;
  set quanty(int? val) => _quanty = val;
  void incrementQuanty(int amount) => _quanty = quanty + amount;
  bool hasQuanty() => _quanty != null;

  // "precoTotal" field.
  double? _precoTotal;
  double get precoTotal => _precoTotal ?? 0.0;
  set precoTotal(double? val) => _precoTotal = val;
  void incrementPrecoTotal(double amount) => _precoTotal = precoTotal + amount;
  bool hasPrecoTotal() => _precoTotal != null;

  // "precoBorda" field.
  double? _precoBorda;
  double get precoBorda => _precoBorda ?? 0.0;
  set precoBorda(double? val) => _precoBorda = val;
  void incrementPrecoBorda(double amount) => _precoBorda = precoBorda + amount;
  bool hasPrecoBorda() => _precoBorda != null;

  // "nomeBorda" field.
  String? _nomeBorda;
  String get nomeBorda => _nomeBorda ?? '';
  set nomeBorda(String? val) => _nomeBorda = val;
  bool hasNomeBorda() => _nomeBorda != null;

  // "massaGratis" field.
  bool? _massaGratis;
  bool get massaGratis => _massaGratis ?? false;
  set massaGratis(bool? val) => _massaGratis = val;
  bool hasMassaGratis() => _massaGratis != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  set subtotal(double? val) => _subtotal = val;
  void incrementSubtotal(double amount) => _subtotal = subtotal + amount;
  bool hasSubtotal() => _subtotal != null;

  static PedidosStruct fromMap(Map<String, dynamic> data) => PedidosStruct(
        nomeProduto: data['nomeProduto'] as String?,
        img: data['img'] as String?,
        quanty: castToType<int>(data['quanty']),
        precoTotal: castToType<double>(data['precoTotal']),
        precoBorda: castToType<double>(data['precoBorda']),
        nomeBorda: data['nomeBorda'] as String?,
        massaGratis: data['massaGratis'] as bool?,
        subtotal: castToType<double>(data['subtotal']),
      );

  static PedidosStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PedidosStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'nomeProduto': _nomeProduto,
        'img': _img,
        'quanty': _quanty,
        'precoTotal': _precoTotal,
        'precoBorda': _precoBorda,
        'nomeBorda': _nomeBorda,
        'massaGratis': _massaGratis,
        'subtotal': _subtotal,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nomeProduto': serializeParam(
          _nomeProduto,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
        'quanty': serializeParam(
          _quanty,
          ParamType.int,
        ),
        'precoTotal': serializeParam(
          _precoTotal,
          ParamType.double,
        ),
        'precoBorda': serializeParam(
          _precoBorda,
          ParamType.double,
        ),
        'nomeBorda': serializeParam(
          _nomeBorda,
          ParamType.String,
        ),
        'massaGratis': serializeParam(
          _massaGratis,
          ParamType.bool,
        ),
        'subtotal': serializeParam(
          _subtotal,
          ParamType.double,
        ),
      }.withoutNulls;

  static PedidosStruct fromSerializableMap(Map<String, dynamic> data) =>
      PedidosStruct(
        nomeProduto: deserializeParam(
          data['nomeProduto'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
        quanty: deserializeParam(
          data['quanty'],
          ParamType.int,
          false,
        ),
        precoTotal: deserializeParam(
          data['precoTotal'],
          ParamType.double,
          false,
        ),
        precoBorda: deserializeParam(
          data['precoBorda'],
          ParamType.double,
          false,
        ),
        nomeBorda: deserializeParam(
          data['nomeBorda'],
          ParamType.String,
          false,
        ),
        massaGratis: deserializeParam(
          data['massaGratis'],
          ParamType.bool,
          false,
        ),
        subtotal: deserializeParam(
          data['subtotal'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PedidosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PedidosStruct &&
        nomeProduto == other.nomeProduto &&
        img == other.img &&
        quanty == other.quanty &&
        precoTotal == other.precoTotal &&
        precoBorda == other.precoBorda &&
        nomeBorda == other.nomeBorda &&
        massaGratis == other.massaGratis &&
        subtotal == other.subtotal;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nomeProduto,
        img,
        quanty,
        precoTotal,
        precoBorda,
        nomeBorda,
        massaGratis,
        subtotal
      ]);
}

PedidosStruct createPedidosStruct({
  String? nomeProduto,
  String? img,
  int? quanty,
  double? precoTotal,
  double? precoBorda,
  String? nomeBorda,
  bool? massaGratis,
  double? subtotal,
}) =>
    PedidosStruct(
      nomeProduto: nomeProduto,
      img: img,
      quanty: quanty,
      precoTotal: precoTotal,
      precoBorda: precoBorda,
      nomeBorda: nomeBorda,
      massaGratis: massaGratis,
      subtotal: subtotal,
    );
