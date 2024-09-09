import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:passion_purpose/features/donation/presentation/widgets/donation_button.dart';
import 'package:passion_purpose/features/donation/presentation/widgets/donation_form.dart';
import 'package:passion_purpose/features/donation/presentation/widgets/page_header.dart';

class DonationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Donate to Make a Difference',
          style: TextStyle(
              color: Colors.black, fontSize: 18), // Adjusted font size
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image-5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.white.withOpacity(0.9),
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PageHeader(
                            title: 'Donate Today',
                            subtitle:
                                'Your donation changes lives. Every dollar you give helps us make a difference.',
                          ),
                          const SizedBox(height: 20),
                          DonationForm(),
                          const SizedBox(height: 30),
                          Text(
                            'Your donation will be processed securely through PayPal.',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 13),
                          ),
                          SizedBox(height: 10),
                          DonationButton(
                            text: 'Donate via PayPal',
                            onPressed: () {
                              // Implement PayPal integration here
                            },
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Thank you for supporting our mission! Your generosity brings hope and change.',
                            style: TextStyle(
                              fontSize: 12, // Adjusted font size
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
