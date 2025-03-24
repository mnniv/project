import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BuyTicket extends StatefulWidget {
  const BuyTicket({super.key});

  @override
  State<BuyTicket> createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  final TextEditingController _textController = TextEditingController();
  String _customTicketText =
      'Custom Ticket'; // Default text for the custom card

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
                _buildTicketCard('5 Tickets'),
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
            // Custom Buy Card
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150, // Set a fixed width for consistency
                    height: 200, // Set a fixed height for consistency
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
                          _customTicketText, // Display dynamic text
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
                ),
              ],
            ),
            // TextField for Custom Ticket Input
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 50, // Use full width
                child: TextField(
                  controller: _textController,
                  onChanged: (value) {
                    setState(() {
                      // Update the custom ticket text based on input
                      _customTicketText =
                          '$value Ticket${value == '1' ? '' : 's'}'; // Handle singular/plural
                    });
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: const InputDecoration(
                  
                    counterText: '', // Hide the counter text
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton(
                onPressed: () {
                  // Implement your buy ticket logic here
                  print("Buy button pressed for $_customTicketText");
                },
                child: Text(
                  'BUY',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketCard(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150, // Set a fixed width for consistency
        height: 200, // Set a fixed height for consistency
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
