import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passion_purpose/core/theme/theme.dart';
import 'package:passion_purpose/features/contact/presentation/pages/contact_page.dart';
import 'package:passion_purpose/features/donation/presentation/pages/donation_screen.dart';
import 'package:passion_purpose/features/home/providers/services_provider.dart';
import 'package:passion_purpose/features/home/widgets/animated_text_widget.dart';
import 'package:passion_purpose/features/home/widgets/autho_scroll_service_list.dart';
import 'package:passion_purpose/features/home/widgets/cards/header_card.dart';
import 'package:passion_purpose/features/home/widgets/problem_solving_section.dart';
import 'package:passion_purpose/features/home/widgets/home_carousel_slider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final services = ref.watch(serviceProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: size.height * 0.02),
                const AnimatedTextWidget(text: 'Welcome, Alex'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: HeaderCard(
                        icon: Icons.book,
                        title: 'Therapy',
                        description: 'Book a session today',
                        backgroundColor: AppTheme.primaryColor,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ContactPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: HeaderCard(
                        icon: Icons.health_and_safety_rounded,
                        title: 'Donate',
                        description: 'Help us to make a difference',
                        backgroundColor: AppTheme.whiteColor,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DonationScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                const Text(
                  'Our Services',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textColor,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                AutoScrollServiceList(
                  services: services.map((service) => service.title).toList(),
                ),
                SizedBox(height: size.height * 0.02),

                // Carousel Section with Transparent Background
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.35, // Adjust height
                  child: Stack(
                    children: [
                      // Background Image with transparency
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0.3, // Adjust the opacity for transparency
                          child: Image.asset(
                            'assets/images/intro.jpg', // Your background image
                            fit: BoxFit
                                .cover, // Ensures the image covers the entire section
                          ),
                        ),
                      ),
                      // Carousel Slider on top
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: HomeCarouselSlider(), // Add your carousel
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.02),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.6, // Adjust height as needed
                  child: const ProblemSolving(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
