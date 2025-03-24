import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/widget/flipcard.dart';
import 'package:test/widget/gridContainer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool mode = false;
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: ListTile(
                title: Text(
                  'Hello Mr',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('@hhhhh'),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Profile');
                  },
                  icon: Icon(
                    CupertinoIcons.person,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            mode = !mode;
                          });
                        },
                        icon: mode
                            ? Icon(
                                CupertinoIcons.moon,
                                size: 30,
                                color: Colors.black,
                              )
                            : Icon(
                                CupertinoIcons.sun_min,
                                size: 30,
                                color: Colors.black,
                              )),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(
                        Icons.qr_code_scanner,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/QR');
                      },
                    ),
                    SizedBox(width: 8),
                    Icon(
                      CupertinoIcons.settings,
                      size: 30,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            DigitalCard(),
            SizedBox(height: 10),
            Text(
              'OUR SERVICES',
              style: GoogleFonts.ptSerif(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(8.0),
                children: [
                  GridContainer(
                    title: 'Buy Ticket',
                    route: '/Buy',
                    icon: CupertinoIcons.ticket,
                  ),
                  GridContainer(
                    title: 'Map',
                    route: '',
                    icon: Icons.map,
                  ),
                  GridContainer(
                    title: 'Recharge Card',
                    route: '/Recharge',
                    icon: Icons.payment,
                  ),
                  GridContainer(
                    title: 'Buy Ticket',
                    route: '',
                    icon: Icons.access_alarms_sharp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
