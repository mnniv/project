import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:google_fonts/google_fonts.dart';

class DigitalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL, // default
        front: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          color: Colors.black.withOpacity(0.85),
          elevation: 8,
          child: Container(
            width: screenWidth * 0.77,
            height: screenHeight * 0.24,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' \$ 3009.34 ',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25),
                ListTile(
                  title: Text(
                    'SITRAM',
                    style: GoogleFonts.ptSerif(
                color: Colors.grey.shade300,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
                  ),
                  subtitle: Text(
                    'N°: 1234 5678 9012 ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Image.asset('assets/logo.png'),
                ),
              ],
            ),
          ),
        ),
        back: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          color: Colors.black.withOpacity(0.85),
          elevation: 8,
          child: Container(
            width: screenWidth * 0.77,
            height: screenHeight * 0.24,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/logo.png'), // Replace with your tramway image URL
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
