
import 'package:firebase2/controller/product_provider.dart';
import 'package:firebase2/view/add_product.dart';
import 'package:firebase2/view/home_Screen.dart';
import 'package:firebase2/view/profile_page.dart';
import 'package:firebase2/view/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BottomScreen extends StatelessWidget {
  BottomScreen({super.key});

  List screens = [
    const HomeProduct(),
    const WishListScreen(),
    const AddProduction(),
    const SettingsScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvid>(
          builder: (context, value, child) => screens[value.currentIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(17),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Consumer<ProductProvid>(
            builder: (context, value, child) => BottomNavigationBar(
              unselectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              onTap: value.onTap,
              backgroundColor: const Color(0xFF00246B),
              currentIndex: value.currentIndex,
              selectedItemColor: const Color(0xFF30D5C8),
              unselectedItemColor: const Color(0xFFCADCFC),
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(color: Colors.black54),
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 25,
                  ),
                  label: 'ᴴᵒᵐᵉ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_outlined,
                    size: 25,
                  ),
                  label: 'ʷᶦˢʰˡᶦˢᵗ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 25,
                  ),
                  label: 'add',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 25,
                  ),
                  label: 'ˢᵉᵗᵗᶦⁿᵍˢ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}