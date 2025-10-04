import 'package:flutter/material.dart';
import '../services/secure_storage_service.dart';


class SecurePage extends StatefulWidget {
  const SecurePage({super.key});

@override
State<SecurePage> createState() => _SecurePageState();
}


class _SecurePageState extends State<SecurePage> {
final _secure = SecureStorageService();
final _tokenCtrl = TextEditingController();
String? _savedToken;


void _save() async {
await _secure.saveToken(_tokenCtrl.text);
setState(() => _savedToken = _tokenCtrl.text);
}


void _load() async {
final token = await _secure.getToken();
setState(() => _savedToken = token);
}


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Secure Storage')),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
children: [
TextField(
controller: _tokenCtrl,
decoration: InputDecoration(labelText: 'Digite um token'),
),
ElevatedButton(onPressed: _save, child: Text('Salvar')),
ElevatedButton(onPressed: _load, child: Text('Carregar')),
if (_savedToken != null) Text('Token salvo: $_savedToken'),
],
),
),
);
}
}