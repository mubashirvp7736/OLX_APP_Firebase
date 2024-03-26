import 'package:firebase2/view/bottombar.dart';
import 'package:firebase2/view/authentication_screen/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return  BottomPage();
          } else {
            //user not logged in
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
