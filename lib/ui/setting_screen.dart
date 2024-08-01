import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_box.dart';
import 'package:fintech/widget/custom_switch_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    super.key,
    required this.mediaQuery,
    required this.nav,
  });
  final MediaQueryHandler mediaQuery;
  final NavigatorHandler nav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomAppbar(
                nav: nav,
                mediaQuery: mediaQuery,
                title: 'Setting',
                leftIcon: 'icon_arrow_left',
                rightIcon: 'icon_notification',
              ),
              const SizedBox(height: 48),
              _SettingContent(
                mediaQuery: mediaQuery,
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
                child: SizedBox(
                  height: 63,
                  width: mediaQuery.screenWidth(context),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingContent extends StatefulWidget {
  const _SettingContent({
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<_SettingContent> createState() => _SettingContentState();
}

class _SettingContentState extends State<_SettingContent> {
  bool lockCardState = false;
  bool deactiveCardState = true;
  bool notifState = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Cards',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 25),
        CustomBox(
          height: 81,
          mediaQuery: widget.mediaQuery,
          child: Row(
            children: [
              SvgPicture.asset(
                'small_debitcard_vector'.toSvg,
              ),
              const SizedBox(width: 15),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    'Debit Card',
                    style: TextStyle(
                      fontFamily: 'SSB',
                      fontSize: 18,
                      color: AppColor.blackColor,
                    ),
                  ),
                  Text(
                    'Master Card',
                    style: TextStyle(
                      fontFamily: 'SSB',
                      fontSize: 16,
                      color: AppColor.greyColor200,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const Spacer(),
              Container(
                height: 21,
                width: 21,
                decoration: ShapeDecoration(
                  color: AppColor.blueLight,
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: RotatedBox(
                      quarterTurns: 90,
                      child: SvgPicture.asset(
                        'icon_arrow_left'.toSvg,
                        colorFilter: const ColorFilter.mode(
                          AppColor.blueColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        Text(
          'Card Settings',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 25),
        CustomSwitchBox(
          height: 60,
          mediaQuery: widget.mediaQuery,
          title: 'Lock Card',
          icon: 'icon_card_lock',
          iconColor: AppColor.redDark,
          smallBoxColor: AppColor.redLight,
          onToggle: (value) {
            setState(() {
              lockCardState = value;
            });
          },
        ),
        const SizedBox(height: 17),
        CustomSwitchBox(
          height: 60,
          mediaQuery: widget.mediaQuery,
          title: 'Deactive Card',
          icon: 'icon_card_forbid',
          iconColor: AppColor.blueColor,
          smallBoxColor: AppColor.blueLight,
          onToggle: (value) {
            setState(() {
              deactiveCardState = value;
            });
          },
        ),
        const SizedBox(height: 25),
        Text(
          'Notifications',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 25),
        CustomSwitchBox(
          height: 60,
          mediaQuery: widget.mediaQuery,
          title: 'Pop-Up Notifications',
          icon: 'icon_card_lock',
          iconColor: AppColor.redDark,
          smallBoxColor: AppColor.redLight,
          onToggle: (value) {
            setState(() {
              notifState = value;
            });
          },
        ),
      ],
    );
  }
}
