import 'package:flutter/material.dart';
import 'package:flutter_test2/Services/auth_service.dart';
import 'package:provider/provider.dart';

class ConquistaPage extends StatefulWidget {
  ConquistaPage({Key? key}) : super(key: key);

  @override
  _ConquistaPageState createState() => _ConquistaPageState();
}

class _ConquistaPageState extends State<ConquistaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conquistas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text('Usuario'),
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
