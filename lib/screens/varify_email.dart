import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constant/routes.dart';

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
          const Text("we've sent you your email varifacation please varify your email"),
        const  Text(" if you haven't recived email varyfication email yet,please press below buttton"),
          TextButton(onPressed: ()async {
            final user=FirebaseAuth.instance.currentUser;
            user?.sendEmailVerification();
    
          }, child:const Text('send email varifation '),
          ),
          TextButton(onPressed: ( )async { 
            await FirebaseAuth.instance.signOut();
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamedAndRemoveUntil(ragisterRoute, (route) => false);
            }, 
          child:const Text('restart'),
           )
        ]
        ),
    );
  }
}
