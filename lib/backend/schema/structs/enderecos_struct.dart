// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnderecosStruct extends BaseStruct {
  EnderecosStruct({
    String? cep,
    String? endereco,
    String? numero,
    String? bairro,
    String? cidade,
    String? estado,
    String? complemento,
  })  : _cep = cep,
        _endereco = endereco,
        _numero = numero,
        _bairro = bairro,
        _cidade = cidade,
        _estado = estado,
        _complemento = complemento;

  // "Cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  set cep(String? val) => _cep = val;
  bool hasCep() => _cep != null;

  // "Endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  set endereco(String? val) => _endereco = val;
  bool hasEndereco() => _endereco != null;

  // "numero" field.
  String? _numero;
  String get numero => _numero ?? '';
  set numero(String? val) => _numero = val;
  bool hasNumero() => _numero != null;

  // "bairro" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  set bairro(String? val) => _bairro = val;
  bool hasBairro() => _bairro != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  set cidade(String? val) => _cidade = val;
  bool hasCidade() => _cidade != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  set estado(String? val) => _estado = val;
  bool hasEstado() => _estado != null;

  // "complemento" field.
  String? _complemento;
  String get complemento => _complemento ?? '';
  set complemento(String? val) => _complemento = val;
  bool hasComplemento() => _complemento != null;

  static EnderecosStruct fromMap(Map<String, dynamic> data) => EnderecosStruct(
        cep: data['Cep'] as String?,
        endereco: data['Endereco'] as String?,
        numero: data['numero'] as String?,
        bairro: data['bairro'] as String?,
        cidade: data['cidade'] as String?,
        estado: data['estado'] as String?,
        complemento: data['complemento'] as String?,
      );

  static EnderecosStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? EnderecosStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Cep': _cep,
        'Endereco': _endereco,
        'numero': _numero,
        'bairro': _bairro,
        'cidade': _cidade,
        'estado': _estado,
        'complemento': _complemento,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Cep': serializeParam(
          _cep,
          ParamType.String,
        ),
        'Endereco': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'numero': serializeParam(
          _numero,
          ParamType.String,
        ),
        'bairro': serializeParam(
          _bairro,
          ParamType.String,
        ),
        'cidade': serializeParam(
          _cidade,
          ParamType.String,
        ),
        'estado': serializeParam(
          _estado,
          ParamType.String,
        ),
        'complemento': serializeParam(
          _complemento,
          ParamType.String,
        ),
      }.withoutNulls;

  static EnderecosStruct fromSerializableMap(Map<String, dynamic> data) =>
      EnderecosStruct(
        cep: deserializeParam(
          data['Cep'],
          ParamType.String,
          false,
        ),
        endereco: deserializeParam(
          data['Endereco'],
          ParamType.String,
          false,
        ),
        numero: deserializeParam(
          data['numero'],
          ParamType.String,
          false,
        ),
        bairro: deserializeParam(
          data['bairro'],
          ParamType.String,
          false,
        ),
        cidade: deserializeParam(
          data['cidade'],
          ParamType.String,
          false,
        ),
        estado: deserializeParam(
          data['estado'],
          ParamType.String,
          false,
        ),
        complemento: deserializeParam(
          data['complemento'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EnderecosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EnderecosStruct &&
        cep == other.cep &&
        endereco == other.endereco &&
        numero == other.numero &&
        bairro == other.bairro &&
        cidade == other.cidade &&
        estado == other.estado &&
        complemento == other.complemento;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([cep, endereco, numero, bairro, cidade, estado, complemento]);
}

EnderecosStruct createEnderecosStruct({
  String? cep,
  String? endereco,
  String? numero,
  String? bairro,
  String? cidade,
  String? estado,
  String? complemento,
}) =>
    EnderecosStruct(
      cep: cep,
      endereco: endereco,
      numero: numero,
      bairro: bairro,
      cidade: cidade,
      estado: estado,
      complemento: complemento,
    );
