import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class SendGiftScreen extends StatefulWidget {
  const SendGiftScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<SendGiftScreen> createState() => _SendGiftScreenState();
}

class _SendGiftScreenState extends State<SendGiftScreen> {
  int progressIndicator = 0;
  String gift = '';
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
                  child: _GiftList(
                    mediaQuery: widget.mediaQuery,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 1;
                      });
                    },
                    selectedGift: (value) {
                      setState(() {
                        gift = value;
                      });
                    },
                  ),
                ),
              },
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  title: (progressIndicator < 1) ? 'Gift' : 'Confirmation',
                  leftIcon: (progressIndicator > 3)
                      ? 'my_photo.jpg'
                      : 'icon_arrow_left',
                  isLeftProfile: (progressIndicator > 3) ? true : false,
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

class _GiftList extends StatefulWidget {
  const _GiftList({
    required this.mediaQuery,
    required this.onTapped,
    required this.selectedGift,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;
  final ValueChanged<String> selectedGift;

  @override
  State<_GiftList> createState() => _GiftListState();
}

class _GiftListState extends State<_GiftList> {
  List<String> giftList = [
    'Eid Gift',
    'Birthday Gift',
    'Marriage Gift',
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
                  height: 352,
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
                                'assets/images/${giftList[index]}.png',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              giftList[index],
                              style: const TextStyle(
                                fontFamily: 'SSB',
                                fontSize: 20,
                                color: AppColor.blackColor,
                              ),
                            ),
                            Text(
                              'Send ${giftList[index]} to your loved ones',
                              style: const TextStyle(
                                fontFamily: 'SR',
                                fontSize: 15,
                                color: AppColor.greyColor200,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Get ',
                                      style: TextStyle(
                                        fontFamily: 'SM',
                                        fontSize: 20,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                    Text(
                                      '10% ',
                                      style: TextStyle(
                                        fontFamily: 'SM',
                                        fontSize: 20,
                                        color: AppColor.blueColor,
                                      ),
                                    ),
                                    Text(
                                      'Cashback',
                                      style: TextStyle(
                                        fontFamily: 'SM',
                                        fontSize: 20,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.selectedGift(giftList[index]);
                                      widget.onTapped();
                                    },
                                    child: const SizedBox(
                                      height: 32,
                                      width: 82,
                                      child: ColoredBox(
                                        color: AppColor.blueColor,
                                        child: Center(
                                          child: Text(
                                            'Send',
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
            itemCount: giftList.length,
          ),
        ),
      ],
    );
  }
}
