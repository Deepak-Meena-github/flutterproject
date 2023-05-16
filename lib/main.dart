
import 'package:flutter/material.dart';
//import 'screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
 



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
      home: const LoginPage(),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final  TextEditingController _email;
  late final TextEditingController  _password;
  @override
  void initState() {
    
      _email=TextEditingController();
      _password=TextEditingController();
      super.initState();
  }
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Authentication'),
      ),
      body: 
         FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),

          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                
                break;
                case ConnectionState.waiting:
                
                break;
                 case ConnectionState.active:
                
                break;
                case ConnectionState.done:
                
                break;

              
            }
            return Column(
             children: [
                TextField(
                                
                  controller: _email,
                  enableSuggestions: false,
              autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Enter your Email',
                  ),
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
              autocorrect: false,
                   decoration: const InputDecoration(
                    hintText: 'Enter your Password',),
                ),
               TextButton(onPressed:()async {
                
                final email=_email.text;
                final password=_password.text;
                final userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email, 
                  password: password);
                  // ignore: avoid_print
                  print(userCredential);
                
                
                 },child: const Text("Register"),),
             ],
           );
            
          },

           
         ),
      
    );
  }
}
