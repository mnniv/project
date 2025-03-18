import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
   
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/map.json', height: screenHeight * 0.4),
          ListTile(
            title: Text(
              'Plan Your Trip',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'You can explore the locations of tram stations and easily plan your trip.',
              style: TextStyle(
                color: Colors.grey.shade900,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
