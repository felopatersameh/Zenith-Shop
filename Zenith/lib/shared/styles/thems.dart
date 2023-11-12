import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData darkthem = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: prinarycolor
  ),
  primaryColor: prinarycolor,
  scaffoldBackgroundColor: const Color.fromRGBO(24, 24, 24, 1),
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(24, 24, 24, 1), statusBarIconBrightness: Brightness.light),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      backgroundColor: Color.fromRGBO(24, 24, 24, 1),
      elevation: 0.0,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(24, 24, 24, 1),
    elevation: 10,
    selectedItemColor: Color.fromRGBO(249, 148, 23, 1),
    unselectedItemColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 27,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: Colors.white70,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
  ),
);

ThemeData lightthem = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondarycolor
  ),
  primaryColor: prinarycolor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 30,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    elevation: 20,
    selectedItemColor: Color.fromRGBO(249, 148, 23, 1),
    unselectedItemColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 27,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: Colors.black45,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
  ),
);
