import 'package:flutter/material.dart';

class AppTheme {
  // constructor
  const AppTheme({required this.context});
  final BuildContext context;

  // =============== THEME DATA =============== //
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        textTheme: textTheme,
      );

  // =============== FONTS THEME =============== //
  TextTheme get textTheme => const TextTheme(
        // =============== Headings =============== //
        headlineLarge: TextStyle(
          fontFamily: 'Roboto-Bold',
        ),

        headlineMedium: TextStyle(
          fontFamily: 'Roboto-Bold',
        ),

        headlineSmall: TextStyle(
          fontFamily: 'Roboto-Bold',
        ),

        // =============== Titles =============== //
        titleLarge: TextStyle(
          fontFamily: 'Roboto-Medium',
        ),

        titleMedium: TextStyle(
          fontFamily: 'Roboto-Medium',
        ),

        titleSmall: TextStyle(
          fontFamily: 'Roboto-Medium',
        ),

        // =============== Labels =============== //
        labelLarge: TextStyle(
          fontFamily: 'Roboto-Regular',
        ),

        labelMedium: TextStyle(
          fontFamily: 'Roboto-Regular',
        ),

        labelSmall: TextStyle(
          fontFamily: 'Roboto-Regular',
        ),

        // =============== Body =============== //
        bodyLarge: TextStyle(
          fontFamily: 'Roboto-Light',
        ),

        bodyMedium: TextStyle(
          fontFamily: 'Roboto-Light',
        ),

        bodySmall: TextStyle(
          fontFamily: 'Roboto-Light',
        ),

        //
      );
}
