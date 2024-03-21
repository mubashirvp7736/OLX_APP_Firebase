import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import"package:firebase_auth/firebase_auth.dart";
import 'package:google_sign_in/google_sign_in.dart';
class HomeScreen extends StatelessWidget {

 HomeScreen({super.key});
  final user=FirebaseAuth.instance.currentUser!;
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: ()async{
              await GoogleSignIn().signOut();
            signUserOut();
            }, icon: Icon(Icons.logout))
        ],
      ),
       body: Center(
        child: Text('Logged in'+user.email!,style: TextStyle(fontSize: 20),),
       ),
    );
  }
}