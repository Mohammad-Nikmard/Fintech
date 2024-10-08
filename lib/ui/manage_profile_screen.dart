import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';

class ManageProfileScreen extends StatelessWidget {
  const ManageProfileScreen({
    super.key,
    required this.mediaQuery,
    required this.nav,
  });
  final MediaQueryHandler mediaQuery;
  final NavigatorHandler nav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 91,
                          width: 91,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('my_photo'.toJpg),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: -2,
                          child: Container(
                            height: 21,
                            width: 21,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.blueColor,
                              border:
                                  Border.all(width: 1.3, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'Mohammad',
                      style: TextStyle(
                        fontFamily: 'SB',
                        fontSize: 20,
                        color: AppColor.blueColor,
                      ),
                    ),
                    const Text(
                      'Iran',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 16,
                        color: AppColor.greyColor200,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _FieldsSection(mediaQuery: mediaQuery),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  nav: nav,
                  mediaQuery: mediaQuery,
                  title: 'Profile',
                  leftIcon: 'icon_arrow_left',
                  rightIcon: 'icon_notification',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldsSection extends StatefulWidget {
  const _FieldsSection({
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<_FieldsSection> createState() => __FieldsSectionState();
}

class __FieldsSectionState extends State<_FieldsSection> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController mobileController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: 'Mohammad');
    emailController = TextEditingController(text: 'mnikmard1344@gmail.com');
    mobileController = TextEditingController(text: '+98 9377964183');
    passwordController = TextEditingController(text: '123456789');
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Name',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          textColor: AppColor.greyColor200,
          mediaQuery: widget.mediaQuery,
          hint: '',
          controller: nameController,
          color: context.secondaryContainer,
        ),
        const SizedBox(height: 20),
        Text(
          'Email',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          textColor: AppColor.greyColor200,
          mediaQuery: widget.mediaQuery,
          hint: '',
          controller: emailController,
          color: context.secondaryContainer,
        ),
        const SizedBox(height: 20),
        Text(
          'Mobile Number',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          textColor: AppColor.greyColor200,
          mediaQuery: widget.mediaQuery,
          hint: '',
          controller: mobileController,
          color: context.secondaryContainer,
        ),
        const SizedBox(height: 20),
        Text(
          'Password',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          maxLines: 1,
          textColor: AppColor.greyColor200,
          showText: true,
          mediaQuery: widget.mediaQuery,
          hint: '',
          controller: passwordController,
          color: context.secondaryContainer,
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(right: 26, left: 26, bottom: 30),
          child: SizedBox(
            height: 63,
            width: widget.mediaQuery.screenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
