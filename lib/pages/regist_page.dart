import 'package:flutter/material.dart';
import 'package:flutter_test2/Services/auth_service.dart';
import 'package:flutter_test2/pages/login_page.dart';
import 'package:provider/provider.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  _RegistPageState createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final senha2 = TextEditingController();

  late String titulo = 'Crie sua conta';
  late String actionButton = 'Cadastrar';
  late String toggleButton = 'voltar ao Login';
  bool loading = false;

  void initState() {
    super.initState();
  }

  registrar() async {
    try {
      setState(() => loading = true);
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
      return;
    }
    setState(() => loading = false);
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return 'Email inválido';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24),
                  child: TextFormField(
                    controller: senha,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                    validator: (senha) {
                      if (senha!.isEmpty) {
                        return 'Digite uma senha!';
                      } else if (senha.length < 6) {
                        return 'Sua senha deve conter no mínimo 6 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24),
                  child: TextFormField(
                    controller: senha2,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirmar senha',
                    ),
                    validator: (Text) {
                      if (Text!.isEmpty) {
                        return 'Digite uma senha!';
                      } else if (senha.text != senha2.text) {
                        return 'As senhas não são iguais!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        registrar();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (loading)
                          ? [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ]
                          : [
                              Icon(Icons.check),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  actionButton,
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                    ),
                  ),
                ),
                TextButton(
                    onPressed: (() => Navigator.pop(context)),
                    child: Text(toggleButton))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
