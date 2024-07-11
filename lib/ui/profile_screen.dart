import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: _ProfileHeader(),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 13),
                      child: CustomBox(
                        height: 73,
                        mediaQuery: mediaQuery,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              const Text(
                                'Total Blanace',
                                style: TextStyle(
                                  fontFamily: 'SSB',
                                  fontSize: 19,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              const Spacer(),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '\$5500.00',
                                      style: TextStyle(
                                        fontFamily: 'SB',
                                        fontSize: 22,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'USD',
                                      style: TextStyle(
                                        fontFamily: 'SM',
                                        fontSize: 10,
                                        color: AppColor.blackColor,
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
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 35),
                    sliver: _InfoSection(
                      mediaQuery: mediaQuery,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Recent Transactions',
                        style: TextStyle(
                          fontFamily: 'SSB',
                          fontSize: 19,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                  ),
                  _RecentTransactionSection(
                    mediaQuery: mediaQuery,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  title: 'Profile',
                  leftIcon: 'icon_arrow_left',
                  rightIcon: 'icon_notification',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 91,
              width: 91,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.redDark,
              ),
            ),
            Positioned(
              bottom: 5,
              right: -2,
              child: Container(
                height: 21,
                width: 21,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.blueColor,
                  border: Border.all(width: 1.3, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        const Text(
          'Mohammad',
          style: TextStyle(
            fontFamily: 'SB',
            fontSize: 20,
            color: AppColor.blueColor,
          ),
        ),
        const Text(
          'Iran',
          style: TextStyle(
            fontFamily: 'SM',
            fontSize: 16,
            color: AppColor.greyColor200,
          ),
        ),
      ],
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisExtent: 126,
      ),
      delegate: SliverChildListDelegate(
        [
          CustomBox(
            height: 126,
            mediaQuery: mediaQuery,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
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
                      color: AppColor.greenLight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SvgPicture.asset(
                        'icon_active_balance'.toSvg,
                        colorFilter: const ColorFilter.mode(
                          AppColor.greenDark,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Active Balance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SSB',
                      fontSize: 12,
                      color: AppColor.greyColor200,
                    ),
                  ),
                  const Spacer(),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '\$50.00',
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 16,
                            color: AppColor.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'USD',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 8,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomBox(
            height: 126,
            mediaQuery: mediaQuery,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
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
                      color: AppColor.redLight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SvgPicture.asset(
                        'icon_total_loan'.toSvg,
                        colorFilter: const ColorFilter.mode(
                          AppColor.redDark,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Total Loan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SSB',
                      fontSize: 12,
                      color: AppColor.greyColor200,
                    ),
                  ),
                  const Spacer(),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '\$50.00',
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 16,
                            color: AppColor.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'USD',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 8,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomBox(
            height: 126,
            mediaQuery: mediaQuery,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
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
                      color: AppColor.blueLight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SvgPicture.asset(
                        'icon_archive_book'.toSvg,
                        colorFilter: const ColorFilter.mode(
                          AppColor.blueColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Save It',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SSB',
                      fontSize: 12,
                      color: AppColor.greyColor200,
                    ),
                  ),
                  const Spacer(),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '\$50.00',
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 16,
                            color: AppColor.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'USD',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 8,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentTransactionSection extends StatefulWidget {
  const _RecentTransactionSection({
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<_RecentTransactionSection> createState() =>
      _RecentTransactionSectionState();
}

class _RecentTransactionSectionState extends State<_RecentTransactionSection> {
  List<String> titles = [
    'Drop Box',
    'Apple Pay',
    'LinkedIn',
  ];

  List<String> paymentDays = [
    '3 Days ago',
    '1 Week ago',
    '1 Month age',
  ];

  List<String> icons = [
    'icon_dropbox',
    'icon_apple',
    'icon_linkedin',
  ];

  List<String> prices = [
    '10.00',
    '8.50',
    '5.00',
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 13),
            child: CustomBox(
              height: 81,
              mediaQuery: widget.mediaQuery,
              child: Row(
                children: [
                  SvgPicture.asset(
                    icons[index].toSvg,
                    height: 51,
                    width: 51,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        titles[index],
                        style: const TextStyle(
                          fontFamily: 'SSB',
                          fontSize: 14,
                          color: AppColor.blackColor,
                        ),
                      ),
                      Text(
                        paymentDays[index],
                        style: const TextStyle(
                          fontFamily: 'SSB',
                          fontSize: 12,
                          color: AppColor.greyColor200,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$${prices[index]}',
                          style: const TextStyle(
                            fontFamily: 'SB',
                            fontSize: 20,
                            color: AppColor.blackColor,
                          ),
                        ),
                        const TextSpan(
                          text: 'USD',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 10,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: 3,
      ),
    );
  }
}
