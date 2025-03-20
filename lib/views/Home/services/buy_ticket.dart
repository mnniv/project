import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BuyTicket extends StatefulWidget {
  const BuyTicket({super.key});

  @override
  State<BuyTicket> createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
        ),
        backgroundColor: Colors.grey.shade300,
        body: ListView(
          children: [
            ListTile(
              title: const Text(
                'Fast Buy',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTicketCard('1 Ticket'),
                _buildTicketCard('5 Ticket'),
              ],
            ),
           ListTile(
              title: const Text(
                'Custom Buy',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
           Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Custom',
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Lottie.asset(
              'assets/tram.json',
              height: 135,
            ),
            Container(
              width: 50,
              child: TextField(
                onChanged: (value) {
                  
                },
                keyboardType: TextInputType.number,
                maxLength: 1,
                 decoration: const InputDecoration(
                labelText: '00',
                counterText: '', // Hide the counter text
                border: OutlineInputBorder(),
              ),
              ),
            ),
            SizedBox(height: 10,),
            TextButton(onPressed: (){}, child: Text(
              'BUY',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ))
          ],
        ),
      ),
    )
          ],
        ),
      ),
    );
  }

  Widget _buildTicketCard(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Lottie.asset(
              'assets/tram.json',
              height: 135,
            ),
          ],
        ),
      ),
    );
  }
}
