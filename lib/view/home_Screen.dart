// import 'package:firebase2/controller/product_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomeProduct extends StatefulWidget {
//   const HomeProduct({super.key});

//   @override
//   State<HomeProduct> createState() => _HomeProductState();
// }

// class _HomeProductState extends State<HomeProduct> {
//   final List<String> catorgoryName = [
//     'Mobile',
//     'Laptop',
//     'Smartwatch',
//     'Headphones',
//     'Camera',
//     'Mouse and Keyboard',
//     'Speaker',
//   ];
//    final List<String> catorgoryItems = [
//     'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Tablets._CB574550011_.png',
//     'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Gaming-laptops._CB574550011_.png',
//     'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Wearables._CB574550011_.png',
//     'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Headphones._CB574550011_.png',
//     'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Cameras._CB574550011_.png',
//     'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Computer-Accessories._CB574550011_.png',
//     'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Soundbars._CB574550011_.png'
//   ];

//   @override
//   void initState() {
//     Provider.of<ProductProvid>(context,listen: false);
  
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     final getAuthPrv=Provider.of<ProductProvid>(context,listen:false);
//     return  Scaffold(
//       appBar: AppBar(
//         toolbarHeight: size.width * .2,
//         leading: Container(
//           width: 40,
//           height: 40,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Image(
//               color: Colors.white,
//               image: AssetImage(
//                 'assets/icons/sellx logo.png',
//               ),
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//         title: SizedBox(
//           width: size.width * .6,
//           child: TextFormField(
//             onChanged: (value) {
//               getAuthPrv.searchFilter(value);
//             },
//             decoration: InputDecoration(
//               hintText: "Search",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(25.0),
//                 borderSide: BorderSide.none,
//               ),
//               filled: true,
//               fillColor: Colors.grey[200],
//               contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
//             ),
//           ),
//         ),
//         actions: [
//           // IconButton(
//           //  // icon: const Icon(EneftyIcons.heart_outline),
//           //   //onPressed: () {
//           //     NavigatorWidget().push(context, WishlistPage());
//           // //  },
//           // ),
//         ],
//         // backgroundColor: Colors.white,
//       ),
//       body:Column(
//         children: [
       
          
//         ],
//       )
    
//     );
//   }
// }
import 'package:firebase2/controller/product_provider.dart';
import 'package:firebase2/view/details_screen.dart';
import 'package:firebase2/widget/home_widget.dart';
import 'package:firebase2/widget/search_textform.dart';
import 'package:firebase2/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    final getproductPrv = Provider.of<ProductProvid>(context, listen: false);
    Provider.of<ProductProvid>(context,listen: false).getAllProducts();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF00246B),
        toolbarHeight: 170,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textPoppins(
                    name: 'Find Your Perfect',
                    color: const Color(0xFFCADCFC),
                    fontsize: 25,
                    fontweight: FontWeight.w700),
           
            const SizedBox(height: 10),
            searchTextFormField(
                onChanged: (value) =>
                    getproductPrv.searchFilter(getproductPrv.searchController.text),
                controller: getproductPrv.searchController),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ProductProvid>(
                builder: (context, productValue, child) {
               //   productValue.getAllProducts();
                  if (productValue.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (productValue.searchedList.isEmpty &&
                      productValue.searchController.text.isNotEmpty) {
                    return Center(
                        child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            // Lottie.asset('assets/no available cars.json'),
                            textPoppins(name: 'SEARCHED PRODUCT IS NOT AVAILABLE')
                          ],
                        ),
                      ),
                    ));
                  } else if (productValue.searchedList.isEmpty) {
                    if (productValue.allProduct.isNotEmpty) {
                      final allCar = productValue.allProduct;
                      return GridView.builder(
                        gridDelegate: gridDelegate(size.width * 0.0018),
                        itemCount: allCar.length,
                        itemBuilder: (context, index) {
                          final products = allCar[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CarDetailsScreen(
                                    title: products.title,
                                    description: products.description,
                                    category: products.category,
                                    price: products.price,
                                    image: NetworkImage(products.image.toString()),
                                    //date: products.date,
                                  ),
                                ),
                              );
                            },
                            child: HomeProductContainer(
                              value: getproductPrv,
                              product: products,
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: textAbel(
                            name: 'NO CARS ADDED',
                            fontsize: 20,
                            fontweight: FontWeight.w700),
                      );
                    }
                  } else {
                    return GridView.builder(
                      gridDelegate: gridDelegate(size.width * 0.0018),
                      itemCount: productValue.searchedList.length,
                      itemBuilder: (context, index) {
                        final car = productValue.searchedList[index];

                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CarDetailsScreen(),
                                ),
                              );
                            },
                            child: HomeProductContainer(
                              value: getproductPrv,
                              product: car,
                            ));
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: authProvider.isAdminHome
      //     ? FloatingActionButton.extended(
      //         onPressed: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const AdminAddDataScreen()));
      //         },
      //         label: textPoppins(
      //             name: 'ADD CAR',
      //             color: const Color(0xFFCADCFC),
      //             fontweight: FontWeight.w700),
      //         backgroundColor: const Color(0xFF00246B),
      //       )
      //     : null, 
          );
  }
}
