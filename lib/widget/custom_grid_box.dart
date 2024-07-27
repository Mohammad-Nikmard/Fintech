import 'package:fintech/constatns/color_constants.dart';
import 'package:flutter/material.dart';

class CustomGridBox extends StatelessWidget {
  const CustomGridBox({
    super.key,
    required this.child,
    required this.index,
    required this.selectedIndex,
    required this.height,
    required this.width,
  });
  final Widget child;
  final int index;
  final int selectedIndex;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
        border: Border.all(
          width: 1.5,
          color: (selectedIndex == index)
              ? AppColor.blueColor
              : Colors.transparent,
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, -5),
            spreadRadius: -20,
            blurRadius: 25,
            color: AppColor.greyColor200,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: child,
      ),
    );
  }
}
