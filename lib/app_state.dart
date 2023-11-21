import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _NumCarrinho = prefs.getInt('ff_NumCarrinho') ?? _NumCarrinho;
    });
    _safeInit(() {
      _pedidosCar = prefs
              .getStringList('ff_pedidosCar')
              ?.map((x) {
                try {
                  return PedidosStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _pedidosCar;
    });
    _safeInit(() {
      _TotalPrice = prefs.getDouble('ff_TotalPrice') ?? _TotalPrice;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _MenuCondicao = 'Monte sua Pizza';
  String get MenuCondicao => _MenuCondicao;
  set MenuCondicao(String _value) {
    _MenuCondicao = _value;
  }

  BordasRefStruct _bordasRef = BordasRefStruct.fromSerializableMap(
      jsonDecode('{\"nome_borda\":\"borda\",\"preco_borda\":\"0\"}'));
  BordasRefStruct get bordasRef => _bordasRef;
  set bordasRef(BordasRefStruct _value) {
    _bordasRef = _value;
  }

  void updateBordasRefStruct(Function(BordasRefStruct) updateFn) {
    updateFn(_bordasRef);
  }

  int _quanty = 1;
  int get quanty => _quanty;
  set quanty(int _value) {
    _quanty = _value;
  }

  SaboresRefStruct _Sabores = SaboresRefStruct.fromSerializableMap(jsonDecode(
      '{\"NomeSabor1\":\"nome\",\"NomeSabor2\":\"nome\",\"NomeSabor3\":\"nome\",\"NomeSabor4\":\"nome\",\"PrecoSabor1\":\"0\",\"PrecoSabor2\":\"0\",\"PrecoSabor3\":\"0\",\"PrecoSabor4\":\"0\"}'));
  SaboresRefStruct get Sabores => _Sabores;
  set Sabores(SaboresRefStruct _value) {
    _Sabores = _value;
  }

  void updateSaboresStruct(Function(SaboresRefStruct) updateFn) {
    updateFn(_Sabores);
  }

  int _CondicaoGeral = 0;
  int get CondicaoGeral => _CondicaoGeral;
  set CondicaoGeral(int _value) {
    _CondicaoGeral = _value;
  }

  int _NumCarrinho = 0;
  int get NumCarrinho => _NumCarrinho;
  set NumCarrinho(int _value) {
    _NumCarrinho = _value;
    prefs.setInt('ff_NumCarrinho', _value);
  }

  List<PedidosStruct> _pedidosCar = [];
  List<PedidosStruct> get pedidosCar => _pedidosCar;
  set pedidosCar(List<PedidosStruct> _value) {
    _pedidosCar = _value;
    prefs.setStringList(
        'ff_pedidosCar', _value.map((x) => x.serialize()).toList());
  }

  void addToPedidosCar(PedidosStruct _value) {
    _pedidosCar.add(_value);
    prefs.setStringList(
        'ff_pedidosCar', _pedidosCar.map((x) => x.serialize()).toList());
  }

  void removeFromPedidosCar(PedidosStruct _value) {
    _pedidosCar.remove(_value);
    prefs.setStringList(
        'ff_pedidosCar', _pedidosCar.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPedidosCar(int _index) {
    _pedidosCar.removeAt(_index);
    prefs.setStringList(
        'ff_pedidosCar', _pedidosCar.map((x) => x.serialize()).toList());
  }

  void updatePedidosCarAtIndex(
    int _index,
    PedidosStruct Function(PedidosStruct) updateFn,
  ) {
    _pedidosCar[_index] = updateFn(_pedidosCar[_index]);
    prefs.setStringList(
        'ff_pedidosCar', _pedidosCar.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPedidosCar(int _index, PedidosStruct _value) {
    _pedidosCar.insert(_index, _value);
    prefs.setStringList(
        'ff_pedidosCar', _pedidosCar.map((x) => x.serialize()).toList());
  }

  int _CondicaoBordas = 0;
  int get CondicaoBordas => _CondicaoBordas;
  set CondicaoBordas(int _value) {
    _CondicaoBordas = _value;
  }

  double _TotalPrice = 0;
  double get TotalPrice => _TotalPrice;
  set TotalPrice(double _value) {
    _TotalPrice = _value;
    prefs.setDouble('ff_TotalPrice', _value);
  }

  int _contador = -1;
  int get contador => _contador;
  set contador(int _value) {
    _contador = _value;
  }

  EnderecosStruct _enderecoRef = EnderecosStruct();
  EnderecosStruct get enderecoRef => _enderecoRef;
  set enderecoRef(EnderecosStruct _value) {
    _enderecoRef = _value;
  }

  void updateEnderecoRefStruct(Function(EnderecosStruct) updateFn) {
    updateFn(_enderecoRef);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
