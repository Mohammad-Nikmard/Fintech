import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({
    super.key,
    required this.height,
    required this.mediaQuery,
    required this.child,
  });
  final MediaQueryHandler mediaQuery;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQuery.screenWidth(context),
      height: 81,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -1),
            spreadRadius: -24,
            blurRadius: 25,
            color: AppColor.greyColor200,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: child,
      ),
    );
  }
}
