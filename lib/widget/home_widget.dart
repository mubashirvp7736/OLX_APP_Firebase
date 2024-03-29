
// import 'package:firebase2/controller/product_provider.dart';
// import 'package:firebase2/model/product_model.dart';
// import 'package:firebase2/widget/text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class HomeWidgets {
//   Widget specialProduct(Size size, {required String imagePath}) {
//     return Container(
//       width: size.width * .7,
//       height: size.width * .4,
//       decoration: BoxDecoration(
//         image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
//         color: const Color.fromARGB(255, 30, 29, 29),
//         borderRadius: BorderRadius.all(Radius.circular(size.width * .03)),
//       ),
//     );
//   }

//   Widget categoryItems(context, Size size,
//       {category, required String imagePath}) {
//     return GestureDetector(
//       onTap: () {},
//       //NavigatorWidget().push(
//           // context,
//           // CategoryPage(
//           //   category: category,
//           // )),)
//       //);
//       child: Container(
//         width: size.width * .2,
//         height: size.width * .2,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: NetworkImage(imagePath), fit: BoxFit.cover),
//           color: Colors.transparent,
//           borderRadius: BorderRadius.all(Radius.circular(size.width * .05)),
//         ),
//       ),
//     );
//   }

//   // Widget topBarIcon(Size size,
//   //     {required IconData icon, required String title}) {
//   //   return Column(
//   //     crossAxisAlignment: CrossAxisAlignment.center,
//   //     children: [
//   //       Container(
//   //         height: size.width * .15,
//   //         width: size.width * .15,
//   //         margin: const EdgeInsets.only(right: 15),
//   //         padding: const EdgeInsets.all(10),
//   //         decoration: BoxDecoration(
//   //           color: const Color.fromARGB(255, 223, 1, 1),
//   //           borderRadius: BorderRadius.circular(10),
//   //         ),
//   //         child: Icon(
//   //           icon,
//   //           color: Colors.black,
//   //           size: size.width * 0.06,
//   //         ),
//   //       ),
//   //       SizedBox(
//   //         width: size.width * .15,
//   //         child: Text(
//   //           title,
//   //           style: const TextStyle(fontWeight: FontWeight.w700),
//   //         ),
//   //       )
//   //     ],
//   //   );
//   // }

//   Widget buildProductItem(Size size, ProductProvid provider,
//       {List<ProductModel>? products}) {
//     final filterProduct =
//         products!.where((product) => product.isSold == false).toList();
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: size.width * 0.05,
//         crossAxisSpacing: size.width * 0.015,
//         childAspectRatio: size.width / (size.width * 1.5),
//       ),
//       itemBuilder: (context, index) {
//         final product = filterProduct[index];
//         return Stack(
//           children: [
//             GestureDetector(
//               // onTap: () => NavigatorWidget().push(
//               //   context,
//               //   ProductDetailsPage(
//               //     products: product,
//               //   ),
//               // ),
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: size.width * 0.42,
//                       width: size.width * 0.42,
//                       child: product.image!.isNotEmpty
//                           ? Image(
//                               fit: BoxFit.contain,
//                               image: NetworkImage(product.image!),
//                             )
//                           : Lottie.asset('assets/lottie/sellX logo.json'),
//                     ),
//                     const SizedBox(height: 10),
//                     TextWidgets().titleText2(context, text: product.title!),
//                     TextWidgets().SubtitleText(context, text: product.brand!),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextWidgets().titleText2(context,
//                             text: "₹${product.price.toString()}"),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             // Positioned(
//             //   right: 2,
//             //   bottom: 2,
//             //   child: IconsWidgets().IconButtonWidget(
//             //     context,
//             //     size,
//             //     iconData: provider.wishListCheck(product)
//             //         ? EneftyIcons.heart_outline
//             //         : EneftyIcons.heart_bold,
//             //     color: Colors.red,
//             //     onPressed: () async {
//             //       final value = await provider.wishListCheck(product);
//             //       provider.IsWishLIstClick(product.id, value);
//             //     },
//             //   ),
//             // ),
//           ],
//         );
//       },
//       itemCount: filterProduct.length,
//     );
//   }

//   // bool wishListCheck(ProductModel product) {
//   //   final user = FirebaseAuth.instance.currentUser;
//   //   if (user != null) {
//   //     final userEmail = user.email ?? user.phoneNumber;
//   //     if (product.wishList!.contains(userEmail)) {
//   //       return false;
//   //     } else {
//   //       return true;
//   //     }
//   //   }
//   //   return true;
//   // }

// }
import 'package:firebase2/controller/authentication_provider.dart';
import 'package:firebase2/controller/product_provider.dart';
import 'package:firebase2/model/product_model.dart';
import 'package:firebase2/widget/textstyle_widget.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class HomeProductContainer extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final ProductModel product;
  final ProductProvid value;

  const HomeProductContainer({
    super.key,
    required this.value,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //  final value=Provider.of<ProductProvid>(context);
    // final authProvider =
    //     Provider.of<AuthProvider>(context, listen: false);
    // final carProvider = Provider.of<ProductProvid>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.image??'no data'),
                ),
              ),
            ),
            SizedBox(height: size.height * .01),
        
            textPoppins(
                name: '₹${product.price} ',
                color: Colors.white,
                fontweight: FontWeight.w500,
                fontsize: 20),
             textPoppins(
                name: product.title, 
                color: Colors.white,
                fontweight: FontWeight.bold, fontsize: 16),
                SizedBox(height: 4,),
                textPoppins(
                name: product.place, 
                color: Colors.white,
                fontweight: FontWeight.bold, fontsize: 16),
           // SizedBox(height: size.height * .01),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              
              children: [
              
                     IconButton(
                        onPressed: () {
                         
                       final wish = value.wishListCheck(product);
                        value.wishlistClicked(product.id!, wish);
                      },
                      icon: value.wishListCheck(product)
                          ? const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                    )
              ],
            )
          ],
        ),
      ),
    );
  }
}