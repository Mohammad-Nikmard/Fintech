import 'package:fintech/constatns/color_constants.dart';
import 'package:flutter/material.dart';

class CustomSelectionBox extends StatelessWidget {
  const CustomSelectionBox({
    super.key,
    required this.height,
    required this.width,
    required this.index,
    required this.selectedIndex,
    required this.child,
  });
  final double height;
  final double width;
  final int index;
  final int selectedIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            child,
            const Spacer(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.decelerate,
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.5,
                  color: (selectedIndex == index)
                      ? AppColor.blueColor
                      : AppColor.greyColor200,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AnimatedContainer(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (selectedIndex == index)
                        ? AppColor.blueColor
                        : Colors.transparent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
