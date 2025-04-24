import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/widget/flipcard.dart';

class Baridimob extends StatefulWidget {
  const Baridimob({super.key});

  @override
  State<Baridimob> createState() => _BaridimobState();
}

class _BaridimobState extends State<Baridimob> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DigitalCard(),
            ListTile(
              title: Text(
                'Pay with : ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      width: 0.5,
                    )),
                leading: Image.asset('assets/Barid.png'),
                trailing: const Icon(CupertinoIcons.chevron_forward),
                title: Text(
                  'Al-Dahabiya',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'How much  : ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.35,
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  Pay(
                    money: '100 DA',
                  ),
                  Pay(
                    money: '200 DA',
                  ),
                  Pay(
                    money: '500 DA',
                  ),
                  Pay(
                    money: '1000 DA',
                  ),
                  Pay(
                    money: '2000 DA',
                  ),
                  Pay(
                    money: '4000 DA',
                  ),
                ],
              ),
            ),
            SizedBox(
              width: screenWidth * 0.5,
              height: screenHeight * 0.07,
              child: MaterialButton(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/Recharge');
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Pay extends StatelessWidget {
  String money;
  Pay({
    super.key,
    required this.money,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: MaterialButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {},
        child: Text(
          money,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
