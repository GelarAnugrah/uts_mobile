import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/register',
      routes: {
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/homepage': (context) => HomePage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.yellow,
      ),
    );
  }
}