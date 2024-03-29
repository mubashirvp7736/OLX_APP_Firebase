
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget searchTextFormField({controller, onChanged, onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: TextFormField(
      onChanged: onChanged,
      controller: controller,
      style: const TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        fillColor: Colors.black26,
        hintText: 'Find cars, Mobile Phones, and more...',
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFCADCFC)),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(50),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            // Handle tapping on the camera icon
            print('Camera Icon Tapped');
          },
          child: Icon(
            Icons.camera_alt,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}

SliverGridDelegateWithFixedCrossAxisCount gridDelegate(childAspectRatio) {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: childAspectRatio,
  );
}
Widget carDetailsText({String? value, double? fontsize, fontWeight, color}) {
  return Row(
    children: [
      Text(
        value!,
        style: GoogleFonts.poppins(
            fontSize: fontsize,
            fontWeight: fontWeight,
            color: color ?? Colors.black,
            letterSpacing: 1),
      ),
    ],
  );
}