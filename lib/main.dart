// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/screens/splash_screen.dart';
import 'package:movie_app/styles/stryle.dart';

void main() {
  runApp(Movie_App());
}

class Movie_App extends StatelessWidget {
  const Movie_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white)),
        fontFamily: GoogleFonts.ptSans().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ).copyWith(
          scaffoldBackgroundColor: Colours.scaffoldBgColor, useMaterial3: true),
      home: Splash_Screen(),
    );
  }
}
