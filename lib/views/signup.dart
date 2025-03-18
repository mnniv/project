import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

bool obscureText = true;

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Icon(
            Icons.home,
            size: 200,
          ),

          SizedBox(
            height: 30,
          ),
          //Name
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  hintText: 'Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),

          //Email
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              onChanged: (value) {},
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          )

          // Password
          ,
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              obscureText: obscureText,
              onChanged: (value) {},
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                hintText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),

          SizedBox(
            height: 12,
          ),

          //Button

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.075,
              child: Center(
                child: Text(
                  'Signup',
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
          )
          // SignPage
          ,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " have an account ?",
                style: TextStyle(color: Colors.grey.shade600,
                fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/Login');
                  
                },
                child: Text(
                  " Login",
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
