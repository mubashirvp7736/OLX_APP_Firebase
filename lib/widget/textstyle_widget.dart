import 'package:firebase2/controller/authentication_provider.dart';
import 'package:firebase2/view/authentication_screen/phone_auth.dart';
import 'package:flutter/material.dart';
import'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Widget textPoppins({data,color,}){
//   return Text(data,
//   style: GoogleFonts.poppins(
//     color: color,fontWeight: FontWeight.w800,fontSize: 20));
   
// }
Widget textPoppins({name, color, fontweight, double? fontsize}) {
  return Text(name,
      style: GoogleFonts.poppins(
          color: color, fontWeight: fontweight, fontSize: fontsize));
}

Widget textAbel({name, color, fontweight, double? fontsize}) {
  return Text(name,
      style: GoogleFonts.abel(
          color: color, fontWeight: fontweight, fontSize: fontsize));
}
//  Widget buildIcon(BuildContext context,{required String imageUrl,}) {
// //  final googleProvider= Provider.of<AuthenticatioController>(context,listen: false);
//     return SizedBox(
//       height: 30,
//       width: 30,
//       child: InkWell(
//         onTap: () => 
//          googleProvider.signInGoogle(),
//           // Handle icon tap,
//         child: CircleAvatar(
//           backgroundColor: Colors.white,
//           child: Image.network(
//             imageUrl,
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }
// Widget buildIcons(BuildContext context,{required String imageUrl,}) {
//     return SizedBox(
//       height: 30,
//       width: 30,
//       child: InkWell(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) =>MObileOtp(verificationId: '',) ,));
//         },
        
//         child: CircleAvatar(
//           backgroundColor: Colors.white,
//           child: Image.network(
//             imageUrl,
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
  // }
