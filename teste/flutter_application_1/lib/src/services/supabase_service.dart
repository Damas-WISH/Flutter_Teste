import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  /// Retorna lista de produtos (assume tabela `products` com colunas `id`, `name`, `price`, ...)
  Future<List<Map<String, dynamic>>> getProducts() async {
    // ignore: deprecated_member_use
    final res = await _client.from('products').select().order('id', ascending: false).execute();
    if (res.error != null) throw Exception(res.error!.message);
    final data = res.data;
    if (data is List) return List<Map<String, dynamic>>.from(data);
    return [];
  }

  /// Exemplo: buscar produto por id
  Future<Map<String, dynamic>?> getProductById(int id) async {
    // ignore: deprecated_member_use
    final res = await _client.from('products').select().eq('id', id).single().execute();
    if (res.error != null) throw Exception(res.error!.message);
    return res.data as Map<String, dynamic>?;
  }
}

extension on PostgrestResponse {
  get error => null;
}
