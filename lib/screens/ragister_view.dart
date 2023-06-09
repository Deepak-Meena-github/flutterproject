import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'dart:developer' as devtools show  log;

import 'package:flutter_authentication/constant/routes.dart';
import 'package:flutter_authentication/utilities/show_error.dart';



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
                       await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password);
                            final user=FirebaseAuth.instance.currentUser;
                         await   user?.sendEmailVerification();

                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamed(verifyEmailRoute);
                    //devtools.log(userCredential.toString());
                    }  
                    on FirebaseAuthException catch(e){
                      // ignore: avoid_print
                      if(e.code=='weak-password'){
                      await showErrorDialog(context, "weakpassword",);
                      }
                      else if (e.code=='email-already-in-use'){
                            // ignore: avoid_print
                           await showErrorDialog(context, "email is already used",);
                      }
                      // else if(e.code=='invalid-email'){
                      //   print('invalid email entered');
                      // }
                      else if (e.code=="invalid-email"){
                        await showErrorDialog(context, 'invalid email address',);
                      }
                     else {
                      await showErrorDialog(context, "Error($e.code)",);
                     }
                      //print(e);
                     
                  
                    } catch(e){
                      await showErrorDialog(context, e.toString(),);
                    }
                    
                   
                  },
                  child: const Text("Ragister"),
                ),
                TextButton(onPressed: (){
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
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