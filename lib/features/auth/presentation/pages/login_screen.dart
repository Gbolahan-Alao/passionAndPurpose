import 'package:flutter/material.dart';
import 'package:passion_purpose/core/pages/main_page.dart';
import 'package:passion_purpose/features/auth/presentation/pages/sign_up_screen.dart';
import 'dart:ui';

import 'package:passion_purpose/features/auth/presentation/widgets/auth_button.dart';
import 'package:passion_purpose/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:passion_purpose/core/theme/theme.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/image-5.jpg'), // Your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Form with transparent/blurred background
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width > 600
                      ? MediaQuery.of(context).size.width * 0.6
                      : double.infinity, // Adjust width for larger screens
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 10, sigmaY: 10), // Blur effect
                      child: Container(
                        color: Colors.white
                            .withOpacity(0.2), // Semi-transparent background
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Login',
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
                              'Please sign in to your account.',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width > 600
                                        ? 18
                                        : 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 30),
                            // Username Field
                            AuthTextField(
                              hintText: 'Username',
                              prefixIcon: Icons.person,
                              fillColor: Colors.white
                                  .withOpacity(0.3), // Slightly more opaque
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
                            // Login Button
                            AuthButton(
                              text: 'Login',
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
                            SizedBox(height: 20),
                            // Don't have an account? Sign Up Link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Don\'t have an account?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 2),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen()));
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
