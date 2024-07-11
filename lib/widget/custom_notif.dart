import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReceiveNotif extends StatelessWidget {
  const ReceiveNotif({
    super.key,
    required this.amount,
    required this.picture,
    required this.sender,
  });
  final String picture;
  final String sender;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: AppColor.blueColor,
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: 252,
                child: Text(
                  'You received a payment of $amount from $sender',
                  style: const TextStyle(
                    fontFamily: 'SM',
                    fontSize: 16,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Divider(
          thickness: 1.5,
          color: Color(0xfff1f2f3),
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
              const CircleAvatar(
                radius: 30,
                backgroundColor: AppColor.blueColor,
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: mediaQuery.screenWidth(context) - 200,
                child: Text(
                  '$needy request a payment of $amount',
                  style: const TextStyle(
                    fontFamily: 'SM',
                    fontSize: 16,
                    color: AppColor.blackColor,
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
        const Divider(
          thickness: 1.5,
          color: Color(0xfff1f2f3),
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
                    fontSize: 16,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Divider(
          thickness: 1.5,
          color: Color(0xfff1f2f3),
        ),
      ],
    );
  }
}
