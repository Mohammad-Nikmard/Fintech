import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.leftIcon,
    required this.rightIcon,
  });
  final String title;
  final String leftIcon;
  final String rightIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          child: ColoredBox(
            color: const Color(0xffe8e9eb),
            child: SizedBox(
              height: 47,
              width: 47,
              child: Center(
                child: SizedBox(
                  height: 18,
                  width: 18,
                  child: SvgPicture.asset(
                    leftIcon.toSvg,
                    colorFilter: const ColorFilter.mode(
                      AppColor.greyColor200,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'SB',
            fontSize: 22,
            color: AppColor.blackColor,
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          child: ColoredBox(
            color: const Color(0xffe8e9eb),
            child: SizedBox(
              height: 47,
              width: 47,
              child: Center(
                child: SizedBox(
                  height: 22,
                  width: 22,
                  child: SvgPicture.asset(
                    rightIcon.toSvg,
                    colorFilter: const ColorFilter.mode(
                      AppColor.greyColor200,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
