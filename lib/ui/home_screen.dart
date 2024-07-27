import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_box.dart';
import 'package:fintech/widget/custom_grid_box.dart';
import 'package:fintech/widget/custom_master_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

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
                    padding: const EdgeInsets.only(bottom: 25),
                    sliver: SliverToBoxAdapter(
                      child: _CardListSection(
                        mediaQuery: mediaQuery,
                      ),
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 25),
                    sliver: SliverToBoxAdapter(
                      child: _QuickActionSection(),
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 30),
                    sliver: SliverToBoxAdapter(
                      child: _ServicesSection(),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 15, left: 30),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        'Schedule Payments',
                        style: context.headlineMedium,
                      ),
                    ),
                  ),
                  _PaymentsSection(
                    mediaQuery: mediaQuery,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, right: 30, left: 30),
              child: CustomAppbar(
                title: 'Fintech',
                leftIcon: 'my_photo.jpg',
                isLeftProfile: true,
                rightIcon: 'icon_notification',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionSection extends StatefulWidget {
  const _QuickActionSection();

  @override
  State<_QuickActionSection> createState() => __QuickActionSectionState();
}

class __QuickActionSectionState extends State<_QuickActionSection> {
  List<String> actionList = [
    'Money Transfer',
    'Pay Bill',
    'Bank to Bank',
  ];

  List<Color> iconColors = [
    AppColor.greenDark,
    AppColor.blueColor,
    const Color(0xff8e949a),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 135,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CustomGridBox(
                        height: 133,
                        width: 141,
                        index: index,
                        selectedIndex: selectedIndex,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(7),
                              ),
                              child: SizedBox(
                                height: 48,
                                width: 48,
                                child: ColoredBox(
                                  color: iconColors[index].withOpacity(0.15),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      actionList[index].toSvg,
                                      colorFilter: ColorFilter.mode(
                                        iconColors[index],
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              actionList[index],
                              style: const TextStyle(
                                fontFamily: 'SSB',
                                fontSize: 16,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: actionList.length,
            ),
          ),
        ],
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
    controller = PageController(viewportFraction: 0.8);
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

class _ServicesSection extends StatefulWidget {
  const _ServicesSection();

  @override
  State<_ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<_ServicesSection> {
  int selectedIndex = 3;

  List<String> serviceList = [
    'Recharge',
    'Charity',
    'Loan',
    'Gifts',
    'Insurance',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 105,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: (selectedIndex == index)
                                  ? AppColor.blueColor
                                  : context.secondaryContainer,
                            ),
                            child: SizedBox(
                              height: 23,
                              width: 23,
                              child: Center(
                                child: SvgPicture.asset(
                                  serviceList[index].toSvg,
                                  colorFilter: ColorFilter.mode(
                                    (selectedIndex == index)
                                        ? Colors.white
                                        : AppColor.blueColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            serviceList[index],
                            style: const TextStyle(
                              fontFamily: 'SM',
                              fontSize: 13,
                              color: AppColor.greyColor200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: serviceList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentsSection extends StatelessWidget {
  const _PaymentsSection({
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomBox(
                height: 81,
                mediaQuery: mediaQuery,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      const ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: SizedBox(
                          height: 51,
                          width: 51,
                          child: ColoredBox(
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Netflix',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.blackColor,
                              fontFamily: 'SM',
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                'Next Payment: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.greyColor200,
                                  fontFamily: 'SM',
                                ),
                              ),
                              Text(
                                '12/04',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.blueColor,
                                  fontFamily: 'SM',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '\$',
                              style: TextStyle(
                                fontFamily: 'SM',
                                fontSize: 18,
                                color: AppColor.blackColor,
                              ),
                            ),
                            TextSpan(
                              text: '1.00',
                              style: TextStyle(
                                fontFamily: 'SB',
                                fontSize: 20,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomBox(
                height: 81,
                mediaQuery: mediaQuery,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      const ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: SizedBox(
                          height: 51,
                          width: 51,
                          child: ColoredBox(
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Paypal',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.blackColor,
                              fontFamily: 'SM',
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                'Next Payment: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.greyColor200,
                                  fontFamily: 'SM',
                                ),
                              ),
                              Text(
                                '14/04',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.blueColor,
                                  fontFamily: 'SM',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '\$',
                              style: TextStyle(
                                fontFamily: 'SM',
                                fontSize: 18,
                                color: AppColor.blackColor,
                              ),
                            ),
                            TextSpan(
                              text: '3.50',
                              style: TextStyle(
                                fontFamily: 'SB',
                                fontSize: 20,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomBox(
                height: 81,
                mediaQuery: mediaQuery,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      const ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: SizedBox(
                          height: 51,
                          width: 51,
                          child: ColoredBox(
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Spotify',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.blackColor,
                              fontFamily: 'SM',
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                'Next Payment: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.greyColor200,
                                  fontFamily: 'SM',
                                ),
                              ),
                              Text(
                                '13/04',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.blueColor,
                                  fontFamily: 'SM',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '\$',
                              style: TextStyle(
                                fontFamily: 'SM',
                                fontSize: 18,
                                color: AppColor.blackColor,
                              ),
                            ),
                            TextSpan(
                              text: '10.00',
                              style: TextStyle(
                                fontFamily: 'SB',
                                fontSize: 20,
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
          ],
        ),
      ),
    );
  }
}
