import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MObileOtp extends StatefulWidget {
  const MObileOtp({super.key});

  @override
  State<MObileOtp> createState() => _MObileOtpState();
}

class _MObileOtpState extends State<MObileOtp> {
 TextEditingController phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Auth"),
        centerTitle: true,
      ),
      body: Column(
        children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter phone Number",
              suffixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28)
              )
            ),
           ),
         ),
         SizedBox(height: 30,),
         ElevatedButton(onPressed: ()async{
         await FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted:(PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException ex) {
            
          },
           codeSent: ( String verificationId, int? resendtoken) {
             
           },
            codeAutoRetrievalTimeout:)
         }, child: Text("verify phone number"))
        ],
      ),
    );
  }
}