import '../database.dart';

class PedidosTable extends SupabaseTable<PedidosRow> {
  @override
  String get tableName => 'Pedidos';

  @override
  PedidosRow createRow(Map<String, dynamic> data) => PedidosRow(data);
}

class PedidosRow extends SupabaseDataRow {
  PedidosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PedidosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get numeroPed => getField<int>('numero_ped');
  set numeroPed(int? value) => setField<int>('numero_ped', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  double? get precoProduto => getField<double>('preco_produto');
  set precoProduto(double? value) => setField<double>('preco_produto', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  int? get quanty => getField<int>('quanty');
  set quanty(int? value) => setField<int>('quanty', value);

  String? get nomeBorda => getField<String>('nome_borda');
  set nomeBorda(String? value) => setField<String>('nome_borda', value);

  double? get precoBorda => getField<double>('preco_borda');
  set precoBorda(double? value) => setField<double>('preco_borda', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  bool? get massaGratis => getField<bool>('massa gratis');
  set massaGratis(bool? value) => setField<bool>('massa gratis', value);
}
