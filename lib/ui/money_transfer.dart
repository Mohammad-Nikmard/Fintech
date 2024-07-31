import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_grid_box.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MoneyTransferScreen extends StatefulWidget {
  const MoneyTransferScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<MoneyTransferScreen> createState() => _MoneyTransferScreenState();
}

class _MoneyTransferScreenState extends State<MoneyTransferScreen> {
  int progressIndicator = 0;
  String amount = '';
  String chosenUser = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              if (progressIndicator == 0) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: _MoneyTransferFields(
                    mediaQuery: widget.mediaQuery,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 1;
                      });
                    },
                    selectedUsser: (value) {
                      setState(() {
                        chosenUser = value;
                      });
                    },
                  ),
                ),
              },
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  title: (progressIndicator < 1)
                      ? 'Money Transfer'
                      : 'Confirmation',
                  leftIcon: (progressIndicator > 3)
                      ? 'my_photo.jpg'
                      : 'icon_arrow_left',
                  isLeftProfile: (progressIndicator > 3) ? true : false,
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

class _MoneyTransferFields extends StatefulWidget {
  const _MoneyTransferFields({
    required this.mediaQuery,
    required this.onTapped,
    required this.selectedUsser,
  });
  final VoidCallback onTapped;
  final ValueChanged<String> selectedUsser;
  final MediaQueryHandler mediaQuery;

  @override
  State<_MoneyTransferFields> createState() => __MoneyTransferFieldsState();
}

class __MoneyTransferFieldsState extends State<_MoneyTransferFields> {
  late TextEditingController nameController;
  late TextEditingController accountNumberController;
  late TextEditingController mobileNumberController;
  late TextEditingController purposeOfPaymentController;
  late TextEditingController passwordController;

  int selectedIndex = 0;

  bool visibleEye = true;

  List<String> nameList = [
    'Josh',
    'John',
    'Michele',
    'Mohammad',
  ];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    accountNumberController = TextEditingController();
    mobileNumberController = TextEditingController();
    purposeOfPaymentController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    accountNumberController.dispose();
    mobileNumberController.dispose();
    purposeOfPaymentController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              verticalPadding: 0,
              mediaQuery: widget.mediaQuery,
              hint: 'Search',
              controller: nameController,
              color: context.secondaryContainer,
              prefixIcon: SizedBox(
                height: 17,
                width: 17,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    'icon_search'.toSvg,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Recent transfers',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 122,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: CustomGridBox(
                      index: index,
                      selectedIndex: selectedIndex,
                      height: 122,
                      width: 112,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            nameList[index],
                            style: const TextStyle(
                              fontFamily: 'SM',
                              fontSize: 13,
                              color: AppColor.greyColor200,
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$ ',
                                  style: TextStyle(
                                    fontFamily: 'SM',
                                    fontSize: 16,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: '40.00',
                                  style: TextStyle(
                                    fontFamily: 'SB',
                                    fontSize: 18,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'USD',
                                  style: TextStyle(
                                    fontFamily: 'SM',
                                    fontSize: 8,
                                    color: AppColor.greyColor200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: nameList.length,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Make new transfer',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'Name',
              controller: nameController,
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'Enter Amount Number',
              controller: accountNumberController,
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: "Reciever's Mobile Number",
              controller: mobileNumberController,
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'Purpose of payment (Optional)',
              controller: purposeOfPaymentController,
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 60,
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
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: SvgPicture.asset(
                                  'icon_eye_off'.toSvg,
                                  colorFilter: const ColorFilter.mode(
                                    AppColor.greyColor200,
                                    BlendMode.srcIn,
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
                                size: 18.7,
                              ),
                            ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 22),
                      filled: true,
                      fillColor: context.secondaryContainer,
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
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(color: Colors.transparent),
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
                  color: context.secondaryContainer,
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
          const SizedBox(height: 35),
          SizedBox(
            height: 63,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.selectedUsser('');
                widget.onTapped();
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
