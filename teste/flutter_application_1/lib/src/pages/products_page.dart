import 'package:flutter/material.dart';
import '../services/supabase_service.dart';


class ProductsPage extends StatelessWidget {
final supabase = SupabaseService();

  ProductsPage({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Produtos')),
body: FutureBuilder<List<Map<String, dynamic>>>(
future: supabase.getProducts(),
builder: (context, snapshot) {
if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
final products = snapshot.data!;
return ListView.builder(
itemCount: products.length,
itemBuilder: (context, i) {
final p = products[i];
return ListTile(
title: Text(p['name'] ?? '—'),
subtitle: Text('Preço: R\$ ${p['price'] ?? '—'}'),
);
},
);
},
),
);
}
}