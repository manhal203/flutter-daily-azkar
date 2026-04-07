import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: Color.fromARGB(255, 255, 240, 246),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black,
      centerTitle: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 255, 240, 246),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: .circular(20)),
      ),
    ),

    cardTheme: CardThemeData(
      color: Color.fromARGB(255, 255, 240, 246),
      shape: RoundedRectangleBorder(
        borderRadius: .circular(14),
        side: BorderSide(color: Color.fromARGB(255, 232, 178, 228)),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: Color.fromARGB(255, 27, 15, 47),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 121, 102, 146),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: .circular(20)),
      ),
    ),

    cardTheme: CardThemeData(
      color: Color.fromARGB(255, 121, 102, 146),
      shape: RoundedRectangleBorder(
        borderRadius: .circular(14),
        side: BorderSide(color: Color.fromARGB(255, 99, 73, 159)),
      ),
    ),
  );
}
