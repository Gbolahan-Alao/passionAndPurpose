import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'glassmorphism_carousel_card.dart';

class CarouselSliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250, // Adjust height if needed
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        enableInfiniteScroll: true, // Enable infinite scrolling
        scrollPhysics: BouncingScrollPhysics(), // Add bounce effect
      ),
      items: [
        GlassmorphismCarouselCard(
          title: 'Our Vision',
          description:
              'We aim to revolutionize mental health and substance abuse care for Veterans with innovative therapies promoting purposeful living and service.',
        ),
        GlassmorphismCarouselCard(
          title: 'Our Mission',
          description:
              'We empower Veterans with personalized care for substance abuse, mental health, and housing needs, fostering long-term healing and reintegration.',
        ),
      ],
    );
  }
}
