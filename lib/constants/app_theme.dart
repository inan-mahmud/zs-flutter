import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  AppThemes._();

  static const Color _primaryColor = Color(0xFF4CAF50);
  static const Color _accentColor = Color(0xFF1A237E);
  static const Color _secondaryColor = Color(0xFF81C784);
  static const Color _primaryColorDark = Color(0xFF388E3C);
  static const Color _backgroundColor = Color(0xFFF6F6F6);
  static const Color _textColor = Color(0xFF4C4C4C);
  static const Color _textColorLight = Colors.white;

  static final TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
        fontSize: 28.0, color: _accentColor, fontWeight: FontWeight.bold),
    headline2: TextStyle(
        fontSize: 18.0, color: _accentColor, fontWeight: FontWeight.w800),
    headline3: TextStyle(
        fontSize: 22.0, color: _accentColor, fontWeight: FontWeight.w500),
    bodyText1: TextStyle(fontSize: 18.0, color: _textColor,fontWeight: FontWeight.w500),
    bodyText2: TextStyle(fontSize: 16.0, color: _textColor),
    button: TextStyle(
        fontSize: 15.0, color: _textColorLight, fontWeight: FontWeight.w600),
    headline6: TextStyle(fontSize: 16.0, color: _textColor),
    subtitle1: TextStyle(
        fontSize: 16.0, color: _textColor, fontWeight: FontWeight.w500),
    subtitle2: TextStyle(
        fontSize: 18.0, color: _textColorLight, fontWeight: FontWeight.w500),
    caption: TextStyle(fontSize: 12.0, color: _textColor),
  );

  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: _backgroundColor,
    backgroundColor: _backgroundColor,
    primaryColor: _primaryColor,
    primaryColorLight: _secondaryColor,
    primaryColorDark: _primaryColorDark,
    textTheme: GoogleFonts.poppinsTextTheme(_textTheme),
    appBarTheme: AppBarTheme(
      color: _primaryColor,
      iconTheme: IconThemeData(color: _backgroundColor),
      textTheme: GoogleFonts.poppinsTextTheme(_textTheme),
    ),
    snackBarTheme: SnackBarThemeData(
        backgroundColor: _primaryColor, actionTextColor: _textColorLight),
    iconTheme: IconThemeData(
      color: _accentColor,
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      buttonColor: _accentColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
