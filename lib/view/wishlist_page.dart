// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase2/controller/product_provider.dart';
import 'package:firebase2/model/product_model.dart';
import 'package:firebase2/widget/home_widget.dart';
import 'package:firebase2/widget/textstyle_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPoppins(
                name: 'wishlist',
                fontsize: 25,
                fontweight: FontWeight.w600,
              ),
              Consumer<ProductProvid>(
                builder: (context, carProvider, child) {
                  final wishlistItems = checkUser(carProvider);
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: wishlistItems.length,
                    itemBuilder: (context, index) {
                      final item = wishlistItems[index];
                      return HomeProductContainer(
                        value: carProvider,
                        product: item,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ProductModel> checkUser(ProductProvid carProvider) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return [];
    }
    final user = currentUser.email ?? currentUser.phoneNumber;
    List<ProductModel> myCars = [];
    for (var car in carProvider.allProduct) {
      if (car.wishList.contains(user)) {
        myCars.add(car);
      }
    }
    return myCars;
  }
}