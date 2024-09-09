import 'package:flutter/material.dart';
import 'package:passion_purpose/core/theme/theme.dart';

class TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;
  final double screenWidth;

  const TabItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: screenWidth * 0.28,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppTheme.whiteColor : AppTheme.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
