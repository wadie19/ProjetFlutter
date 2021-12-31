import 'package:flutter/material.dart';
import 'Screens/LoginForm.dart';
import 'package:login_with_signup/Screens/Homemain.dart';
import 'package:login_with_signup/Screens/SignupForm.dart';
import 'package:login_with_signup/family/add.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jeune de Tunis',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>  LoginForm(),


      },

    );
  }
}
