
import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

 



void main() async {
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const LoginPage(),
    );
  }
}
