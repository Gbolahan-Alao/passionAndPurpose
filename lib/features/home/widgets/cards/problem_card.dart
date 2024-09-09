import 'package:flutter/material.dart';
import 'package:passion_purpose/core/theme/theme.dart';

class ProblemCard extends StatelessWidget {
  final String title;
  final String imageAsset;

  const ProblemCard({
    Key? key,
    required this.title,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.transparent,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Stack(
              children: [
                Image.asset(
                  imageAsset,
                  height: 250, // Increased height
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 250, // Match image height
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20), // Rounded bottom corners
                ),
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12, // Adjusted font size
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
