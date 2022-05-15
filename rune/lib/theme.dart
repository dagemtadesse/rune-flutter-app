import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SplashTheme {
  static const darkBg = Color.fromRGBO(18, 18, 18, 1.0);

  static final buttonTheme = TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(
      vertical: 15,
      horizontal: 18,
    ),
    backgroundColor: darkBg,
    primary: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static final transparentButton = TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(
      vertical: 15,
      horizontal: 18,
    ),
    backgroundColor: Colors.transparent,
    primary: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.poppins(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline3: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.normal),
    labelMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}

// class