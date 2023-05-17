import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
        title: const Text('Ragister view'),),
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
                        .createUserWithEmailAndPassword(
                            email: email, password: password);
                    // ignore: avoid_print
                    print(userCredential);
                    }  on FirebaseAuthException catch(e){
                      // ignore: avoid_print
                      if(e.code=='weak-password'){
                        print('weak-password');
                      }
                      else if (e.code=='email-already-in-use'){
                            // ignore: avoid_print
                            print("email already in use");
                      }
                      // else if(e.code=='invalid-email'){
                      //   print('invalid email entered');
                      // }
                      else if (e.code=="invalid-email"){
                        print("email is not valid");
                      }
                     
                      //print(e);
                     
                  
                    }
                    
                   
                  },
                  child: const Text("Ragister"),
                ),
                TextButton(onPressed: (){
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login/',
                   (route) => false
                   );

              }, child: 
                  const Text('Already  registered ? ragister here!'),
              ),
              ],
            ),
    );
  }
}