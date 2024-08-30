import 'package:flutter/material.dart';

ThemeData themeDark = ThemeData(
  //primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF17212b),
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  disabledColor: Colors.white,
  brightness: Brightness.dark,
  hintColor: Color(0xFF3985c0),
  cardColor: Color(0xFF182633),
  primaryColor: Color(0xFF17212b),
  scaffoldBackgroundColor: Color(0xFF131a24),
  canvasColor: Color(0xFF17212b),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: Color(0xFF77818d),
    selectedItemColor: Colors.white,
    backgroundColor: Color(0xFF17212b),
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: Color(0xFF3985c0),
      fontSize: 12,
      fontFamily: 'OpenSans',
    ),
    displayLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 18,
      fontFamily: 'OpenSans',
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      fontFamily: 'OpenSans',
    ),
    displaySmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF3985c0),
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 14,
      color: Color(0xFF3985c0),
      fontWeight: FontWeight.bold,
      fontFamily: 'OpenSans',
    ),
  ),
);

ThemeData themeLight = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF17212b),
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF17212b),
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  disabledColor: Colors.green,
  brightness: Brightness.light,
  primaryIconTheme: IconThemeData(
    color: Color(0xFF3985c0),
  ),
  primaryTextTheme: TextTheme(
    titleLarge: TextStyle(color: Color(0xFF3985c0)),
  ),
  hintColor: Color(0xFF3985c0),
  cardColor: Colors.grey.shade100,
  primaryColor: Color(0xFFffffff),
  scaffoldBackgroundColor: Color(0xFFedeef0),
  canvasColor: Color(0xFFffffff),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: Color(0xFF77818d),
    selectedItemColor: Color(0xFF17212b),
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: Color(0xFF3985c0),
      fontSize: 12,
      fontFamily: 'OpenSans',
    ),
    displayLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 18,
      fontFamily: 'OpenSans',
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      fontFamily: 'OpenSans',
    ),
    displaySmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF3985c0),
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF77818d),
    ),
    headlineSmall: TextStyle(
      fontSize: 14,
      color: Color(0xFF3985c0),
      fontWeight: FontWeight.bold,
      fontFamily: 'OpenSans',
    ),
  ),
);
