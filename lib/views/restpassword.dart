import 'package:flutter/material.dart';

class Restpassword extends StatelessWidget {
  
  const Restpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              "Enter your Email : ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
