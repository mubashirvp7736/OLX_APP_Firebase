import 'package:firebase2/view/login_page.dart';
import 'package:firebase2/view/register_page.dart';
import 'package:flutter/material.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool showingLoginPage=true;

  void togglePages(){
    setState(() {
        showingLoginPage=!showingLoginPage;
    });

  }

  @override
  Widget build(BuildContext context) {
    if (showingLoginPage) {
      return LoginScreen(
        onTap: togglePages,
      );
      
    }else{
    return RegisterPage(onTap: () {  },);
  }}
}