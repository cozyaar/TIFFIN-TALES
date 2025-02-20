import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(TiffinTalesApp());
}

class TiffinTalesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 230, 211),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo and Title
                Image.asset('assets/logo.png', width: 100, height: 100),
                SizedBox(height: 16),
                Text(
                  'Tiffin Tales',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B5E3B),
                  ),
                ),
                SizedBox(height: 16),
                // Login Card
                Card(
                  color: Color(0xCCE67E22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Title and Description
                        Text(
  'HELLO :)',
  style: GoogleFonts.kufam(
    fontWeight: FontWeight.w600,  // Semibold weight
    fontSize: 30,
    color: Color(0xFF734E32),    // Your desired color
  ),
),
                        SizedBox(height: 8),
Text(
  'Login or Sign-up here',
  style: TextStyle(
    fontFamily: 'Poppins', // Set the font family to Poppins
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 16, // Font size of 16
    color: Color(0xFF8B5E3B), // Color
  ),
),
                        SizedBox(height: 16),

                        // Email Input
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'email@domain.com',
                            hintStyle: TextStyle(color: Colors.white70),
                            fillColor: Colors.white10,
                            filled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 20),

                        // Line with "or"
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.white70)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'or',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            Expanded(child: Divider(color: Colors.white70)),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Social Login Buttons (Just as a placeholder)
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/google-icon.png', width: 24, height: 24),  // Your custom Google icon image
                              SizedBox(width: 8),
                              Text('Continue with Google', style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/apple-icon.png', width: 24, height: 24),  // Your custom Apple icon image
                              SizedBox(width: 8),
                              Text('Continue with Apple', style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),

                        // Continue Button
                        ElevatedButton(
                          onPressed: () {
                            // Continue Button Action
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xFF7D4215)),
                          ),
                          child: Text('CONTINUE', style: TextStyle(color: Color(0xFFF6E6D3))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Terms of Service and Privacy Policy
                Text(
                  'By clicking continue, you agree to our Terms of Service and Privacy Policy',
                  style: TextStyle(color: Colors.brown, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
