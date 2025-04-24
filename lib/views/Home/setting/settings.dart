import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/views/Home/setting/History.dart';
import 'package:test/views/Home/setting/info.dart';
import 'package:test/widget/Ltile.dart';
import 'package:test/views/Home/setting/notification.dart';
import 'package:test/views/Home/setting/Feedback.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsDrawer extends StatelessWidget {
   SettingsDrawer({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Function to log out the user
  Future<void> _logout(BuildContext context) async {
    try {
      // Sign out from Firebase
      await _auth.signOut();

      // Sign out from Google if the user is signed in via Google
      await _googleSignIn.signOut();

      // Navigate to the Login screen after logging out
      Navigator.pushReplacementNamed(context, '/Login');
    } catch (e) {
      print("Error during logout: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error logging out. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            // User Profile Section
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              accountName: Text(
                "Gaggas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              accountEmail: Text(
                "Gaggas@example.com",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Icon(
                  CupertinoIcons.person,
                  size: 40,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),

            // Settings Title
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize:
                        24, // Slightly reduced from 30 for better proportion
                  ),
                ),
              ),
            ),

            // Settings Options
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                children: [
                  const SizedBox(height: 8.0),
                  LTile(
                    icon: CupertinoIcons.person,
                    name: 'Profile',
                    route: '/Profile',
                  ),
                  const Divider(height: 1, thickness: 0.5),
                  ListTile(
                    leading: const Icon(CupertinoIcons.bell),
                    title: const Text('Notifications'),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Notifications()),
                      );
                    },
                  ),
                  const Divider(height: 1, thickness: 0.5),
                  LTile(
                    icon: CupertinoIcons.gift,
                    name: 'Coupons',
                    route: '/Recharge',
                  ),
                  const Divider(height: 1, thickness: 0.5),
                  ListTile(
                    leading: const Icon(CupertinoIcons.clock),
                    title: const Text('History'),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const History()),
                      );
                    },
                  ),
                  const Divider(height: 1, thickness: 0.5),
                  ListTile(
                    leading: const Icon(CupertinoIcons.paperplane),
                    title: const Text('Feedback'),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FeedbackScreen()),
                      );
                    },
                  ),
                  const Divider(height: 1, thickness: 0.5),
                  ListTile(
                    leading: const Icon(CupertinoIcons.info),
                    title: const Text('About Us'),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Info()),
                      );
                    },
                  ),
                  const Divider(height: 1, thickness: 0.5),
                ],
              ),
            ),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                tileColor: Colors.red.withOpacity(0.1),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer first
                  _logout(context); // Call the logout function
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
