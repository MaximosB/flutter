import 'package:flutter/material.dart';
import 'package:flutter_test2/Services/auth_service.dart';
import 'package:provider/provider.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text('O login foi efetuado com sucesso, Bem vindo!'),
              subtitle: Text(
                '',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.indigo,
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
