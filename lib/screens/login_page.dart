import 'package:flutter/material.dart';
//import 'screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';







class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
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
        title: const Text('Login'),
      ),
      body: Column(
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
                    hintText: 'Enter your Password',
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try{
                       final userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                    // ignore: avoid_print
                    print(userCredential);
                    }  on FirebaseAuthException catch(e){
                      // ignore: avoid_print
                      if(e.code=='invalid-email'){
                        print('user-not-found');
                      }
                      else if (e.code=='wrong-password'){
                            print('wrong password');
                      }
                     
                  
                    }
                    
                   
                  },
                  child: const Text("Login"),
                ),
                TextButton(onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/ragister/',
                     (route) => false
                     );
    
                }, child: 
                    const Text('not register yet ? ragister here!'),
                )
              ],
            ),
    );
  }
  }
  

  

