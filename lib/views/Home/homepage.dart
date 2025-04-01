import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/widget/flipcard.dart';
import 'package:test/widget/gridContainer.dart';

class Homepage extends StatefulWidget {
  final Function toggleTheme;

  Homepage({super.key, required this.toggleTheme});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: ListTile(
                title: Text(
                  'Hello Mr',
                  style: TextStyle(
                    
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
                    
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        widget.toggleTheme(); 
                      },
                      icon: Icon(
                        // Use the theme state to determine the icon
                        Theme.of(context).brightness == Brightness.dark
                            ? CupertinoIcons.moon
                            : CupertinoIcons.sun_min,
                        size: 30,
                        
                      ),
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(
                        Icons.qr_code_scanner,
                        size: 30,
                       
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/QR');
                      },
                    ),
                    SizedBox(width: 8),
                    Icon(
                      CupertinoIcons.settings,
                      size: 30,
                     
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
                    route: '/Map',
                    icon: Icons.map,
                  ),
                  GridContainer(
                    title: 'Recharge Card',
                    route: '/Demande',
                    icon: Icons.payment,
                  ),
                  GridContainer(
                    title: 'Customer Service',
                    route: '/Customer',
                    icon: Icons.support_agent_rounded,
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