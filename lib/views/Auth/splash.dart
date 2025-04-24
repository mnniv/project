import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/views/Home/homepage.dart';
import 'package:test/views/Auth/login.dart';

class SplashCheck extends StatefulWidget {
  final Function toggleTheme;

  const SplashCheck({super.key, required this.toggleTheme});

  @override
  State<SplashCheck> createState() => _SplashCheckState();
}

class _SplashCheckState extends State<SplashCheck> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final seenOnboarding = prefs.getBool('onboardingSeen') ?? false;

    await Future.delayed(const Duration(seconds: 2)); // splash wait

    final user = FirebaseAuth.instance.currentUser;

    if (!seenOnboarding) {
      Navigator.pushReplacementNamed(context, '/Onbording');
    } else if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Homepage(toggleTheme: widget.toggleTheme)),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png", width: 150, height: 150),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
