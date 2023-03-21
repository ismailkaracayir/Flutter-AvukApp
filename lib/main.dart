import 'package:avukapp/constant/constant.dart';
import 'package:avukapp/screens/login/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color: kWineRedColor,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
