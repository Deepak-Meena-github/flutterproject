
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/firebase_options.dart';

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
//             final user=(FirebaseAuth.instance.currentUser);
//             final emailVarified=user?.emailVerified ?? false;
//             print(user);
//             if(emailVarified){
              /*  */
               
// return const Text('done');
//             }
//             else {
                   
//                  return const VarifyEmailVIew();
//             }
          return const LoginPage();
              
             default: 
             return const CircularProgressIndicator();
            


            
          }
          
          },
      );
  }
 }
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
