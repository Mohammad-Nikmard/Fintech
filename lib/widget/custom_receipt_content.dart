import 'package:fintech/constatns/color_constants.dart';
import 'package:flutter/material.dart';

class CustomReceiptContent extends StatelessWidget {
  const CustomReceiptContent({
    super.key,
    required this.amount,
    required this.title,
    required this.firstRowContent,
    required this.secondRowContent,
    required this.icon,
    required this.subtitle,
  });
  final String amount;
  final String title;
  final String subtitle;
  final Widget firstRowContent;
  final Widget secondRowContent;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          height: 400,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 55),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'SSB',
                    fontSize: 26,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColor.greyColor200,
                    fontFamily: 'SM',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: SizedBox(
                        height: 38,
                        width: 249,
                        child: ColoredBox(
                          color: AppColor.greenLight,
                          child: const Center(
                            child: Text(
                              'Transaction Status: Paid',
                              style: TextStyle(
                                fontFamily: 'SSB',
                                fontSize: 16,
                                color: AppColor.greenDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontFamily: 'SR',
                              fontSize: 36,
                              color: AppColor.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: amount,
                            style: const TextStyle(
                              fontFamily: 'SB',
                              fontSize: 36,
                              color: AppColor.blackColor,
                            ),
                          ),
                          const TextSpan(
                            text: 'USD',
                            style: TextStyle(
                              fontFamily: 'SSB',
                              fontSize: 18,
                              color: AppColor.greyColor200,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        firstRowContent,
                        const SizedBox(height: 15),
                        const Divider(
                          height: 0,
                          thickness: 1.5,
                          color: Color(0xffe5e7e9),
                        ),
                        const SizedBox(height: 15),
                        secondRowContent,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        icon,
      ],
    );
  }
}
