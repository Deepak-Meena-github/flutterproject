import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Authentication'),
      ),
      body: Center(
        child: TextButton(onPressed: () {
          
        },child: const Text("Register"),),
      ),
    );
  }
}


  
