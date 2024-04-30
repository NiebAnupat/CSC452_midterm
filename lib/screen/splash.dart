import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_6400922/screen/main.dart';
import 'package:jumping_dot/jumping_dot.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // get screen width

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your splash screen content here (logo, text)
            Image.asset(
              'assets/dit-logo.png',
              scale: 0.6,
            ),
            const SizedBox(height: 100),
            Text(
              'ขายหนังสือ',
              style: GoogleFonts.chakraPetch(
                textStyle: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 150),
            JumpingDots(
              color: Colors.red.shade900,
              radius: 15,
              numberOfDots: 3,
            ),
          ],
        ),
      ),
    );
  }
}
