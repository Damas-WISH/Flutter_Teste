import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/services/theme_service.dart';
import 'src/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();


// Inicializa Firebase
await Firebase.initializeApp();


// Inicializa Supabase
await Supabase.initialize(
url: 'https://YOUR-PROJECT.supabase.co',
anonKey: 'YOUR-ANON-KEY',
);


runApp(const MyApp());
}


class MyApp extends StatelessWidget {
const MyApp({super.key});


@override
Widget build(BuildContext context) {
return ChangeNotifierProvider(
create: (_) => ThemeService(),
child: Consumer<ThemeService>(
builder: (context, theme, _) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Flutter Exercícios',
theme: ThemeData.light(),
darkTheme: ThemeData.dark(),
themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
home: HomePage(),
);
},
),
);
}
}