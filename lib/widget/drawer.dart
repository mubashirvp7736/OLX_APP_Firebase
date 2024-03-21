
import 'package:firebase2/widget/list_lite.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyDrawer extends StatelessWidget {
  // final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const MyDrawer({
    super.key,
    // this.onProfileTap,
    this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const DrawerHeader(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 64,
                ),
              ),
              MyListTile(
                icon: Icons.home,
                text: 'H O M E',
                onTap: () => Navigator.pop(context),
              ),
              // MyListTile(
              //   icon: Icons.person,
              //   text: 'P R O F I L',
              //   onTap: onProfileTap,
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListTile(
              icon: Icons.logout,
              text: 'L O G O U T',
              onTap: () async {
                await GoogleSignIn().signOut();
                FirebaseAuth.instance.signOut();

                onSignOut;
              },
            ),
          ),
        ],
      ),
    );
  }
}
