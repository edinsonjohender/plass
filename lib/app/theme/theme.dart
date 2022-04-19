import 'package:flutter/material.dart';


ThemeData lightTheme(context) {
  
  final ThemeData base = ThemeData();

  return base.copyWith(

    brightness:  Brightness.light,
    
    primaryColor            : const Color.fromRGBO(0, 161, 187, 1),
    primaryColorLight       : const Color.fromRGBO(235, 188, 20, 1),
    scaffoldBackgroundColor : const Color.fromRGBO(250, 250, 250, 1),
    secondaryHeaderColor    : Colors.black,

    cardTheme   : CardTheme(
      margin    : const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      color     : const Color.fromRGBO(248, 248, 248, 1),
      shape     : RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation : 0.0
    ),

    inputDecorationTheme: InputDecorationTheme(
      fillColor     : Colors.white60,
      labelStyle    : const TextStyle( color: Colors.black87),
      focusColor    : Colors.black,
      filled        : true,
      border        : OutlineInputBorder( borderRadius: BorderRadius.circular(15)),
      enabledBorder : OutlineInputBorder(
        borderSide  : const BorderSide(color: Colors.transparent, width: 0.0),
        borderRadius: BorderRadius.circular(15)
      ),
      focusedBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent, width: 0),
        borderRadius: BorderRadius.circular(15),
      )
    )
  );
}
