import 'package:supabase/supabase.dart';

class DBService {
  static DBService instance = DBService();

  final SupabaseClient supabaseClient = SupabaseClient(
    'your address',
    'token'
  );
}