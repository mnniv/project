import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class DigitalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL, // default
        front: Card(
          color: Colors.grey.shade600,
          elevation: 8,
          child: Container(
            width: screenWidth * 0.77,
            height: screenHeight * 0.24,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  
                  title:Text(
                  'Name: العايش',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ) ,
                  subtitle: Text(
                  'N°: 1234 5678 9012 ',
                  style: TextStyle(fontSize: 16,
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.bold,),
                ) ,
                ),
                
                
               
                SizedBox(height: 20),
                Text(
                  'Credit: 5000 \$',
                  style: TextStyle(fontSize: 25,
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.bold,),
                ),
              ],
            ),
          ),
        ),
        back: Card(
          color: Colors.grey.shade600,

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
