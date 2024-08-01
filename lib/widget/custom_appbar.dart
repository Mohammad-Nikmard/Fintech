import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/ui/notification_screen.dart';
import 'package:fintech/ui/profile_screen.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.leftIcon,
    required this.rightIcon,
    this.isRightProfile = false,
    this.isLeftProfile = false,
    required this.nav,
    required this.mediaQuery,
  });
  final String title;
  final String leftIcon;
  final String rightIcon;
  final bool isRightProfile;
  final bool isLeftProfile;
  final NavigatorHandler nav;
  final MediaQueryHandler mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!isLeftProfile) ...{
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
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
          ),
        } else ...{
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            child: ColoredBox(
              color: const Color(0xffe8e9eb),
              child: GestureDetector(
                onTap: () {
                  nav.fadeNav(
                    context,
                    ProfileScreen(
                      mediaQuery: mediaQuery,
                      nav: nav,
                    ),
                  );
                },
                child: SizedBox(
                  height: 47,
                  width: 47,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image(
                      image: AssetImage(
                        'assets/images/$leftIcon',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        },
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'SB',
            fontSize: 22,
            color: AppColor.blackColor,
          ),
        ),
        if (!isRightProfile) ...{
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
                    child: GestureDetector(
                      onTap: () => nav.fadeNav(
                        context,
                        NotificationScreen(mediaQuery: mediaQuery, nav: nav),
                      ),
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
          ),
        } else ...{
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            child: ColoredBox(
              color: const Color(0xffe8e9eb),
              child: GestureDetector(
                onTap: () {
                  nav.fadeNav(
                    context,
                    ProfileScreen(
                      mediaQuery: mediaQuery,
                      nav: nav,
                    ),
                  );
                },
                child: SizedBox(
                  height: 47,
                  width: 47,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image(
                      image: AssetImage(
                        'assets/images/$rightIcon',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        }
      ],
    );
  }
}
