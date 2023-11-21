import '../database.dart';

class ProdutosTable extends SupabaseTable<ProdutosRow> {
  @override
  String get tableName => 'Produtos';

  @override
  ProdutosRow createRow(Map<String, dynamic> data) => ProdutosRow(data);
}

class ProdutosRow extends SupabaseDataRow {
  ProdutosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProdutosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  double? get valorProduto => getField<double>('valor_produto');
  set valorProduto(double? value) => setField<double>('valor_produto', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  String? get tag => getField<String>('tag');
  set tag(String? value) => setField<String>('tag', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);
}
