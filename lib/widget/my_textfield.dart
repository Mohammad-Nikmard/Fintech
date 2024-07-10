import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.mediaQuery,
    required this.hint,
    required this.controller,
  });
  final MediaQueryHandler mediaQuery;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaQuery.screenWidth(context),
      child: TextField(
        style: const TextStyle(
          fontFamily: 'SM',
          fontSize: 16,
          color: AppColor.blackColor,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 23, vertical: 22),
          filled: true,
          fillColor: Colors.white,
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
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
