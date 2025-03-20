import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test/views/Home/services/buy_ticket.dart';
import 'package:test/views/Home/homepage.dart';
import 'package:test/views/Home/services/qrcode_screen.dart';
import 'package:test/views/login.dart';
import 'package:test/views/onbording/onbording.dart';
import 'package:test/views/profile.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onbording(),
     
      routes: {
        '/Home': (context) => Homepage(),
        '/Profile': (context) => Profile(),
        '/Buy': (context) => BuyTicket(),
        '/QR': (context) => QrcodeScreen(),
        '/Login': (context) => Login(),


        

      },
    );
  }
}
