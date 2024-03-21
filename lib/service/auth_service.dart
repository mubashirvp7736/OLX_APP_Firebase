
// import 'dart:developer';

// import 'package:firebase2/controller/authentication_provider.dart';
// import 'package:firebase2/view/home_page.dart';
// import 'package:firebase2/view/login_page.dart';
// import 'package:firebase2/view/otp_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter/material.dart';
// class AuthServices{
//   AuthenticatioController authProvider=AuthenticatioController();
//   FirebaseAuth firbaseauth=FirebaseAuth.instance;
//   String? verificationId;

//  Future signInWithGoogle()async{
//     final GoogleSignInAccount? gUser=await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication gAuth=await gUser!.authentication;  
//     final credential=GoogleAuthProvider.credential(
//       accessToken: gAuth.accessToken,
//       idToken: gAuth.idToken
//     );
//     return await firbaseauth.signInWithCredential(credential);
//   }

//  Future<void> signoutGoogle()async{
//  await GoogleSignIn().signOut();

//    }
 
//  Future<void>loginsignIn(BuildContext context)async{
//   showDialog(context: context, builder: (context) =>const Center(
//     child: CircularProgressIndicator(),
//   ),);

//   try{
//    firbaseauth.signInWithEmailAndPassword(
//     email:authProvider.emailController.text, 
//     password:authProvider.passwordController.text);
//     Navigator.pop(context);
//   }on FirebaseAuthException catch (e){
//     Navigator.pop(context);
//     if(e.code=="user-not-found"){
//      // wrongEmailMessage(context);
//     }else if(e.code=="wrong password"){
//       // wrongPasswordMessage(context);
//     }

//   }
//  }
//   Future<void> otpSignin(BuildContext context)async{
//     try{ 
//       PhoneAuthCredential credential=await PhoneAuthProvider.credential(
//       verificationId: verificationId.toString(), smsCode:authProvider.otpController.text.toString());
//     firbaseauth.signInWithCredential(credential).then((value) => 
//       Navigator.push(context, MaterialPageRoute(builder: (context) =>
//       LoginScreen() ,)));
//             }catch(ex){
//             log(ex.toString());

//     }
//   }
//   Future<void> phoneAuth(BuildContext context,verificationId)async{
//      await firbaseauth.verifyPhoneNumber(
//           verificationCompleted:(PhoneAuthCredential credential) {},
//           verificationFailed: (FirebaseAuthException ex) {
            
//           },
//            codeSent: ( String verificationId, int? resendtoken) {
//              Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(verificationId: verificationId,),));
//            },
//             codeAutoRetrievalTimeout:(String verificationId) {
              
//             },phoneNumber:authProvider.phoneController.text.toString());
         
//   }
//  Future<void> registerSignUserUp(BuildContext context)async{
//     showDialog(context: context, builder: (context) =>const Center(
//     child: SnackBar(content: Text('Successfully add')),
//   ),);
 
//   try{
//    FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email:authProvider.emailController.text, 
//     password:authProvider.passwordController.text);
//     Navigator.pop(context);
//   }on FirebaseAuthException catch (e){
//     Navigator.pop(context);
//     if(e.code=="user-not-found"){
//     //  wrongEmailMessage(context);
//     }else if(e.code=="wrong password"){
//       // wrongPasswordMessage(context);
//     }

//   }
//  }
// }


   
