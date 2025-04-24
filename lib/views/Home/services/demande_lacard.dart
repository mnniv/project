import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DemandeLacard extends StatelessWidget {
  const DemandeLacard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    TextEditingController numcard = TextEditingController();
    return SafeArea(
        child: Scaffold(
      appBar:
          AppBar(backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              title: Text(
                'Do you have a Digital Card ?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            LottieBuilder.asset('assets/card.json'),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Enter your card number : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      content: TextField(
                        controller: numcard,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        maxLength: 10,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 1.3,
                          )),
                          counterText: '',
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/Recharge');
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.4,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green.shade300,
                    ),
                    child: Center(
                      child: Text(
                        'Yes , i have ',
                        style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: const Text(
                        'You can order one from customer service or go to the company center .',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {
                            // Perform some action
                            Navigator.of(context).pop();
                            Navigator.pushNamed(
                                context, '/Home'); // Close the dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.4,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red.shade300,
                    ),
                    child: Center(
                      child: Text(
                        'No , i don\'t ',
                        style: TextStyle(
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
