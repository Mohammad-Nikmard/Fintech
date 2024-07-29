import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  int progressIndicator = 0;
  String donation = '';
  String amount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              if (progressIndicator == 0) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: _CharityList(
                    mediaQuery: widget.mediaQuery,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 1;
                      });
                    },
                    selectedCharity: (value) {
                      setState(() {
                        donation = value;
                      });
                    },
                  ),
                ),
              },
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  title: titleConditions(),
                  leftIcon: (progressIndicator > 2)
                      ? 'my_photo.jpg'
                      : 'icon_arrow_left',
                  isLeftProfile: (progressIndicator > 2) ? true : false,
                  rightIcon: 'icon_notification',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String titleConditions() {
    switch (progressIndicator) {
      case 0:
        return 'Charity';

      case 1:
        return 'Donation';

      case > 1:
        return 'Confirmation';

      default:
        return 'Charity';
    }
  }
}

class _CharityList extends StatefulWidget {
  const _CharityList({
    required this.mediaQuery,
    required this.onTapped,
    required this.selectedCharity,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;
  final ValueChanged<String> selectedCharity;

  @override
  State<_CharityList> createState() => _CharityListState();
}

class _CharityListState extends State<_CharityList> {
  List<String> charityList = [
    'Donate for Child Education',
    'Donate for Cancer Patients',
  ];

  List<String> ownerList = [
    'HEADS Foundation',
    'Core Club',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  width: widget.mediaQuery.screenWidth(context),
                  height: 368,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        spreadRadius: -18,
                        blurRadius: 25,
                        color: AppColor.greyColor200,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: SizedBox(
                              height: 221,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/${charityList[index].substring(11)}.png',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 20,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(7),
                              ),
                              child: SizedBox(
                                height: 35,
                                width: 95,
                                child: ColoredBox(
                                  color: (index == 0)
                                      ? const Color(0xff3a786a).withOpacity(0.5)
                                      : const Color(0xffe59b94)
                                          .withOpacity(0.5),
                                  child: Center(
                                    child: Text(
                                      (index == 0)
                                          ? '14 Days Left'
                                          : '2 Days Left',
                                      style: TextStyle(
                                        fontFamily: 'SM',
                                        fontSize: 16,
                                        color: (index == 0)
                                            ? AppColor.greenDark
                                            : AppColor.redDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      charityList[index],
                                      style: const TextStyle(
                                        fontFamily: 'SSB',
                                        fontSize: 20,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                    Text(
                                      'Arrange by ${ownerList[index]}',
                                      style: const TextStyle(
                                        fontFamily: 'SR',
                                        fontSize: 15,
                                        color: AppColor.greyColor200,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(7),
                                  ),
                                  child: SizedBox(
                                    height: 26,
                                    width: 44,
                                    child: ColoredBox(
                                      color: (index == 0)
                                          ? AppColor.redLight
                                          : AppColor.greenLight,
                                      child: Center(
                                        child: Text(
                                          (index == 0) ? '40%' : '60%',
                                          style: TextStyle(
                                            fontFamily: 'SM',
                                            fontSize: 16,
                                            color: (index == 0)
                                                ? AppColor.redDark
                                                : AppColor.greenDark,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Container(
                              width: widget.mediaQuery.screenWidth(context),
                              height: 6,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: context.secondaryContainer,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: (index == 0) ? 165 : 50),
                                  child: const ColoredBox(
                                    color: AppColor.blueColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$',
                                        style: TextStyle(
                                          fontFamily: 'SR',
                                          fontSize: 22,
                                          color: AppColor.greyColor200,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '10245.00',
                                        style: TextStyle(
                                          fontFamily: 'SB',
                                          fontSize: 22,
                                          color: AppColor.greyColor200,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'USD',
                                        style: TextStyle(
                                          fontFamily: 'SM',
                                          fontSize: 12,
                                          color: AppColor.greyColor200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: GestureDetector(
                                    onTap: () {
                                      widget
                                          .selectedCharity(charityList[index]);
                                      widget.onTapped();
                                    },
                                    child: const SizedBox(
                                      height: 32,
                                      width: 102,
                                      child: ColoredBox(
                                        color: AppColor.blueColor,
                                        child: Center(
                                          child: Text(
                                            'Donate',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: charityList.length,
          ),
        ),
      ],
    );
  }
}
