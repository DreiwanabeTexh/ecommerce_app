import 'package:flutter/material.dart';

class AppWidget {

  static TextStyle boldTextFieldStyle() {
    return TextStyle(
          color: Colors.black,
          fontSize: 27,
          fontWeight: FontWeight.bold
    );
  }

  static TextStyle normalTextFieldStyle() {
    return TextStyle(
          color: Colors.black45,
          fontSize: 20,
          fontWeight: FontWeight.w500
    );
  }

  static TextStyle normalTextBoldStyle() {
    return TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
    );
  }

  static TextStyle normalTextStyleOrange() {
    return TextStyle(
          color: Color(0xFFfd6f3e), 
          fontSize: 18, 
          fontWeight: FontWeight.w500
    );
  }

}