// import 'package:firebase2/controller/authentication_provider.dart';
// import 'package:firebase2/view/login_page.dart';
// import 'package:firebase2/view/register_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LoginRegister extends StatefulWidget {
//   const LoginRegister({super.key});

//   @override
//   State<LoginRegister> createState() => _LoginRegisterState();
// }

// class _LoginRegisterState extends State<LoginRegister> {
//   // bool showingLoginPage=true;

//   // void togglePages(){
//   //   setState(() {
//   //       showingLoginPage=!showingLoginPage;
//   //   });

//   // }

//   @override
//   Widget build(BuildContext context) {
//         final registerProvider=Provider.of<LoginProvider>(context);

//     if (registerProvider.showingLoginPage) {
//       return LoginScreen(
//         onTap:(){
//           registerProvider.registerSignUserUp(context);
//         },
//       );
      
//     }else{
//     return RegisterPage(onTap: () {  },);
//   }}
// }