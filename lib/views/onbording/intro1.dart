import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/ticket.json',
            ),
            ListTile(
              title: Text(
                'Validate your ticket by phone',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'You only need your phone to travel by tram.',
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
