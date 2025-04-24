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
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text('Buy Ticket'), // Added title for better UX
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0), // Add padding for better spacing
          children: [
            const ListTile(
              title: Text(
                'Quick Purchase',
                style: TextStyle(
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
            const ListTile(
              title: Text(
                'Custom Purchase',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Custom Buy Card
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: screenWidth *
                    0.9, // Use a percentage of screen width for responsiveness
                height: 250, // Set a fixed height for consistency
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _customTicketText, // Display dynamic text
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Lottie.asset(
                            'assets/tram.json',
                            height: 135,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            color: Colors.blue,
                            onPressed: () {
                              print(
                                  "Buy button pressed for $_customTicketText");
                              _textController.clear();
                            },
                            child: Text(
                              'BUY',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        width:
                            16), // Add some space between the column and the TextField
                    SizedBox(
                      width: 80, // Set a fixed width for the TextField
                      child: TextField(
                        controller: _textController,
                        onChanged: (value) {
                          setState(() {
                            _customTicketText =
                                '$value Ticket${value == '1' ? '' : 's'}'; // Handle singular/plural
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        decoration: const InputDecoration(
                          counterText: '',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketCard(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 130,
        height: 200,
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
                color: Colors.black,
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
