import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReceiveNotif extends StatelessWidget {
  const ReceiveNotif({
    super.key,
    required this.amount,
    required this.picture,
    required this.sender,
    required this.mediaQuery,
  });
  final String picture;
  final String sender;
  final String amount;
  final MediaQueryHandler mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/$picture'),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: mediaQuery.screenWidth(context) - 135,
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'You received a payment of ',
                        style: TextStyle(
                          fontFamily: 'SM',
                          fontSize: 15,
                          color: AppColor.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: '\$$amount',
                        style: const TextStyle(
                          fontFamily: 'SB',
                          fontSize: 16,
                          color: AppColor.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: ' from $sender',
                        style: const TextStyle(
                          fontFamily: 'SM',
                          fontSize: 16,
                          color: AppColor.blackColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Divider(
          thickness: 1.5,
          color: context.secondaryContainer,
        ),
      ],
    );
  }
}

class RequestNotif extends StatelessWidget {
  const RequestNotif({
    super.key,
    required this.amount,
    required this.needy,
    required this.picture,
    required this.mediaQuery,
  });
  final String picture;
  final String needy;
  final String amount;
  final MediaQueryHandler mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/$picture'),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: mediaQuery.screenWidth(context) - 200,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: needy,
                        style: const TextStyle(
                          fontFamily: 'SB',
                          fontSize: 16,
                          color: AppColor.blackColor,
                        ),
                      ),
                      const TextSpan(
                        text: ' request a payment of ',
                        style: TextStyle(
                          fontFamily: 'SM',
                          fontSize: 15,
                          color: AppColor.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: '\$$amount',
                        style: const TextStyle(
                          fontFamily: 'SB',
                          fontSize: 16,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              const InkWell(
                splashColor: AppColor.greyColor200,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: SizedBox(
                    height: 30,
                    width: 60,
                    child: ColoredBox(
                      color: AppColor.blueColor,
                      child: Center(
                        child: Text(
                          'Pay',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Divider(
          thickness: 1.5,
          color: context.secondaryContainer,
        ),
      ],
    );
  }
}

class WarningNotif extends StatelessWidget {
  const WarningNotif({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColor.redLight,
                child: SizedBox(
                  height: 26,
                  width: 26,
                  child: Center(
                    child: SvgPicture.asset(
                      'icon_info_circle'.toSvg,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: mediaQuery.screenWidth(context) - 135,
                child: const Text(
                  'Your monthly expense almost break the budget',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 15,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Divider(
          thickness: 1.5,
          color: context.secondaryContainer,
        ),
      ],
    );
  }
}
