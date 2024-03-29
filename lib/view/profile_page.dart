import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ), 
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Edit Profile'),
              leading: Icon(Icons.account_circle),
              onTap: () {
                // Navigate to Edit Profile screen
              },
            ),
            ListTile(
              title: Text('Change Password'),
              leading: Icon(Icons.lock),
              onTap: () {
                // Navigate to Change Password screen
              },
            ),
            Divider(),
            Text(
              'App Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Notifications'),
              leading: Icon(Icons.notifications),
              onTap: () {
                // Navigate to Notifications screen
              },
            ),
            ListTile(
              title: Text('Privacy Policy'),
              leading: Icon(Icons.security),
              onTap: () {
                // Navigate to Privacy Policy screen
              },
            ),
            ListTile(
              title: Text('Terms & Conditions'),
              leading: Icon(Icons.description),
              onTap: () {
                // Navigate to Terms & Conditions screen
              },
            ),
            Divider(),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                // Perform logout action
              },
            ),
          ],
        ),
      ),
    );
  }
}
