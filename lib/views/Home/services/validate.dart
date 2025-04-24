import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class QRValidationSuccessPage extends StatelessWidget {
  final DateTime validationTime;
  final String validationType;
  final double? amount;
  final int? tickets;

  const QRValidationSuccessPage({
    super.key,
    required this.validationTime,
    required this.validationType,
    this.amount,
    this.tickets,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.green[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Icon with animation
              Lottie.asset(
                'assets/success.json',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              
              // Success Message
              Text(
                validationType == 'card' 
                  ? 'Card Validated Successfully!'
                  : 'Ticket Validated Successfully!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.green[300] : Colors.green[800],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              
              // Validation Details Card
              Card(
                color: isDarkMode ? Colors.grey[800] : Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Validation Type
                      _buildDetailRow(
                        icon: validationType == 'card' 
                          ? Icons.credit_card 
                          : Icons.confirmation_number,
                        label: 'Type',
                        value: validationType == 'card' ? 'Digital Card' : 'Ticket',
                        isDarkMode: isDarkMode,
                      ),
                      Divider(height: 30),
                      
                      // Amount or Ticket Count
                      if (amount != null || tickets != null)
                        Column(
                          children: [
                            _buildDetailRow(
                              icon: Icons.money,
                              label: validationType == 'card' ? 'Balance' : 'Tickets',
                              value: validationType == 'card' 
                                ? '${amount!.toStringAsFixed(2)} \$' 
                                : tickets.toString(),
                              isDarkMode: isDarkMode,
                            ),
                            Divider(height: 30),
                          ],
                        ),
                      
                      // Validation Date
                      _buildDetailRow(
                        icon: Icons.calendar_today,
                        label: 'Date',
                        value: DateFormat('MMMM d, y').format(validationTime),
                        isDarkMode: isDarkMode,
                      ),
                      Divider(height: 30),
                      
                      // Validation Time
                      _buildDetailRow(
                        icon: Icons.access_time,
                        label: 'Time',
                        value: DateFormat('HH:mm').format(validationTime),
                        isDarkMode: isDarkMode,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              
              // Action Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                ),),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'DONE',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    required bool isDarkMode,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.green),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: isDarkMode ? Colors.grey[400] : Colors.grey,
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}