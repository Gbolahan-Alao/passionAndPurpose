import 'package:flutter/material.dart';
import 'package:passion_purpose/core/theme/theme.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;
  final List<Widget> pages;

  const BottomNavigationWidget({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabSelected,
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: AppTheme.whiteColor,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_mail),
          label: 'Contact Us',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'About',
        ),
      ],
    );
  }
}
