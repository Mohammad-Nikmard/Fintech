import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:flutter/material.dart';

class CustomPaymentConfirmation extends StatelessWidget {
  const CustomPaymentConfirmation({
    super.key,
    required this.mediaQuery,
    required this.onTapped,
    required this.text,
    required this.icon,
    required this.paymentStatus,
    required this.amount,
    required this.firstRowDescription,
    required this.secondRowDescription,
    required this.buttonText,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;
  final String text;
  final Widget icon;
  final String paymentStatus;
  final String amount;
  final Widget firstRowDescription;
  final Widget secondRowDescription;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'Are you sure?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SSB',
              fontSize: 32,
              color: AppColor.blueColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'SM',
              fontSize: 18,
              color: AppColor.greyColor200,
            ),
          ),
        ),
        const SizedBox(height: 70),
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: SizedBox(
                height: 369,
                width: mediaQuery.screenWidth(context),
                child: ColoredBox(
                  color: context.secondaryContainer,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 56),
                    child: Column(
                      children: [
                        const Text(
                          'Mohammad Nikmard',
                          style: TextStyle(
                            fontFamily: 'SSB',
                            fontSize: 26,
                            color: AppColor.blackColor,
                          ),
                        ),
                        const Text(
                          '*******4183',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 16,
                            color: AppColor.greyColor200,
                          ),
                        ),
                        const SizedBox(height: 15),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: SizedBox(
                            height: 38,
                            width: 249,
                            child: ColoredBox(
                              color: AppColor.redLight,
                              child: Center(
                                child: Text(
                                  'Transaction Status: $paymentStatus',
                                  style: const TextStyle(
                                    fontFamily: 'SSB',
                                    fontSize: 16,
                                    color: AppColor.redDark,
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
                            firstRowDescription,
                            const SizedBox(height: 15),
                            const Divider(
                              height: 0,
                              thickness: 1.5,
                              color: Color(0xffe5e7e9),
                            ),
                            const SizedBox(height: 15),
                            secondRowDescription,
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            icon,
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 63,
            width: mediaQuery.screenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                onTapped();
              },
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
