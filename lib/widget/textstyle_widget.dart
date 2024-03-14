import 'package:flutter/material.dart';
import'package:google_fonts/google_fonts.dart';

Widget textPoppins({data,color,}){
  return Text(data,
  style: GoogleFonts.poppins(
    color: color,fontWeight: FontWeight.w800,fontSize: 20));
   
}
 Widget buildIcon({required String imageUrl}) {
    return SizedBox(
      height: 30,
      width: 30,
      child: InkWell(
        onTap: () {
          // Handle icon tap
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
