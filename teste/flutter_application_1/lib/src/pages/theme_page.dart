import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/theme_service.dart';


class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

@override
Widget build(BuildContext context) {
final theme = Provider.of<ThemeService>(context);
return Scaffold(
appBar: AppBar(title: Text('Tema')),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text('Tema atual: ${theme.isDark ? "Escuro" : "Claro"}'),
ElevatedButton(
child: Text('Alternar Tema'),
onPressed: () => theme.toggleTheme(),
)
],
),
),
);
}
}