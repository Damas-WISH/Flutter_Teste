import 'package:flutter/material.dart';
import '../services/firestore_service.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

@override
State<RegisterPage> createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
final _emailCtrl = TextEditingController();
final _passCtrl = TextEditingController();
final _firestore = FirestoreService();


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Registrar Usuário')),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
children: [
TextField(
controller: _emailCtrl,
decoration: InputDecoration(labelText: 'Email'),
),
TextField(
controller: _passCtrl,
decoration: InputDecoration(labelText: 'Senha'),
obscureText: true,
),
SizedBox(height: 20),
ElevatedButton(
child: Text('Registrar'),
onPressed: () async {
try {
await _firestore.registerWithEmail(
_emailCtrl.text,
_passCtrl.text,
{'role': 'user'},
);
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text('Usuário registrado com sucesso')),
);
} catch (e) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text('Erro: $e')),
);
}
},
)
],
),
),
);
}
}