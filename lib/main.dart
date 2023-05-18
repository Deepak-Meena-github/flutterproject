




import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/firebase_options.dart';
import 'package:flutter_authentication/constant/routes.dart';
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
        loginRoute:(context)=> const LoginPage(),
        ragisterRoute:(context)=> const RegisterView(),
        notesRoute: (context)=> const  NotesView(),
        
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
                return const NotesView();
              }
              else {
              return const VarifyEmailVIew();
              
            }
             
            }
            else {
            return const LoginPage();
            }
 
          
              
             default: 
             return const CircularProgressIndicator();
            


            
          }
          
          },
      );
  }
 }
 enum MenuAction{logout}
 class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("main UI"),
        actions: [ PopupMenuButton<MenuAction>(onSelected:( value)async {
          switch (value) {
            
            case MenuAction.logout:
              final shouldlogout= await showLogOutDialog(context);
              if(shouldlogout){
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (_) => false);

              }
              
          }
        }, itemBuilder: (context) {
          return  [
            const PopupMenuItem<MenuAction>(value:MenuAction.logout, 
          child :Text('logout'),
            ),

          ];
          
        },)
          


          
        ],
      ),
      body:const Text('hello world')
    );
  }
}
Future<bool> showLogOutDialog(BuildContext context){
  return showDialog<bool>(
    context: context, 
  builder: (context){
    return  AlertDialog(
      title: const Text('sign out'),
      content: const  Text("are you sure you want to logout"),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop(false);
        }, child: const  Text('cancle')),
        TextButton(onPressed: (){
          Navigator.of(context).pop(true);
        }, child: const Text('logout')),
      ],
    );

  },
  ).then((value) =>  value ?? false);
}