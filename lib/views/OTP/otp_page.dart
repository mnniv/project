import 'package:flutter/material.dart';
import 'package:test/views/Home/homepage.dart';

class OtpPage extends StatefulWidget {
  final Function toggleTheme; // Add this line

  const OtpPage({super.key, required this.toggleTheme}); // Update constructor

  @override
  State<OtpPage> createState() => _Otp1State();
}

class _Otp1State extends State<OtpPage> {
  String pin1 = '';
  String pin2 = '';
  String pin3 = '';
  String pin4 = '';
  final String expectedOTP = '1234';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
        ),
       
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // image
              Image.asset(
                'assets/otp.png',
                height: screenHeight * 0.4,
                width: screenWidth * 0.9,
              ),
              // title
              Text(
                'OTP Verification',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              // message
              Text(
                'Enter the OTP sent to your mobile number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 35),
              // Text Field
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPinField((value) => pin1 = value),
                  _buildPinField((value) => pin2 = value),
                  _buildPinField((value) => pin3 = value),
                  _buildPinField((value) => pin4 = value),
                ],
              ),
              // didn't receive
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t receive the OTP?',
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    child: Text(
                      ' Resend OTP',
                      style: TextStyle(
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              // button
              GestureDetector(
                onTap: () {
                  String otp = pin1 + pin2 + pin3 + pin4;

                  if (otp == expectedOTP) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homepage(toggleTheme: widget.toggleTheme), // Pass the toggleTheme function
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid OTP, please try again")),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.075,
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinField(ValueChanged<String> onChanged) {
    return SizedBox(
      width: 68,
      height: 64,
      child: TextFormField(
        onChanged: (value) {
          onChanged(value);
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: '0',
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}