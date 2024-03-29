
import 'package:firebase2/controller/product_provider.dart';
import 'package:firebase2/view/details_screen.dart';
import 'package:firebase2/widget/home_widget.dart';
import 'package:firebase2/widget/search_textform.dart';
import 'package:firebase2/widget/tabs_widget.dart';
import 'package:firebase2/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class HomeProduct extends StatefulWidget {
//   const HomeProduct({Key? key}) : super(key: key);

//   @override
//   State<HomeProduct> createState() => _HomeProductState();
// }

// class _HomeProductState extends State<HomeProduct> {
//   @override
//   Widget build(BuildContext context) {
//     Provider.of<ProductProvid>(context,listen: false).getAllproduct();

//     Size size=MediaQuery.of(context).size;
//     final getproductPrv = Provider.of<ProductProvid>(context, listen: false);

//     return SafeArea(
//       child: Scaffold(
//          // backgroundColor: Color.fromARGB(255, 236, 238, 241),
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//          // backgroundColor: const Color(0xFF00246B),
//           toolbarHeight: 110,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // const SizedBox(height: 10),
//               searchTextFormField(
//                   onChanged: (value) =>
//                       getproductPrv.searchFilter(getproductPrv.searchController.text),
//                   controller: getproductPrv.searchController),
//             ],
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//                textPoppins(name: "categories",color: Colors.black,fontweight:FontWeight.bold,fontsize: 15 ),
//                SizedBox(height: 18,),
//              SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 //padding: ,
//                 child:
//                   Wrap(
//               spacing: 20, // Spacing between categories
//               runSpacing: 10, // Spacing between rows of categories
//               children: [
//                 CategoryCard(
//                   category: 'Electronics',
//                   icon: Icons.phone_android,
//                 ),
//                 CategoryCard(
//                   category: 'Clothing',
//                   icon: Icons.shopping_bag,
//                 ),
//                 CategoryCard(
//                   category: 'Books',
//                  icon: Icons.menu_book,
//                 ),
//                  CategoryCard(
//                   category: 'Bikes',
//                   icon: Icons.directions_bike, // Icon for Bikes
//                 ),
//                  CategoryCard(
//                   category: 'Kitchen ',
//                   icon: Icons.kitchen, // Icon for Kitchen Things
//                 ),
//                 // Add more CategoryCard widgets for other categories
//               ],
//             ),
//                 ),
//         SizedBox(height: 18,),
//                 textPoppins(name: 'Best Selling',color: Colors.black,fontweight:FontWeight.bold,fontsize: 15 ),
    
//               Expanded(
//                 child: Consumer<ProductProvid>(
//                   builder: (context, productValue, child) {
//                 // productValue.getAllProducts();
//                     if (productValue.isLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (productValue.searchedList.isEmpty &&
//                         productValue.searchController.text.isNotEmpty) {
//                       return Center(
//                           child: Center(
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: Column(
//                             children: [
//                               // Lottie.asset('assets/no available cars.json'),
//                               textPoppins(name:'SEARCHED PRODUCT IS NOT AVAILABLE')
//                             ],
//                           ),
//                         ),
//                       ));
//                     } else if (productValue.searchedList.isEmpty) {
//                     if (productValue.allProduct.isNotEmpty) {
//                       final allCar = productValue.allProduct;
//                       return GridView.builder(
//                         gridDelegate: gridDelegate(size.width * 0.0018),
//                         itemCount: allCar.length,
//                         itemBuilder: (context, index) {
//                           final products = allCar[index];
//                           return GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => CarDetailsScreen(
//                                     title: products.title,
//                                     description: products.description,
//                                     category: products.category,
//                                     price: products.price,
//                                     image: NetworkImage(products.image.toString()),
//                                     //date: products.date,
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: HomeProductContainer(
//                               value: getproductPrv,
//                               product: products,
//                             ),
//                           );
//                         },
//                       );
//                     } else {
//                       return Center(
//                         child: textAbel(
//                             name: 'NO CARS ADDED',
//                             fontsize: 20,
//                             fontweight: FontWeight.w700),
//                       );
//                     }
//                   } else {
//                     return GridView.builder(
//                       gridDelegate: gridDelegate(size.width * 0.0018),
//                       itemCount: productValue.searchedList.length,
//                       itemBuilder: (context, index) {
//                         final car = productValue.searchedList[index];

//                         return GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       const CarDetailsScreen(),
//                                 ),
//                               );
//                             },
//                             child: HomeProductContainer(
//                               value: getproductPrv,
//                               product: car,
//                             ));
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//             ),
//     );
//   }
// }
class HomeProduct extends StatelessWidget {
  const HomeProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final getproductPrv = Provider.of<ProductProvid>(context, listen: false);
        // Provider.of<ProductProvid>(context, listen: false).getAllproduct();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 110,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchTextFormField(
                onChanged: (value) => getproductPrv.searchFilter(getproductPrv.searchController.text),
                controller: getproductPrv.searchController,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPoppins(name: "categories", color: Colors.black, fontweight: FontWeight.bold, fontsize: 15),
              SizedBox(height: 18,),
          const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: [
                    CategoryCard(
                      category: 'Electronics',
                      icon: Icons.phone_android,
                    ),
                    CategoryCard(
                      category: 'Clothing',
                      icon: Icons.shopping_bag,
                    ),
                    CategoryCard(
                      category: 'Books',
                      icon: Icons.menu_book,
                    ),
                    CategoryCard(
                      category: 'Bikes',
                      icon: Icons.directions_bike,
                    ),
                    CategoryCard(
                      category: 'Kitchen',
                      icon: Icons.kitchen,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18,),
              textPoppins(name: 'Best Selling', color: Colors.black, fontweight: FontWeight.bold, fontsize: 15),
              Expanded(
                child: Consumer<ProductProvid>(
                  
                  builder: (context, productValue, child) {

                    if (productValue.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else 
                    if (productValue.searchedList.isEmpty &&
                        productValue.searchController.text.isNotEmpty) {
                      return Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              textPoppins(name: 'SEARCHED PRODUCT IS NOT AVAILABLE')
                            ],
                          ),
                        ),
                      );
                    } else if (productValue.searchedList.isEmpty) {
                      if (productValue.allProduct.isNotEmpty) {
                        final allProducts = productValue.allProduct;
                        return GridView.builder(
                          gridDelegate: gridDelegate(size.width * 0.0018),
                          itemCount: allProducts.length,
                          itemBuilder: (context, index) {
                            final product = allProducts[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CarDetailsScreen(
                                      title: product.title,
                                      description: product.description,
                                      category: product.category,
                                      price: product.price,
                                      image: NetworkImage(product.image.toString()),
                                    ),
                                  ),
                                );
                              },
                              child: HomeProductContainer(
                                value: getproductPrv,
                                product: product,
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: textAbel(
                            name: 'NO PRODUCTS ADDED',
                            fontsize: 20,
                            fontweight: FontWeight.w700,
                          ),
                        );
                      }
                    } else {
                      return GridView.builder(
                        gridDelegate: gridDelegate(size.width * 0.0018),
                        itemCount: productValue.allProduct.length,
                        itemBuilder: (context, index) {
                          final product = productValue.allProduct[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CarDetailsScreen(),
                                ),
                              );
                            },
                            child: HomeProductContainer(
                              value: getproductPrv,
                              product: product,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

