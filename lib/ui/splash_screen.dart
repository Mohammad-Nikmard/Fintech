import 'package:fintech/constatns/color_constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
