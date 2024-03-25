import 'package:firebase2/controller/authentication_provider.dart';
import 'package:firebase2/view/add_product.dart';
import 'package:firebase2/view/home_Screen.dart';
import 'package:firebase2/view/profile_page.dart';
import 'package:firebase2/view/wishlist_page.dart';
import 'package:firebase2/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class BottomPage extends StatefulWidget {

 BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int selectIndex=0;
  List screens=const[
    HomeProduct(),
    WishList(),
    AddProduction(),
    SettingScreen()

  ];
   void selectedItem(int index){
    setState(() {
          selectIndex=index;

    });

   }
  @override
  Widget build(BuildContext context) {
    final homeProvider=Provider.of<LoginProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title:const Text('home'),
      ),
        drawer: MyDrawer(
          
          onSignOut:homeProvider .signOut,
        ),
          bottomNavigationBar:
       BottomNavigationBar(
        // selectedItemColor: ,
        items:const [
         BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home',backgroundColor: Colors.black),
         BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label:"favorite",backgroundColor: Colors.black),
         BottomNavigationBarItem(icon: Icon(Icons.add),label: "add",backgroundColor: Colors.black),
         BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account',backgroundColor: Colors.black),
         
       ],
       onTap:selectedItem ,
       backgroundColor: Colors.black,
       currentIndex:selectIndex,
       ),
      
       body:Center(child: screens.elementAt(selectIndex),)
     
    );
  }
}