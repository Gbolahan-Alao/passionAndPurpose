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
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image-5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width > 600
                    ? MediaQuery.of(context).size.width * 0.6
                    : double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.white.withOpacity(0.3),
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10),
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
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.width > 600
                                        ? 18
                                        : 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 30),
                            AuthTextField(
                              hintText: 'Full Name',
                              prefixIcon: Icons.person,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                            const SizedBox(height: 20),
                            AuthTextField(
                              hintText: 'Email Address',
                              prefixIcon: Icons.email,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                            const SizedBox(height: 20),
                            AuthTextField(
                              hintText: 'Phone Number',
                              prefixIcon: Icons.phone,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                            const SizedBox(height: 20),
                            AuthTextField(
                              hintText: 'Password',
                              prefixIcon: Icons.lock,
                              obscureText: true,
                              suffixIcon: Icons.visibility,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                            const SizedBox(height: 30),
                            AuthButton(
                              text: 'Signup',
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (builder) => const MainPage()));
                              },
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF7F7FD5),
                                  Color(0xFF7F7FD5),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
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
                                    child: const Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontSize: 16,
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
