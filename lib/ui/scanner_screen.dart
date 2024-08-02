import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  nav: nav,
                  mediaQuery: mediaQuery,
                  title: 'QR Scan',
                  leftIcon: 'my_photo.jpg',
                  isLeftProfile: true,
                  rightIcon: 'icon_notification',
                ),
              ),
              const SizedBox(height: 85),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    'barcode_frame'.toSvg,
                    height: 223,
                    width: 223,
                  ),
                  Positioned(
                    top: -15,
                    left: -15,
                    child: SvgPicture.asset(
                      'barcode_stroke'.toSvg,
                      height: 45,
                      width: 45,
                    ),
                  ),
                  Positioned(
                    right: -15,
                    top: -15,
                    child: RotatedBox(
                      quarterTurns: 45,
                      child: SvgPicture.asset(
                        'barcode_stroke'.toSvg,
                        height: 45,
                        width: 45,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -15,
                    left: -15,
                    child: RotatedBox(
                      quarterTurns: 135,
                      child: SvgPicture.asset(
                        'barcode_stroke'.toSvg,
                        height: 45,
                        width: 45,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -15,
                    right: -15,
                    child: RotatedBox(
                      quarterTurns: 90,
                      child: SvgPicture.asset(
                        'barcode_stroke'.toSvg,
                        height: 45,
                        width: 45,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 45),
              const Text(
                'The QR code will be automatically deteceted when you place the QR code inside the frame',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SR',
                  fontSize: 18,
                  color: AppColor.greyColor200,
                ),
              ),
              const SizedBox(height: 35),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.secondaryContainer,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    'icon_refresh'.toSvg,
                    colorFilter: const ColorFilter.mode(
                      Color(0xff565866),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  height: 63,
                  width: mediaQuery.screenWidth(context),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Scan Item',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
