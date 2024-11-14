import 'package:flutter/material.dart';

ThemeData buildDarkTheme(){
  final base = ThemeData.light();
  return base.copyWith(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.black ,
    appBarTheme: AppBarTheme(
      color: Colors.green,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.green,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}