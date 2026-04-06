import 'package:flutter/material.dart';

class AppThemes {

  static Color backgroundColor = Color(0xFF14181c);
  static Color font = Color(0xFF00BFFF);
  static Color rate = Color(0xFFFF8000);
  static Color icon = Color(0xFF00E054);
  
  static ThemeData lighttheme = ThemeData.light().copyWith(

    scaffoldBackgroundColor: backgroundColor,

    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: font,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      selectedItemColor: icon,
      unselectedItemColor: icon,
      type: BottomNavigationBarType.fixed,
    ),

    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        color: AppThemes.font,
        fontWeight: FontWeight.bold
      ),
      subtitleTextStyle: TextStyle(
        color: AppThemes.font
      )
    )
  );
}