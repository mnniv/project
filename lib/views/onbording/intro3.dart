import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro3 extends StatelessWidget {
  const Intro3({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/card.json', height: screenHeight * 0.45),
          ListTile(
            title: const Text(
              'Digital Ticket',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'using a digital ticket , there is no more word last ticket',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
