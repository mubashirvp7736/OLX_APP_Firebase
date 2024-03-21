
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices{

  signInWithGoogle()async{
  //begin interactive sign in process
    final GoogleSignInAccount? gUser=await GoogleSignIn().signIn();
//obtain  auth detail from request
    final GoogleSignInAuthentication gAuth=await gUser!.authentication;  
    //create a new credential for user  
    final credential=GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}