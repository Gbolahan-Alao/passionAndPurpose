import 'package:flutter/material.dart';
import 'package:passion_purpose/core/pages/main_page.dart';
import 'dart:ui';

import 'package:passion_purpose/features/auth/presentation/pages/login_screen.dart';
import 'package:passion_purpose/features/auth/presentation/widgets/auth_button.dart';
import 'package:passion_purpose/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:passion_purpose/core/theme/theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image-5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Form with transparent/blurred background
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width > 600
                    ? MediaQuery.of(context).size.width * 0.6
                    : double.infinity, // Adjust width for larger screens
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter:
                        ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
                    child: Container(
                      color: Colors.white
                          .withOpacity(0.2), // Semi-transparent background
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        // Added scroll view
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Align the children to the center
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width > 600
                                        ? 30
                                        : 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Create an account to start exploring.',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width > 600
                                        ? 18
                                        : 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 30),
                            // Full Name Field
                            AuthTextField(
                              hintText: 'Full Name',
                              prefixIcon: Icons.person,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                            SizedBox(height: 20),
                            // Email Address Field
                            AuthTextField(
                              hintText: 'Email Address',
                              prefixIcon: Icons.email,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                            SizedBox(height: 20),
                            // Phone Number Field
                            AuthTextField(
                              hintText: 'Phone Number',
                              prefixIcon: Icons.phone,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                            SizedBox(height: 20),
                            // Password Field
                            AuthTextField(
                              hintText: 'Password',
                              prefixIcon: Icons.lock,
                              obscureText: true,
                              suffixIcon: Icons.visibility,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                            SizedBox(height: 30),
                            // Sign Up Button
                            AuthButton(
                              text: 'Signup',
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (builder) => const MainPage()));
                              },
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF7F7FD5),
                                  Color(0xFF7F7FD5),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            // Already have an account? Sign In Link
                            Container(
                              width: double
                                  .infinity, // Set the width to the available width of the screen
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Align the children to the center
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
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
          ),
        ],
      ),
    );
  }
}
