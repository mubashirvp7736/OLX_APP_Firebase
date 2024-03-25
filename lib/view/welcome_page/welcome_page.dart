import 'package:firebase2/view/authentication_screen/login_page.dart';
import 'package:firebase2/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery=MediaQuery.of(context).size;
    return Scaffold(
      body:  Stack(
        children: [
          Image.asset("assets/full-shot-woman-online-shopping.jpg",
          fit: BoxFit.fill,height: mediaQuery.height* 1,),
          Positioned(
            bottom: 90,
            left: 190,
            child: ElevatedButton(
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(onTap: () {  },) ,));
            }, child: textPoppins(data: "Go to Login ->",),),
          )
        ]
      )
    );
  }
}