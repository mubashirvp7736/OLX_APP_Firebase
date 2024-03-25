
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


   import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase2/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
class DatabaseService {
  String collection = 'products';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<ProductModel> collectionReference;
  Reference storage = FirebaseStorage.instance.ref();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  DatabaseService() {
    collectionReference =
        firestore.collection(collection).withConverter<ProductModel>(
      fromFirestore: (snapshot, options) {
        return ProductModel.fromJson(snapshot.id, snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

   
   Future<void>addProduct(ProductModel data)async{
    try{
     await collectionReference.add(data);
    }catch(e){
      print('Error adding product:$e');
    }

   }
   Future<List<ProductModel>>getAllProduct()async{
    final snapshot=
    await collectionReference.orderBy("timeStamp",descending: true).get();
    return snapshot.docs.map((doc) =>doc.data() ).toList();
   }
    IsSold(String id) async {
    await collectionReference.doc(id).update({'isSold': true});
  }

  Future<void> IsWishListClick(String id, bool wishListStatus) async {
    try {
      if (wishListStatus == true) {
        await collectionReference.doc(id).update({
          'wishList': FieldValue.arrayUnion([
            firebaseAuth.currentUser!.email ??
                firebaseAuth.currentUser!.phoneNumber
          ])
        });
      } else {
        await collectionReference.doc(id).update({
          'wishList': FieldValue.arrayRemove([
            firebaseAuth.currentUser!.email ??
                firebaseAuth.currentUser!.phoneNumber
          ])
        });
      }
    } catch (e) {
      log('Error updating wishlist status: $e');
    }
  }

  Future<String> uploadImage(imageName, imageFile) async {
    Reference imageFolder = storage.child('productImage');
    Reference? uploadImage = imageFolder.child('$imageName.jpg');

    await uploadImage.putFile(imageFile);
    String downloadURL = await uploadImage.getDownloadURL();
    log('Image successfully uploaded to Firebase Storage.');
    return downloadURL;
  }

  updateMyProudct(productId, ProductModel data) async {
    try {
      await collectionReference.doc(productId).update(data.toJson());
      log('sdajfjkasfsaf');
    } catch (e) {
      log('Error : product is not updated $e');
    }
  }

  deleteMyProduct(productId) async {
    try {
      await collectionReference.doc(productId).delete();
      log("Product is deleted");
    } catch (e) {
      log('Product is not deleted: $e');
    }
  }
}
   