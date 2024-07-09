import 'package:fintech/constatns/color_constants.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      backgroundColor: AppColor.blueColor,
      textStyle: const TextStyle(
        fontFamily: 'SM',
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  ),
  colorScheme: const ColorScheme.light(
    surface: Color(0xfffefefe),
    primaryContainer: Colors.white,
    primary: Color(0xff202A34),
    secondary: AppColor.greyColor200,
  ),
);
