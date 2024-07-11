import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController mobileController;
  late TextEditingController cnicController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    mobileController = TextEditingController();
    cnicController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    cnicController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Enter your details',
                        style: TextStyle(
                          fontFamily: 'SSB',
                          fontSize: 19,
                          color: AppColor.blackColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        textColor: AppColor.greyColor200,
                        mediaQuery: widget.mediaQuery,
                        hint: 'First Name',
                        controller: firstNameController,
                        color: const Color(0xfff1f2f3),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        textColor: AppColor.greyColor200,
                        mediaQuery: widget.mediaQuery,
                        hint: 'Last Name',
                        controller: lastNameController,
                        color: const Color(0xfff1f2f3),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        textColor: AppColor.greyColor200,
                        mediaQuery: widget.mediaQuery,
                        hint: 'Mobile Number',
                        controller: mobileController,
                        color: const Color(0xfff1f2f3),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        textColor: AppColor.greyColor200,
                        mediaQuery: widget.mediaQuery,
                        hint: 'CNIC',
                        controller: cnicController,
                        color: const Color(0xfff1f2f3),
                      ),
                      const SizedBox(height: 31),
                      const Text(
                        'Enter your complain',
                        style: TextStyle(
                          fontFamily: 'SSB',
                          fontSize: 19,
                          color: AppColor.blackColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        maxLines: 5,
                        textColor: AppColor.greyColor200,
                        mediaQuery: widget.mediaQuery,
                        hint: 'Type your message here...',
                        controller: cnicController,
                        color: const Color(0xfff1f2f3),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 26, vertical: 30),
                        child: SizedBox(
                          height: 63,
                          width: widget.mediaQuery.screenWidth(context),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Send',
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
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  title: 'Complain',
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
