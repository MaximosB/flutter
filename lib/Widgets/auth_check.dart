import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/Services/auth_service.dart';
import 'package:flutter_test2/pages/login_page.dart';
import 'package:provider/provider.dart';

import '../pages/home_page.dart';

class AuthCheck extends StatefulWidget {
  AuthCheck({Key? key}) : super(key: key);

  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null)
      return LoginPage();
    else
      return HomePage();
  }

  loading() {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
