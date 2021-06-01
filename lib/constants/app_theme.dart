import 'package:flutter/material.dart';

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
    bodyText1: TextStyle(fontSize: 16.0, color: _textColor),
    bodyText2: TextStyle(fontSize: 14.0, color: _textColor),
    button: TextStyle(
        fontSize: 15.0, color: _textColorLight, fontWeight: FontWeight.w600),
    headline6: TextStyle(fontSize: 16.0, color: _textColor),
    subtitle1: TextStyle(
        fontSize: 16.0, color: _textColor, fontWeight: FontWeight.w500),
    subtitle2: TextStyle(
        fontSize: 18.0, color: _textColor, fontWeight: FontWeight.w500),
    caption: TextStyle(fontSize: 12.0, color: _textColor),
  );

  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: _backgroundColor,
    primaryColor: _primaryColor,
    primaryColorLight: _secondaryColor,
    primaryColorDark: _primaryColorDark,
    textTheme: _textTheme,
    appBarTheme: AppBarTheme(
      color: _primaryColor,
      iconTheme: IconThemeData(color: _backgroundColor),
      textTheme: _textTheme,
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
