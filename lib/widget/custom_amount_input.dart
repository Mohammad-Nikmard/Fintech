import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAmountInputSheet extends StatefulWidget {
  const CustomAmountInputSheet({
    super.key,
    required this.mediaQuery,
    required this.eneterdAmount,
    required this.onTapped,
  });
  final MediaQueryHandler mediaQuery;
  final ValueChanged<String> eneterdAmount;
  final VoidCallback onTapped;

  @override
  State<CustomAmountInputSheet> createState() => _CustomAmountInputSheetState();
}

class _CustomAmountInputSheetState extends State<CustomAmountInputSheet> {
  late TextEditingController amountController;
  int quickActionIndex = 0;

  List<String> priceList = [
    '\$50',
    '\$100',
    '\$150',
    '\$200',
    '\$250',
  ];

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController(text: '\$');
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 770,
      width: widget.mediaQuery.screenWidth(context),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Enter Amount',
                    style: context.headlineMedium,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'icon_close'.toSvg,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 65,
              width: widget.mediaQuery.screenWidth(context),
              child: TextField(
                style: const TextStyle(
                  fontFamily: 'SB',
                  fontSize: 28,
                  color: AppColor.blueColor,
                ),
                controller: amountController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(
                      color: AppColor.blueColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(
                      color: AppColor.blueColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Quick Actions',
              style: context.headlineMedium,
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          quickActionIndex = index;
                          amountController.text = priceList[quickActionIndex];
                        });
                      },
                      child: Container(
                        height: 48,
                        width: 114,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                          color: (quickActionIndex == index)
                              ? Colors.transparent
                              : context.secondaryContainer,
                          border: Border.all(
                            color: (quickActionIndex == index)
                                ? AppColor.blueColor
                                : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            priceList[index],
                            style: const TextStyle(
                              fontFamily: 'SM',
                              fontSize: 22,
                              color: AppColor.greyColor200,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: priceList.length,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: SizedBox(
                height: 63,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    widget.eneterdAmount('${amountController.text}.00');
                    Navigator.pop(context);
                    widget.onTapped();
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      button('1'),
                      button('2'),
                      button('3'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      button('4'),
                      button('5'),
                      button('6'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      button('7'),
                      button('8'),
                      button('9'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: const CircleBorder(),
                            backgroundColor: AppColor.blueColor,
                          ),
                          onPressed: () {
                            setState(() {
                              amountController.text = '\$';
                            });
                          },
                          child: SvgPicture.asset(
                            'icon_close'.toSvg,
                            height: 14,
                            width: 14,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      button('0'),
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: const CircleBorder(),
                            backgroundColor: AppColor.blueColor,
                          ),
                          onPressed: () {
                            if (amountController.text.length > 1) {
                              setState(() {
                                amountController.text = amountController.text
                                    .substring(
                                        0, amountController.text.length - 1);
                              });
                            }
                          },
                          child: SvgPicture.asset(
                            'icon_arrow_right'.toSvg,
                            height: 21,
                            width: 21,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
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
  }

  Widget button(String text) {
    return SizedBox(
      height: 70,
      width: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const CircleBorder(),
          backgroundColor: context.secondaryContainer,
        ),
        onPressed: () {
          setState(() {
            amountController.text += text;
          });
        },
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'SR',
            color: AppColor.greyColor200,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
