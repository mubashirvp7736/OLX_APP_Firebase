
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget searchTextFormField({controller, onChanged}) {
  return TextFormField(
    onChanged: onChanged,
    controller: controller,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: 'Search...',
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFCADCFC)),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFCADCFC)),
        borderRadius: BorderRadius.circular(30),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      suffixIcon: const Icon(
        Icons.search,
        color: Colors.white,
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