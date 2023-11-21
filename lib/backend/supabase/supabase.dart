import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://gfroshhgcjdfqocidcyc.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imdmcm9zaGhnY2pkZnFvY2lkY3ljIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk5MDU3MzYsImV4cCI6MjAxNTQ4MTczNn0.Sh4ZrnWKXAcB-nzQHnGV0aKsUt4-5VhJL649L2pg8lo';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
