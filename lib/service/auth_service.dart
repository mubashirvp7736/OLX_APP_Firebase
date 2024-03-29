import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase2/controller/product_provider.dart';
import 'package:firebase2/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
// class DatabaseServic {
//   String collection = 'products';
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   late CollectionReference<ProductModel> collectionReference;
//   Reference storage = FirebaseStorage.instance.ref();
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//    final ImagePicker imagePicker = ImagePicker();


//   DatabaseServic() {
//     collectionReference =
//         firestore.collection(collection).withConverter<ProductModel>(
//       fromFirestore: (snapshot, options) {
//         return ProductModel.fromJson(snapshot.id, snapshot.data()!);
//       },
//       toFirestore: (value, options) {
//         return value.toJson();
//       },
//     );
//   }

   
//    Future<void>addProduct(ProductModel data)async{
//     try{
//      await collectionReference.add(data);
//     }catch(e){
//       print('Error adding product:$e');
//     }

//    }
//    Future<List<ProductModel>>getAllProduct()async{
//     // final snapshot=
//     // await collectionReference.orderBy("timeStamp",descending: true).get();
//     // return snapshot.docs.map((doc) =>doc.data() ).toList();
//     final snapshot= await collectionReference.get();
//     return snapshot.docs.map((doc)=>doc.data()).toList();
    
//    }
//     isSold(String id) async {
//     await collectionReference.doc(id).update({'isSold': true});
//   }

//   Future<void> isWishListClick(String id, bool wishListStatus) async {
//     try {
//       if (wishListStatus == true) {
//         await collectionReference.doc(id).update({
//           'wishList': FieldValue.arrayUnion([
//             firebaseAuth.currentUser!.email ??
//                 firebaseAuth.currentUser!.phoneNumber
//           ])
//         });
//       } else {
//         await collectionReference.doc(id).update({
//           'wishList': FieldValue.arrayRemove([
//             firebaseAuth.currentUser!.email ??
//                 firebaseAuth.currentUser!.phoneNumber
//           ])
//         });
//       }
//     } catch (e) {
//       log('Error updating wishlist status: $e');
//     }
//   }

//   updateMyProudct(productId, ProductModel data) async {
//     try {
//       await collectionReference.doc(productId).update(data.toJson());
//       log('sdajfjkasfsaf');
//     } catch (e) {
//       log('Error : product is not updated $e');
//     }
//   }

//   deleteMyProduct(productId) async {
//     try {
//       await collectionReference.doc(productId).delete();
//       log("Product is deleted");
//     } catch (e) {
//       log('Product is not deleted: $e');
//     }
//   }

//   Future<String> uploadImage(imageName, imageFile) async {
//     Reference imageFolder = storage.child('productImage');
//     Reference? uploadImage = imageFolder.child('$imageName.jpg');

//     await uploadImage.putFile(imageFile);
//     String downloadURL = await uploadImage.getDownloadURL();
//     log('Image successfully uploaded to Firebase Storage.');
//     return downloadURL;
//   }

//   Future<File?> pickImage(ImageSource source) async {
//     final pickedFile = await imagePicker.pickImage(source: source);
//     if (pickedFile != null) {
//       return File(pickedFile.path);
//     }
//     return null;
//   }
//    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Future<UserCredential> signInWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       return await _firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException {
//       rethrow;
//     }
//   }

//   Future<UserCredential> signInWithGithub(context) async {
//     try {
//       GithubAuthProvider githubAuthProvider = GithubAuthProvider();
//       return await _firebaseAuth.signInWithProvider(githubAuthProvider);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<UserCredential> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
//       final GoogleSignInAuthentication gAuth = await gUser!.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: gAuth.accessToken,
//         idToken: gAuth.idToken,
//       );
//       return await _firebaseAuth.signInWithCredential(credential);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<void> wishListClicked(String id, bool status) async {
//     try {
//       if (status == true) {
//         await collectionReference.doc(id).update({
//           'wishlist': FieldValue.arrayUnion([
//             firebaseAuth.currentUser!.email ??
//                 firebaseAuth.currentUser!.phoneNumber
//           ])
//         });
//       } else {
//         await collectionReference.doc(id).update({
//           'wishlist': FieldValue.arrayRemove([
//             firebaseAuth.currentUser!.email ??
//                 firebaseAuth.currentUser!.phoneNumber
//           ])
//         });
//       }
//     } catch (e) {
//       log('got a error of :$e');
//     }
//   }

// }

class ProductService {
String collection = 'products';  
FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<ProductModel> collectionReference;
  Reference storage = FirebaseStorage.instance.ref();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final ImagePicker imagePicker = ImagePicker();

  ProductService() {
    collectionReference = firestore.collection(collection).withConverter<ProductModel>(
        fromFirestore: (snapshot, options) {
      return ProductModel.fromJson(snapshot.id, snapshot.data()!);
    }, toFirestore: (value, options) {
      return value.toJson();
    });
  }
  Future<void> addProduct(ProductModel data) async {
    try {
      await collectionReference.add(data);
    } catch (e) {
      log('Error adding product: $e');
      rethrow;
    }
  }

  // Future<List<ProductModel>> getAllProducts() async {
  //   try {
  //     final snapshot = await collectionReference.get();
  //     return snapshot.docs.map((doc) => doc.data()).toList().cast<ProductModel>();
  //   } catch (e) {
  //     log('Error getting all products: $e');
  //     return [];
  //   }
  // }
Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await collectionReference.get();

    return snapshot.docs.map((doc) => doc.data()).toList();
    
       

  }

  Future<void> isSold(String id) async {
    await collectionReference.doc(id).update({'isSold': true});
  }

  // Future<void> isWishListClick(String id, bool wishListStatus) async {
  //   try {
  //     if (wishListStatus == true) {
  //       await collectionReference.doc(id).update({
  //         'wishList': FieldValue.arrayUnion([
  //           _firebaseAuth.currentUser!.email ?? _firebaseAuth.currentUser!.phoneNumber
  //         ])
  //       });
  //     } else {
  //       await collectionReference.doc(id).update({
  //         'wishList': FieldValue.arrayRemove([
  //           _firebaseAuth.currentUser!.email ?? _firebaseAuth.currentUser!.phoneNumber
  //         ])
  //       });
  //     }
  //   } catch (e) {
  //     log('Error updating wishlist status: $e');
  //   }
  // }

  Future<void> updateMyProudct(String productId, ProductModel data) async {
    try {
      await collectionReference.doc(productId).update(data.toJson());
      log('Product updated successfully');
    } catch (e) {
      log('Error updating product: $e');
    }
  }

  Future<void> deleteMyProduct(String productId) async {
    try {
      await collectionReference.doc(productId).delete();
      log('Product deleted successfully');
    } catch (e) {
      log('Error deleting product: $e');
    }
  }

  Future<String> uploadImage(String imageName, File imageFile) async {
    Reference imageFolder = storage.child('productImage');
    Reference? uploadImage = imageFolder.child('$imageName.jpg');

    await uploadImage.putFile(imageFile);
    String downloadURL = await uploadImage.getDownloadURL();
    log('Image successfully uploaded to Firebase Storage.');
    return downloadURL;
  }

  Future<File?> pickImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  // Future<UserCredential> signInWithGithub(BuildContext context) async {
  //   try {
  //     GithubAuthProvider githubAuthProvider = GithubAuthProvider();
  //     return await _firebaseAuth.signInWithCredential(githubAuthProvider);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      return await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> wishListClicked(String id, bool status) async {
    try {
      if (status == true) {
        await collectionReference.doc(id).update({
          'wishlist': FieldValue.arrayUnion([
            firebaseAuth.currentUser!.email ?? firebaseAuth.currentUser!.phoneNumber
          ])
        });
      } else {
        await collectionReference.doc(id).update({
          'wishlist': FieldValue.arrayRemove([
            firebaseAuth.currentUser!.email ?? firebaseAuth.currentUser!.phoneNumber
          ])
        });
      }
    } catch (e) {
      log('got a error of :$e');
    }
  }
}
