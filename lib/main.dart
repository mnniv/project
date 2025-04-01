import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/theme/themy.dart';
import 'package:test/views/Home/services/buy_ticket.dart';
import 'package:test/views/Home/homepage.dart';
import 'package:test/views/Home/services/customer_service.dart';
import 'package:test/views/Home/services/demande_lacard.dart';
import 'package:test/views/Home/services/map.dart';
import 'package:test/views/Home/services/qrcode_screen.dart';
import 'package:test/views/Home/services/recharge.dart';
import 'package:test/views/OTP/otp_page.dart';
import 'package:test/views/login.dart';
import 'package:test/views/onbording/onbording.dart';
import 'package:test/views/profile.dart';
import 'package:test/views/signup.dart';


void main() {
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
    _loadThemePreference(); // Load the saved theme preference
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = !isDarkMode; // Toggle the theme
    });
    await prefs.setBool('isDarkMode', isDarkMode); // Save the preference
  }

  void _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false; // Load the saved preference
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme, // Apply the theme
      home:MapPage(), // Pass the toggle function
      routes: {
        '/Home': (context) => Homepage(toggleTheme: toggleTheme), // Pass the toggle function
        '/Profile': (context) => Profile(),
        '/Buy': (context) => BuyTicket(),
        '/QR': (context) => QrcodeScreen(),
        '/Login': (context) => Login(),
        '/Signup': (context) => Signup(),
        '/Recharge': (context) => Recharge(),
        '/Customer': (context) => CustomerService(),
        '/Otp': (context) => OtpPage(toggleTheme: toggleTheme,),
        '/Demande': (context) => DemandeLacard(),
        '/Map': (context) => MapPage(),

      },
    );
  }
}