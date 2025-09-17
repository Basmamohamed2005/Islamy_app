import 'package:flutter/material.dart';
import 'package:islamy/core/styles/app_colores.dart';

class TextStyles {
  static TextStyle largeTitleTextStyle({Color textColor= AppColores.gold}){
    return TextStyle(
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      fontFamily: "Janna"
    );
  }
  static TextStyle smallTitleTextStyle({Color textColor= AppColores.gold}){
    return TextStyle(
        color: textColor,
        fontWeight: FontWeight.w900,
        fontSize: 20,
        fontFamily: "Janna"
    );
  }
  static TextStyle mediumTitleTextStyle({Color textColor= AppColores.gold}){
    return TextStyle(
        color: textColor,
        fontWeight: FontWeight.w900,
        fontSize: 22,
        fontFamily: "Janna"
    );
  }
  static TextStyle mediumLabelTextStyle({Color textColor= AppColores.gold}){
    return TextStyle(
        color: textColor,
        fontWeight: FontWeight.w900,
        fontSize: 20,
        fontFamily: "Janna"
    );
  }
  static TextStyle smallLabelTextStyle({Color textColor= AppColores.gold}){
    return TextStyle(
        color: textColor,
        fontWeight: FontWeight.w900,
        fontSize: 18,
        fontFamily: "Janna"
    );
  }
  static TextStyle largeLabelTextStyle({Color textColor= AppColores.gold}){
    return TextStyle(
        color: textColor,
        fontWeight: FontWeight.w900,
        fontSize: 22,
        fontFamily: "Janna"
    );
  }
  static TextStyle mediumBodyTextStyle({Color textColor= AppColores.gold}){
    return TextStyle(
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        fontFamily: "Janna"
    );
  }
  static TextStyle smallBodyTextStyle({Color textColor= AppColores.gold}){
    return TextStyle(
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        fontFamily: "Janna"
    );
  }
  static TextStyle largeBodyTextStyle({Color textColor= AppColores.gold}){
    return TextStyle(
        color: textColor,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        fontFamily: "Janna"
    );
  }


}
