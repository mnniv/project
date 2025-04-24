import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Restpassword extends StatefulWidget {
  const Restpassword({super.key});

  @override
  State<Restpassword> createState() => _RestpasswordState();
}

class _RestpasswordState extends State<Restpassword> {
  final TextEditingController restemailcontroller = TextEditingController();
  final Rest = FirebaseAuth.instance;
  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              "Enter your Email : ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 55,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: restemailcontroller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                hintText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              try {
                final remail = restemailcontroller.text.trim();
                await Rest.sendPasswordResetEmail(email: remail);
              } catch (e) {
                print(e.toString());
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.075,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
            ),
          )
        ],
      ),
    ));
  }
}
