import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:test/views/Home/setting/settings.dart';
import 'package:test/widget/flipcard.dart';
import 'package:test/widget/gridContainer.dart';

class Homepage extends StatefulWidget {
  final Function toggleTheme;

  const Homepage({super.key, required this.toggleTheme});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isScanning = false;
  String _scanResult = "Scan a QR code";

  bool _isInServiceTime() {
    final now = TimeOfDay.now();
    final nowInMinutes = now.hour * 60 + now.minute;
    return nowInMinutes >= 300 && nowInMinutes <= 1320; // 5:00 AM to 10:00 PM
  }

  String _getServiceHoursText() {
    return "Service Hours: 5:00 AM - 10:00 PM";
  }

  void _showScanner(BuildContext context, String type) {
    setState(() {
      _isScanning = true;
      _scanResult = "Scanning ${type == 'card' ? 'card' : 'ticket'} QR code...";
    });

    // Ensure the controller is initialized only once

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Scan ${type == 'card' ? 'Card' : 'Ticket'}'),
          ),
          body: Container(),
        ),
      ),
    );
  }

  void _showPaymentOptions(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose your preferred way to pay',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Lottie.asset(
                'assets/card.json',
                width: 50,
                height: 50,
              ),
              title: Text(
                "Digital Card",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              subtitle: Text(
                "3007.80 \$",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                _showScanner(context, 'card');
              },
            ),
            ListTile(
              leading: Lottie.asset(
                'assets/Tickets.json',
                width: 50,
                height: 50,
              ),
              title: Text(
                "By Tickets",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              subtitle: Text(
                "12",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                _showScanner(context, 'ticket');
              },
            ),
            const SizedBox(height: 20),
            Text(
              _scanResult,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            if (_isScanning)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final isInService = _isInServiceTime();

    return SafeArea(
      child: Scaffold(
        endDrawer:  SettingsDrawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: ListTile(
                title: const Text(
                  'Gaggas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Profile');
                  },
                  icon: const Icon(
                    CupertinoIcons.person,
                    size: 40,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Theme.of(context).brightness == Brightness.dark
                            ? Icons.sunny
                            : CupertinoIcons.moon,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        widget.toggleTheme();
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.qr_code_scanner,
                        size: 30,
                      ),
                      onPressed: () => _showPaymentOptions(context),
                    ),
                    const SizedBox(width: 8),
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: const Icon(
                          CupertinoIcons.settings,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const DigitalCard(),
            const SizedBox(height: 10),
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
                children: const [
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: isInService ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(18),
                ),
                width: screenWidth * 0.95,
                height: screenHeight * 0.12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isInService
                              ? Icons.directions_transit
                              : Icons.directions_transit_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          isInService
                              ? "The Tram is in service"
                              : "The Tram is out of service",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _getServiceHoursText(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
