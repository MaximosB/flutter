import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/Services/auth_service.dart';
import 'package:flutter_test2/aplicativo.dart';
import 'package:flutter_test2/configs/app_settings.dart';
import 'package:flutter_test2/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => AppSettings()),
      ],
      child: aplicativo(),
    ),
  );
}
