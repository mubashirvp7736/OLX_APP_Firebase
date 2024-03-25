import 'package:flutter/material.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.shopping_bag_sharp,color: Colors.black,),
      ),
      body:Column(
        children: [
          
        ],
      )
    
    );
  }
}