import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VarifyEmailVIew extends StatefulWidget {
  const VarifyEmailVIew({super.key});

  @override
  State<VarifyEmailVIew> createState() => _VarifyEmailVIewState();
}

class _VarifyEmailVIewState extends State<VarifyEmailVIew> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('varify email'),
      ),
      body: Column(
        children: [
        const  Text('please varify your email addresses'),
          TextButton(onPressed: ()async {
            final user=FirebaseAuth.instance.currentUser;
            user?.sendEmailVerification();
    
          }, child:const Text('send email varifation '),
          )
        ]
        ),
    );
  }
}
