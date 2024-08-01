import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/ui/set_fingerprin_screen.dart';
import 'package:fintech/ui/signup_screen.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.mediaQuery,
    required this.navigator,
  });
  final MediaQueryHandler mediaQuery;
  final NavigatorHandler navigator;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  bool visibleEye = true;

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    userIdController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      resizeToAvoidBottomInset: false,
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
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 132.41, right: 47, left: 47),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 59),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'Login to your account',
                        style: TextStyle(
                          fontFamily: 'SR',
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      color: Colors.white,
                      mediaQuery: widget.mediaQuery,
                      hint: 'User Id',
                      controller: userIdController,
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: widget.mediaQuery.screenWidth(context),
                      child: TextField(
                        controller: passwordController,
                        style: const TextStyle(
                          fontFamily: 'SM',
                          fontSize: 16,
                          color: AppColor.blackColor,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: visibleEye
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      visibleEye = !visibleEye;
                                    });
                                  },
                                  child: SizedBox(
                                    height: 22.7,
                                    width: 22.7,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'icon_eye_off'.toSvg,
                                        colorFilter: const ColorFilter.mode(
                                          AppColor.greyColor200,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      visibleEye = !visibleEye;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove_red_eye,
                                    color: AppColor.greyColor200,
                                    size: 22.7,
                                  ),
                                ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 23, vertical: 22),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            fontFamily: 'SM',
                            fontSize: 16,
                            color: AppColor.greyColor200,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 63,
                      width: widget.mediaQuery.screenWidth(context),
                      child: ElevatedButton(
                        onPressed: () => widget.navigator.fadeNav(
                          context,
                          SetFingerprintScreen(
                            navigator: widget.navigator,
                            mediaQuery: widget.mediaQuery,
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Forget User / Password?',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 18,
                        color: AppColor.greyColor200,
                      ),
                    ),
                    const SizedBox(height: 42),
                    SvgPicture.asset(
                      'icon_fingerprint'.toSvg,
                    ),
                    const SizedBox(height: 29),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 18,
                              color: AppColor.greyColor200,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => widget.navigator.fadeNav(
                              context,
                              SignUpScreen(
                                mediaQuery: widget.mediaQuery,
                                navigator: widget.navigator,
                              ),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'SM',
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
