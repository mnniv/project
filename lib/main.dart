import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/theme/themy.dart';
import 'package:test/views/Auth/restpassword.dart';
import 'package:test/views/Auth/splash.dart';
import 'package:test/views/Home/services/buy_ticket.dart';
import 'package:test/views/Home/homepage.dart';
import 'package:test/views/Home/services/customer_service.dart';
import 'package:test/views/Home/services/demande_lacard.dart';
import 'package:test/views/Home/services/map.dart';
import 'package:test/views/Home/services/recharge.dart';
import 'package:test/views/Auth/login.dart';
import 'package:test/views/Home/services/profile.dart';
import 'package:test/views/Auth/signup.dart';
import 'package:test/views/onbording/onbording.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = !isDarkMode;
    });
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  void _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: SplashCheck(toggleTheme: toggleTheme),
      routes: {
        '/Onbording': (context) => const Onbording(),
        '/Home': (context) => Homepage(toggleTheme: toggleTheme),
        '/Profile': (context) => const Profile(),
        '/Buy': (context) => const BuyTicket(),
        '/Login': (context) => const Login(),
        '/Signup': (context) => const Signup(),
        '/Recharge': (context) => const Recharge(),
        '/Customer': (context) => const CustomerService(),
        '/Demande': (context) => const DemandeLacard(),
        '/Map': (context) => const MapPage(),
        '/RestP': (context) => const Restpassword(),
      },
    );
  }
}
