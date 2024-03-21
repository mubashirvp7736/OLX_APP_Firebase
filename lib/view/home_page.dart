import 'package:firebase2/controller/authentication_provider.dart';
import 'package:firebase2/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {

 HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final homeProvider=Provider.of<LoginProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     onPressed: (){
            
        //    homeProvider.Googl;
        //     }, icon:const Icon(Icons.logout))
        // ],
      
      ),
        drawer: MyDrawer(
          
          onSignOut:homeProvider .signOut,
        ),
      
       body:const Center(
        child: Text('Logged in',style: TextStyle(fontSize: 20),),
       ),
    );
  }
}