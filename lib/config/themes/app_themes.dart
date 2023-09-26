import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      useMaterial3: true,
      appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      elevation: 0,
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold));
}
