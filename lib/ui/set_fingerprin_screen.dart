import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetFingerprintScreen extends StatefulWidget {
  const SetFingerprintScreen({super.key});

  @override
  State<SetFingerprintScreen> createState() => _SetFingerprintScreenState();
}

class _SetFingerprintScreenState extends State<SetFingerprintScreen> {
  bool value = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 5),
      () {
        setState(() {
          value = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 10,
            child: Transform.scale(
              scale: 3,
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff2a3641),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 50,
            child: Transform.scale(
              scale: 6,
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 132.41, right: 47, left: 47),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedCrossFade(
                  firstChild: const Center(
                    child: Text(
                      'Fingerprint',
                      key: Key('1'),
                      style: TextStyle(
                        fontFamily: 'SR',
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  secondChild: const Center(
                    child: Text(
                      'Scanning...',
                      key: Key('2'),
                      style: TextStyle(
                        fontFamily: 'SR',
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  crossFadeState: !value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstCurve: Curves.decelerate,
                  secondCurve: Curves.decelerate,
                  duration: const Duration(milliseconds: 500),
                ),
                const SizedBox(height: 14.69),
                AnimatedCrossFade(
                  firstChild: const Center(
                    child: Text(
                      'Place your finger in fingerprint sensor until the icon completely',
                      key: Key('1'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  secondChild: const Center(
                    child: Text(
                      'Once your scanning is complete, you will be able to sign in by using fingerprint',
                      key: Key('2'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  crossFadeState: !value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstCurve: Curves.decelerate,
                  secondCurve: Curves.decelerate,
                  duration: const Duration(milliseconds: 500),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SvgPicture.asset(
                    'icon_fingerprint'.toSvg,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
