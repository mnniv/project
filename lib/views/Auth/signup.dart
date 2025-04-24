import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

bool obscureText = true;

class _SignupState extends State<Signup> {
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController passwordcontroler = TextEditingController();
  final Auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                "assets/logo.png",
                width: 200,
                height: screenHeight * 0.22,
                fit: BoxFit.contain,
              ),

              const SizedBox(
                height: 25,
              ),
              //Name
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                      ),
                      hintText: 'Name',
                      filled: true,
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),

              //Email
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  controller: emailcontroler,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                      ),
                      hintText: 'Email',
                      filled: true,
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
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
                  controller: passwordcontroler,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                    hintText: 'Password',
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //Button

              GestureDetector(
                onTap: () async {
                  try {
                    final email = emailcontroler.text
                        .trim(); // Use .text to get the value
                    final password = passwordcontroler.text
                        .trim(); // Use .text to get the value

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill all fields')),
                      );
                      return;
                    }

                    // ignore: unused_local_variable
                    final userCredential =
                        await Auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    Navigator.pushNamed(context, '/Login');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${e.toString()}')),
                    );
                    print('Signup error: $e');
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        'Register',
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
              // SignPage
              ,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You already have an account ?",
                    style: TextStyle(
                        color: Colors.grey.shade600,
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
              ),
              SizedBox(
                height: 20,
              ),
              Text("__________ Or SignIN with __________"),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    final GoogleSignInAccount? googleUser =
                        await _googleSignIn.signIn();
                    if (googleUser == null) return;

                    final GoogleSignInAuthentication googleAuth =
                        await googleUser.authentication;

                    final credential = GoogleAuthProvider.credential(
                      accessToken: googleAuth.accessToken,
                      idToken: googleAuth.idToken,
                    );

                    await Auth.signInWithCredential(credential);
                  } catch (e) {
                    print('Error during Google sign-in: $e');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  height: screenHeight * 0.118,
                  width: screenWidth * 0.25,
                  child: Image.asset('assets/google.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
