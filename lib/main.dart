
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/firebase_options.dart';
import 'package:flutter_authentication/screens/varify_email.dart';

import 'screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/ragister_view.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      home: const   HomePage(),
      routes: {
        '/login/':(context)=> const LoginPage(),
        '/ragister/':(context)=> const RegisterView(),
        
      },
    );
  }
}
 class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
            final user=FirebaseAuth.instance.currentUser;
            if(user!=null){
              if(user.emailVerified){
                print('email is varified');
              }
              else {
              return const VarifyEmailVIew();
            }
             
            }
            else {
            return const LoginPage();
            }
 
          return const Text('done');
              
             default: 
             return const CircularProgressIndicator();
            


            
          }
          
          },
      );
  }
 }
 