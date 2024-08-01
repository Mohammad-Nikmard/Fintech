import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/ui/pincode_change_screen.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_box.dart';
import 'package:fintech/widget/custom_master_card.dart';
import 'package:fintech/widget/custom_switch_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardSettingScreen extends StatelessWidget {
  const CardSettingScreen({
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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 10),
                    sliver: SliverToBoxAdapter(
                      child: _CardListSection(
                        mediaQuery: mediaQuery,
                      ),
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(right: 30, left: 30, bottom: 25),
                    sliver: _DataSection(),
                  ),
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(right: 30, left: 30, bottom: 35),
                    sliver: SliverToBoxAdapter(
                      child: _SettingSection(
                        navigator: nav,
                        mediaQuery: mediaQuery,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                    sliver: SliverToBoxAdapter(
                      child: SizedBox(
                        height: 63,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
              child: CustomAppbar(
                nav: nav,
                mediaQuery: mediaQuery,
                title: 'My Card',
                leftIcon: 'icon_arrow_left',
                isLeftProfile: false,
                rightIcon: 'icon_notification',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardListSection extends StatefulWidget {
  const _CardListSection({
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<_CardListSection> createState() => _CardListSectionState();
}

class _CardListSectionState extends State<_CardListSection> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 228,
          width: widget.mediaQuery.screenWidth(context),
          child: PageView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              return CustomMasterCard(
                backgroundColor:
                    (index == 0) ? AppColor.blueColor : AppColor.greenDark,
              );
            },
            itemCount: 2,
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: controller,
          count: 2,
          effect: ExpandingDotsEffect(
            dotHeight: 4,
            dotWidth: 4,
            spacing: 2.30,
            dotColor: context.secondaryContainer,
            activeDotColor: AppColor.blueColor,
          ),
        ),
      ],
    );
  }
}

class _DataSection extends StatelessWidget {
  const _DataSection();

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: ColoredBox(
              color: AppColor.greenLight,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Credit Limit',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 14,
                        color: AppColor.greenDark,
                      ),
                    ),
                    const SizedBox(height: 3),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 18,
                              color: AppColor.greenDark,
                            ),
                          ),
                          TextSpan(
                            text: '271.00',
                            style: TextStyle(
                              fontFamily: 'SB',
                              fontSize: 20,
                              color: AppColor.greenDark,
                            ),
                          ),
                          TextSpan(
                            text: 'USD',
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 10,
                              color: AppColor.greenDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: ColoredBox(
              color: AppColor.redLight,
              child: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Credit Status',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 14,
                        color: AppColor.redDark,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Active',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 20,
                        color: AppColor.redDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 89,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
    );
  }
}

class _SettingSection extends StatelessWidget {
  const _SettingSection({
    required this.mediaQuery,
    required this.navigator,
  });
  final MediaQueryHandler mediaQuery;
  final NavigatorHandler navigator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Setting',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () => navigator.fadeNav(
            context,
            PinCodeChangeScreen(mediaQuery: mediaQuery, nav: navigator),
          ),
          child: CustomBox(
            height: 60,
            mediaQuery: mediaQuery,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7),
                  ),
                  child: SizedBox(
                    height: 29,
                    width: 29,
                    child: ColoredBox(
                      color: AppColor.greenLight,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset(
                          'icon_sheild'.toSvg,
                          colorFilter: const ColorFilter.mode(
                            AppColor.greenDark,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Text(
                  'Change Pin',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 16,
                    color: AppColor.blackColor,
                  ),
                ),
                const Spacer(),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: SizedBox(
                    height: 26,
                    width: 26,
                    child: ColoredBox(
                      color: AppColor.blueLight,
                      child: const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColor.blueColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        CustomSwitchBox(
          height: 60,
          mediaQuery: mediaQuery,
          title: 'Lock Card',
          icon: 'icon_card_lock',
          iconColor: AppColor.redDark,
          onToggle: (value) {},
        ),
        const SizedBox(height: 15),
        CustomSwitchBox(
          height: 60,
          mediaQuery: mediaQuery,
          title: 'Lock Card',
          icon: 'icon_card_forbid',
          iconColor: AppColor.blueColor,
          onToggle: (value) {},
        ),
      ],
    );
  }
}
