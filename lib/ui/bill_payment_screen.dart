import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_payment_confirmation.dart';
import 'package:fintech/widget/custom_selection_box.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BillPaymentScreen extends StatefulWidget {
  const BillPaymentScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<BillPaymentScreen> createState() => _BillPaymentScreenState();
}

class _BillPaymentScreenState extends State<BillPaymentScreen> {
  int progressIndicator = 0;
  String tappedIconPath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              if (progressIndicator == 0) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: _BillPaymentFields(
                    tappedIcon: (value) {
                      setState(() {
                        tappedIconPath = value;
                      });
                    },
                    mediaQuery: widget.mediaQuery,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 1;
                      });
                    },
                  ),
                ),
              } else if (progressIndicator == 1) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: CustomPaymentConfirmation(
                    buttonText: 'Pay Now',
                    secondRowDescription: const Row(
                      children: [
                        Text(
                          'Due Date',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 18,
                            color: AppColor.greyColor200,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'September 10,2024',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 18,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ],
                    ),
                    firstRowDescription: const Row(
                      children: [
                        Text(
                          'Bill Number',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 18,
                            color: AppColor.greyColor200,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '12569874564',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 18,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ],
                    ),
                    amount: '350.00',
                    paymentStatus: 'Unpaid',
                    icon: Positioned(
                      top: -45,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: AppColor.blackColor,
                        child: SvgPicture.asset(
                          tappedIconPath,
                          height: 36,
                          width: 36,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    text:
                        'Please make sure that you want to pay electricity bill',
                    mediaQuery: widget.mediaQuery,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 2;
                      });
                    },
                  ),
                )
              } else if (progressIndicator == 2)
                ...{},
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  title: (progressIndicator > 0) ? 'Confirmation' : 'Pay Bill',
                  leftIcon: (progressIndicator > 1)
                      ? 'my_photo.jpg'
                      : 'icon_arrow_left',
                  isLeftProfile: (progressIndicator > 1) ? true : false,
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

class _BillPaymentFields extends StatefulWidget {
  const _BillPaymentFields({
    required this.mediaQuery,
    required this.onTapped,
    required this.tappedIcon,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;
  final ValueChanged<String> tappedIcon;

  @override
  State<_BillPaymentFields> createState() => __BillPaymentFieldsState();
}

class __BillPaymentFieldsState extends State<_BillPaymentFields> {
  int selectedIndex = 0;
  bool visibleEye = false;

  List<String> billList = [
    'Internet Bill',
    'Electricity Bill',
    'Water Bill',
    'Other',
  ];

  List<Color> boxColors = [
    AppColor.greenLight,
    AppColor.redLight,
    AppColor.blueLight,
    const Color(0xfff1f2f3),
  ];

  List<Color> iconColors = [
    AppColor.greenDark,
    AppColor.redDark,
    AppColor.blueColor,
    const Color(0xff8e949a),
  ];

  late TextEditingController companyNameController;
  late TextEditingController refrenceNumberController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    companyNameController = TextEditingController();
    refrenceNumberController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    companyNameController.dispose();
    refrenceNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Bills',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 310,
            width: widget.mediaQuery.screenWidth(context),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: CustomSelectionBox(
                      height: 64,
                      width: widget.mediaQuery.screenWidth(context),
                      index: index,
                      selectedIndex: selectedIndex,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: ColoredBox(
                                color: boxColors[index],
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(
                                    billList[index].toSvg,
                                    colorFilter: ColorFilter.mode(
                                      iconColors[index],
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            billList[index],
                            style: const TextStyle(
                              fontFamily: 'SM',
                              fontSize: 16,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: billList.length,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Fill Details',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'Company Name',
              controller: companyNameController,
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'Reference Number',
              controller: refrenceNumberController,
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
            width: widget.mediaQuery.screenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                widget.tappedIcon(billList[selectedIndex].toSvg);
                widget.onTapped();
              },
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
        ],
      ),
    );
  }
}
