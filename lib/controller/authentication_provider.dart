// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:firebase2/view/authentication_screen/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordlController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  bool showingLoginPage=true;
  //user signed in
  void signIn(context) async {
    //loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordlController.text);

      // pop loading circle
      if (context.mounted) Navigator.pop(context);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //display error message
      displayMessage(e.code, context);
      notifyListeners();
    }
    notifyListeners();
  }

  //display a message to user
  void displayMessage(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
    notifyListeners();
  }

  Future<UserCredential> signInWithGithub() async {
    GithubAuthProvider githubAuthProvider = GithubAuthProvider();
    notifyListeners();
    return await FirebaseAuth.instance.signInWithProvider(githubAuthProvider);
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }

    void signOut() {
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }


Future registerSignUserUp(BuildContext context)async{
    showDialog(context: context, builder: (context) =>const Center(
    child: SnackBar(content: Text('Successfully add')),
  ),);
 
  try{
   FirebaseAuth.instance.createUserWithEmailAndPassword(
    email:emailController.text, 
    password:passwordlController.text);
    Navigator.pop(context);
  }on FirebaseAuthException catch (e){
    Navigator.pop(context);
    if(e.code=="user-not-found"){
    //  wrongEmailMessage(context);
    }else if(e.code=="wrong password"){
      // wrongPasswordMessage(context);
    }

  }
 }
 String? verificationId;
 Future<void> otpSignin(BuildContext context)async{
     try{ 
       PhoneAuthCredential credential=await PhoneAuthProvider.credential(
       verificationId: verificationId.toString(), smsCode:otpController.text.toString());
     FirebaseAuth.instance.signInWithCredential(credential).then((value) => 
       Navigator.push(context, MaterialPageRoute(builder: (context) =>
       LoginScreen() ,)));
             }catch(ex){
             log(ex.toString());

     }
   }

   
}