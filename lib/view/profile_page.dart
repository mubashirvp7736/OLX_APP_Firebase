import 'package:firebase2/controller/authentication_provider.dart';
import 'package:firebase2/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final homeProvider=Provider.of<LoginProvider>(context,listen:false);

    return Scaffold(
         appBar: AppBar(
          leading: IconButton(onPressed: (){
            homeProvider.signOut;
            homeProvider.googleSignOut();
             }, icon:Icon(Icons.exit_to_app)),
         ),
        
      body: 
    
    Text('Setting'));
  }
}