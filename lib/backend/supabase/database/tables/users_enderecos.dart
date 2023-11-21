import '../database.dart';

class UsersEnderecosTable extends SupabaseTable<UsersEnderecosRow> {
  @override
  String get tableName => 'users_Enderecos';

  @override
  UsersEnderecosRow createRow(Map<String, dynamic> data) =>
      UsersEnderecosRow(data);
}

class UsersEnderecosRow extends SupabaseDataRow {
  UsersEnderecosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersEnderecosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get cep => getField<String>('cep');
  set cep(String? value) => setField<String>('cep', value);

  String? get endereco => getField<String>('endereco');
  set endereco(String? value) => setField<String>('endereco', value);

  String? get numero => getField<String>('numero');
  set numero(String? value) => setField<String>('numero', value);

  String? get bairro => getField<String>('bairro');
  set bairro(String? value) => setField<String>('bairro', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get uf => getField<String>('UF');
  set uf(String? value) => setField<String>('UF', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
