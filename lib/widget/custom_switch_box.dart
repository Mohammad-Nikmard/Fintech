import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitchBox extends StatefulWidget {
  const CustomSwitchBox({
    super.key,
    required this.height,
    required this.mediaQuery,
    this.smallBoxColor,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onToggle,
  });
  final MediaQueryHandler mediaQuery;
  final double height;
  final Color? smallBoxColor;
  final String title;
  final String icon;
  final Color iconColor;
  final ValueChanged<bool> onToggle;

  @override
  State<CustomSwitchBox> createState() => _CustomSwitchBoxState();
}

class _CustomSwitchBoxState extends State<CustomSwitchBox> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
        widget.onToggle(isTapped);
      },
      child: Container(
        width: widget.mediaQuery.screenWidth(context),
        height: widget.height,
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
            BoxShadow(
              offset: Offset(25, 0),
              spreadRadius: -30,
              blurRadius: 25,
              color: AppColor.greyColor200,
            ),
            BoxShadow(
              offset: Offset(-25, 0),
              spreadRadius: -30,
              blurRadius: 25,
              color: AppColor.greyColor200,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: ShapeDecoration(
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  color: widget.smallBoxColor ??
                      widget.iconColor.withOpacity(0.15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(
                    widget.icon.toSvg,
                    colorFilter: ColorFilter.mode(
                      widget.iconColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                widget.title,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  fontFamily: 'SM',
                  fontSize: 16,
                  color: AppColor.blackColor,
                ),
              ),
              const Spacer(),
              IgnorePointer(
                ignoring: true,
                child: FlutterSwitch(
                  height: 22,
                  width: 40,
                  activeColor: AppColor.blueColor,
                  toggleColor: Colors.white,
                  inactiveColor: const Color(0xffe8e9eb),
                  toggleSize: 16,
                  padding: 3,
                  value: isTapped,
                  onToggle: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
