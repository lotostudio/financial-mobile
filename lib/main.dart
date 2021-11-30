import 'package:finance_app/pages/auth_page.dart';
import 'package:finance_app/pages/profile_page.dart';
import 'package:finance_app/pages/login_page.dart';
import 'package:finance_app/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance App',
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => AuthPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/profile': (context) => ProfilePage(token: '',),
      },
    );
  }
}
