import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/ui/login_screen.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingsScreen extends StatefulWidget {
  const OnboardingsScreen({
    super.key,
    required this.mediaQuery,
    required this.nav,
  });
  final MediaQueryHandler mediaQuery;
  final NavigatorHandler nav;

  @override
  State<OnboardingsScreen> createState() => _OnboardingsScreenState();
}

class _OnboardingsScreenState extends State<OnboardingsScreen> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            bottom: 122,
            child: SizedBox(
              height: 213,
              width: widget.mediaQuery.screenWidth(context),
              child: PageView(
                controller: controller,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 340,
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Manage Your Payments with  ',
                                style: TextStyle(
                                  fontFamily: 'SR',
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'mobile banking',
                                style: TextStyle(
                                  fontFamily: 'SR',
                                  fontSize: 35,
                                  color: AppColor.blueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 17),
                      const SizedBox(
                        width: 340,
                        height: 52,
                        child: Text(
                          'A convenient wat to manage your money securely from mobile device',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 16,
                            color: AppColor.greyColor400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 340,
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'A loan for every       dream with          ',
                                style: TextStyle(
                                  fontFamily: 'SR',
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'mobile banking',
                                style: TextStyle(
                                  fontFamily: 'SR',
                                  fontSize: 35,
                                  color: AppColor.blueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 17),
                      const SizedBox(
                        width: 340,
                        height: 52,
                        child: Text(
                          'A loan facility that provides you financial assistance whenever you need.',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 16,
                            color: AppColor.greyColor400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
            child: SizedBox(
              width: widget.mediaQuery.screenWidth(context),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 2,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 4,
                      dotWidth: 25,
                      spacing: 14,
                      dotColor: Color(0xff4F5962),
                      activeDotColor: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: ColoredBox(
                      color: const Color(0xff4F5962),
                      child: GestureDetector(
                        onTap: () {
                          if (controller.page! == 1) {
                            widget.nav.fadeNav(
                              context,
                              LoginScreen(
                                navigator: widget.nav,
                                mediaQuery: widget.mediaQuery,
                              ),
                            );
                          } else {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.ease,
                            );
                          }
                        },
                        child: const SizedBox(
                          height: 55,
                          width: 101,
                          child: Center(
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                fontFamily: 'SM',
                                fontSize: 20,
                                color: Colors.white,
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
          ),
          Stack(
            children: [
              Positioned(
                right: -55,
                top: 240,
                child: Image.asset(
                  'assets/images/onBoarding_card3.png',
                  height: 326,
                  width: 326,
                ),
              ),
              Positioned(
                right: 0,
                left: 10,
                top: 99,
                child: Image.asset(
                  'assets/images/onBoarding_card2.png',
                  height: 326,
                  width: 326,
                ),
              ),
              Positioned(
                left: -55,
                top: 0,
                child: Image.asset(
                  'assets/images/onBoarding_card1.png',
                  height: 272,
                  width: 272,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
