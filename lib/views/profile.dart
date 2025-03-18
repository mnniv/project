import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
        ),
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: Column(children: [
            Text(
              'Bou9alwa',
              style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: screenWidth * 0.2,
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: ListTile(
                title: Text(
                  'Email :',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Emailaaa@gmai.com',
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: ListTile(
                title: Text(
                  'Phone :',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '06666666',
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: ListTile(
                title: Text(
                  'Number of Card :',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '10000289044788099',
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: ListTile(
                title: Text(
                  'Adress :',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '3rgoub - Touggourt',
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: screenWidth * 0.5,
                child: Center(
                  child: Text(
                    "Edit ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(17),
                  color: Colors.white,
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: screenWidth * 0.5,
                child: Center(
                  child: Text(
                    "Log out ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(17),
                  color: Colors.white,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
