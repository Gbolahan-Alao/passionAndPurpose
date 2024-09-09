import 'package:flutter/material.dart';
import 'dart:ui';

class HomeCarouselCard extends StatelessWidget {
  final String title;
  final String description;

  HomeCarouselCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), // Increased blur
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4), // Increased opacity
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: Colors.white
                        .withOpacity(0.6)), // Increased border opacity
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black
                              .withOpacity(0.8), // Darker text color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
