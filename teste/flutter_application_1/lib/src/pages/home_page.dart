import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/theme_service.dart';
import 'tasks_page.dart';
import 'products_page.dart';
import 'register_page.dart';
import 'secure_page.dart';
import 'theme_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

@override
Widget build(BuildContext context) {
final theme = Provider.of<ThemeService>(context);
return Scaffold(
appBar: AppBar(
title: Text('Home'),
actions: [
IconButton(
icon: Icon(theme.isDark ? Icons.dark_mode : Icons.light_mode),
onPressed: () => theme.toggleTheme(),
)
],
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ElevatedButton(
child: Text('Tarefas (SQLite)'),
onPressed: () => Navigator.push(
context,
MaterialPageRoute(builder: (_) => TasksPage()),
),
),
ElevatedButton(
child: Text('Produtos (Supabase)'),
onPressed: () => Navigator.push(
context,
MaterialPageRoute(builder: (_) => ProductsPage()),
),
),
ElevatedButton(
child: Text('Registrar Usuário (Firestore)'),
onPressed: () => Navigator.push(
context,
MaterialPageRoute(builder: (_) => RegisterPage()),
),
),
ElevatedButton(
child: Text('Secure Storage'),
onPressed: () => Navigator.push(
context,
MaterialPageRoute(builder: (_) => SecurePage()),
),
),
ElevatedButton(
child: Text('Tema'),
onPressed: () => Navigator.push(
context,
MaterialPageRoute(builder: (_) => ThemePage()),
),
),
],
),
),
);
}
}