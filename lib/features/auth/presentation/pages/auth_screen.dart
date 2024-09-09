import 'package:flutter/material.dart';
import 'package:passion_purpose/core/theme/theme.dart';
import 'package:passion_purpose/features/auth/presentation/pages/login_screen.dart';
import 'package:passion_purpose/features/auth/presentation/pages/sign_up_screen.dart'; // Ensure you have this import

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/image-5.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient overlay
          Positioned.fill(
            child: Container(
              color: Colors.black
                  .withOpacity(0.5), // Semi-transparent black overlay
            ),
          ),
          // Centered content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo or App Name
                Text(
                  'Passion and Purpose', // Replace with your app's name or logo
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.whiteColor,
                  ),
                ),
                SizedBox(height: 40),
                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => const SignupScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor, // Background color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.whiteColor, // Text color
                    ),
                  ),
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 16),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (builder) => LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.whiteColor, // Background color
                    foregroundColor: AppTheme.textColor, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side:
                          BorderSide(color: AppTheme.textColor), // Border color
                    ),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
