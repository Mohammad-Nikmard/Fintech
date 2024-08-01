import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/ui/onboardings.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    required this.mediaQuery,
    required this.nav,
  });
  final MediaQueryHandler mediaQuery;
  final NavigatorHandler nav;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      widget.nav.fadeNav(
        context,
        OnboardingsScreen(mediaQuery: widget.mediaQuery, nav: widget.nav),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Stack(
        children: [
          Transform.scale(
            scale: 7,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff27343f),
                ),
              ),
            ),
          ),
          Transform.scale(
            scale: 4.5,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff2b3842),
                ),
              ),
            ),
          ),
          Transform.scale(
            scale: 2.5,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff2f3b45),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
