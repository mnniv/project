import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/ticket.json',
            ),
            ListTile(
              title: const Text(
                'Validate your ticket by phone',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'You only need your phone to travel by tram.',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w400,
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
