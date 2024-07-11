import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.mediaQuery,
    required this.hint,
    required this.controller,
    required this.color,
    this.readOnly = false,
    this.showText = false,
    this.textColor = AppColor.blackColor,
    this.prefixIcon,
  });
  final MediaQueryHandler mediaQuery;
  final String hint;
  final TextEditingController controller;
  final Color color;
  final bool readOnly;
  final bool showText;
  final Color textColor;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaQuery.screenWidth(context),
      child: TextField(
        readOnly: readOnly,
        obscureText: showText,
        controller: controller,
        style: TextStyle(
          fontFamily: 'SM',
          fontSize: 16,
          color: textColor,
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 23, vertical: 22),
          filled: true,
          fillColor: color,
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: 'SM',
            fontSize: 16,
            color: AppColor.greyColor200,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
