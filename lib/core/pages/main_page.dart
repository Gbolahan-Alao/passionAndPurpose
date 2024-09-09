import 'package:flutter/material.dart';
import 'package:passion_purpose/core/widgets/bottom_navigation_widget.dart';
import 'package:passion_purpose/features/about/presentation/pages/about_page.dart';
import 'package:passion_purpose/features/contact/presentation/pages/contact_page.dart';
import 'package:passion_purpose/features/home/presentation/pages/home_page.dart';
import 'package:passion_purpose/features/schedule/presentation/pages/schedule_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    SchedulePage(),
    ContactPage(),
    AboutPage()
  ];

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _currentIndex,
        onTabSelected: _onNavBarTap,
        pages: _pages,
      ),
    );
  }
}
