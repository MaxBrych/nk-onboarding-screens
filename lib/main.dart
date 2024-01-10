import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding/welcome_screen.dart';
import 'onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NK Onboarding',
      theme: ThemeData(
        // Define primary color
        primaryColor: Color(0xFF006689),
        // Define color scheme with primary color
        colorScheme: ColorScheme.light(
          primary: Color(0xFF006689),
        ),
        // Define text theme using Google Fonts
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}
