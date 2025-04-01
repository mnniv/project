import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerService extends StatelessWidget {
  const CustomerService({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar:
          AppBar(backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Icon(
            CupertinoIcons.headphones,
            size: 70,
            color: const Color.fromARGB(255, 77, 199, 140),
          ),
          SizedBox(
            height: 25,
          )
          //ListTile
          ,
          ListTile(
            title: Center(
              child: Text(
                'How can we help you ?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          )
          //Container contact
          ,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              onTap: () {},
              shape: Border.all(
                color: Color.fromARGB(255, 77, 199, 140),
                width: 1.3,
              ),
              tileColor: Colors.green.shade100,
              leading: Icon(
                CupertinoIcons.headphones,
                size: 35,
                color: Color.fromARGB(255, 77, 199, 140),
              ),
              title: Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(
                CupertinoIcons.chevron_forward,
                color: Color.fromARGB(255, 77, 199, 140),
              ),
            ),
          )

          // send us email
          ,
          SizedBox(
            height: 35,
          ),
          Icon(
            CupertinoIcons.envelope,
            size: 50,
            color: const Color.fromARGB(255, 77, 199, 140),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Send us an-email',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 17,
            ),
          ),

          Text(
            'Sitram@gmail.com',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ));
  }
}
