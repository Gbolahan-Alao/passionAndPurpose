import 'package:flutter/material.dart';
import 'package:passion_purpose/features/about/presentation/widgets/carousel_slider.dart';
import 'package:passion_purpose/features/about/presentation/widgets/glassmorphism_card.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image-2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main Content
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  // Reusable Carousel Slider Widget
                  CarouselSliderWidget(),
                  SizedBox(height: 40),
                  // Section: Who We Are
                  Text(
                    'Who We Are',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  GlassmorphismCard(
                    title: 'Passion and Purpose',
                    description:
                        'We are a center focused on helping individuals and families overcome addiction. We offer personalized programs for lasting recovery and well-being.',
                    imageUrl: 'assets/images/image-5.jpg',
                  ),
                  SizedBox(height: 30),
                  // Section: Our Approach
                  Text(
                    'Our Approach',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  GlassmorphismCard(
                    title: 'Our Approach',
                    description:
                        'Our holistic approach addresses the physical, emotional, and spiritual aspects of addiction, ensuring personalized care and long-term healing.',
                    imageUrl: 'assets/images/image-3.jpg',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
