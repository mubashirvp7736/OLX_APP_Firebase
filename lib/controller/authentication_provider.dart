// ignore_for_file: unused_local_variable

import 'package:firebase2/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// class LoginProvider extends ChangeNotifier {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordlController = TextEditingController();
//   final TextEditingController otpController = TextEditingController();
//   bool showingLoginPage=true;
//   DatabaseService database=DatabaseService();

//   void signIn(context) async {
//     showDialog(
//       context: context,
//       builder: (context) => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text, password: passwordlController.text);
//       if (context.mounted) Navigator.pop(context);
//       notifyListeners();
//     } on FirebaseAuthException catch (e) {
//       Navigator.pop(context);
//       displayMessage(e.code, context);
//       notifyListeners();
//     }
//     notifyListeners();
//   }

//   void displayMessage(String message, BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(message),
//       ),
//     );
//     notifyListeners();
//   }
  
  // void googleSignOut()async{
  //  await GoogleSignIn().signOut();
  //   notifyListeners();
  // }

//   Future<UserCredential> signInWithGithub() async {
//     GithubAuthProvider githubAuthProvider = GithubAuthProvider();
//     notifyListeners();
//     return await FirebaseAuth.instance.signInWithProvider(githubAuthProvider);
//   }

//   Future<void> signInWithGoogle() async {
//     final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

//     final GoogleSignInAuthentication gAuth = await gUser!.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: gAuth.accessToken,
//       idToken: gAuth.idToken,
//     );
//     UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//     notifyListeners();
//   }

  //   void signOut()async {
  //  await FirebaseAuth.instance.signOut();
  //   notifyListeners();
  // }


// Future registerSignUserUp(BuildContext context)async{
//     showDialog(context: context, builder: (context) =>const Center(
//     child: SnackBar(content: Text('Successfully add')),
//   ),);
 
//   try{
//    FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email:emailController.text, 
//     password:passwordlController.text);
//     Navigator.pop(context);
//   }on FirebaseAuthException catch (e){
//     Navigator.pop(context);
//     if(e.code=="user-not-found"){
//     }else if(e.code=="wrong password"){
//     }

//   }
//  }
//  String? verificationId;
//  Future<void> otpSignin(BuildContext context)async{
//      try{ 
//        PhoneAuthCredential credential=await PhoneAuthProvider.credential(
//        verificationId: verificationId.toString(), smsCode:otpController.text.toString());
//      FirebaseAuth.instance.signInWithCredential(credential).then((value) => 
//        Navigator.push(context, MaterialPageRoute(builder: (context) =>
//            LoginScreen() ,)
//            )
//            );
//              }catch(ex){
//              log(ex.toString());

//      }
//    }


class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ProductService _authenticationService = ProductService();

  void signInWithEmailAndPassword(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await _authenticationService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);

      if (context.mounted) Navigator.pop(context);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code, context);
      notifyListeners();
    }
  }

  // void signInWithGithub(context) async {
  //   try {
  //     await _authenticationService.signInWithGithub(context);
  //     notifyListeners();
  //   } catch (e) {
  //     displayMessage(e.toString(), context);
  //     notifyListeners();
  //   }
  // }
      void signOut()async {
   await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

 Future<void> googleSignOut()async{
   await GoogleSignIn().signOut();
    notifyListeners();
  }

  Future<void> signInWithGoogle(context) async {
    try {
      await _authenticationService.signInWithGoogle();
      notifyListeners();
    } catch (e) {
      displayMessage(e.toString(), context);
      notifyListeners();
    }
  }

  void displayMessage(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

}