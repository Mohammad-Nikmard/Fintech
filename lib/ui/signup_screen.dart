import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController cnicController;
  late TextEditingController passwordController;

  bool visibleEye = true;

  bool conditionCheckmark = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    cnicController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    cnicController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 132.41, right: 47, left: 47),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 59),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Create Your Account',
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
                        hint: 'Name',
                        controller: nameController,
                      ),
                      const SizedBox(height: 25),
                      CustomTextField(
                        color: Colors.white,
                        mediaQuery: widget.mediaQuery,
                        hint: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(height: 25),
                      CustomTextField(
                        color: Colors.white,
                        mediaQuery: widget.mediaQuery,
                        hint: 'CNIC',
                        controller: cnicController,
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
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
                                              colorFilter:
                                                  const ColorFilter.mode(
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
                          const SizedBox(width: 17.25),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: ColoredBox(
                              color: Colors.white,
                              child: SizedBox(
                                height: 63,
                                width: 66,
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: SvgPicture.asset(
                                    'icon_fingerprint'.toSvg,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.1,
                            child: Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              side: const BorderSide(
                                color: Colors.white,
                                width: 1.3,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              activeColor: AppColor.blueColor,
                              checkColor: Colors.white,
                              value: conditionCheckmark,
                              onChanged: (value) {
                                setState(() {
                                  conditionCheckmark = !conditionCheckmark;
                                });
                              },
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'I agree with ',
                                  style: TextStyle(
                                    fontFamily: 'SM',
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: TextStyle(
                                    fontFamily: 'SM',
                                    fontSize: 18,
                                    color: AppColor.blueColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        height: 63,
                        width: widget.mediaQuery.screenWidth(context),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 26.4),
                      Center(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 18,
                                  color: AppColor.greyColor200,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
