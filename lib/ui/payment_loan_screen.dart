import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_box.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PaymentLoanScreen extends StatefulWidget {
  const PaymentLoanScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<PaymentLoanScreen> createState() => _PaymentLoanScreenState();
}

class _PaymentLoanScreenState extends State<PaymentLoanScreen> {
  int progressIndicator = 0;
  String passedLoanValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (progressIndicator == 0) ...{
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: _LoanScreenContent(
                          mediaQuery: widget.mediaQuery,
                          onTapped: () {
                            setState(() {
                              progressIndicator = 1;
                            });
                          },
                          tappedValue: (value) {
                            setState(() {
                              passedLoanValue = value;
                            });
                          },
                        ),
                      ),
                    } else if (progressIndicator == 1) ...{
                      _InformationSection(
                        loanValue: passedLoanValue,
                        mediaQuery: widget.mediaQuery,
                        onTapped: () {
                          setState(() {
                            progressIndicator = 2;
                          });
                        },
                      )
                    } else if (progressIndicator == 2) ...{
                      _LoanDescriptionSection(
                        mediaQuery: widget.mediaQuery,
                        onTapped: () {
                          setState(() {
                            progressIndicator = 3;
                          });
                        },
                      ),
                    } else if (progressIndicator == 3) ...{
                      _PaymentSuccessSection(
                        mediaQuery: widget.mediaQuery,
                        onTapped: () {
                          setState(() {
                            progressIndicator = 0;
                          });
                        },
                      ),
                    }
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
              child: CustomAppbar(
                title: (progressIndicator == 0 || progressIndicator == 3)
                    ? 'Loan'
                    : 'Payment Plan',
                leftIcon: 'icon_arrow_left',
                rightIcon: 'icon_notification',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoanScreenContent extends StatelessWidget {
  const _LoanScreenContent({
    required this.mediaQuery,
    required this.onTapped,
    required this.tappedValue,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;
  final ValueChanged<String> tappedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Car Loan',
            style: TextStyle(
              fontFamily: 'SSB',
              fontSize: 15,
              color: context.secondaryContainer,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '\$',
                    style: TextStyle(
                      fontFamily: 'SR',
                      fontSize: 34,
                      color: AppColor.blackColor,
                    ),
                  ),
                  TextSpan(
                    text: '6000',
                    style: TextStyle(
                      fontFamily: 'SB',
                      fontSize: 34,
                      color: AppColor.blackColor,
                    ),
                  ),
                  TextSpan(
                    text: '.76',
                    style: TextStyle(
                      fontFamily: 'SM',
                      fontSize: 18,
                      color: AppColor.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            SvgPicture.asset(
              'us_vector'.toSvg,
              height: 17,
              width: 17,
            ),
          ],
        ),
        const SizedBox(height: 30),
        Center(
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.redLight,
            ),
            child: const Center(
              child: Text(
                '50%',
                style: TextStyle(
                  fontFamily: 'SSB',
                  fontSize: 32,
                  color: AppColor.blackColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 68,
          width: mediaQuery.screenWidth(context),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 68,
              crossAxisSpacing: 8,
            ),
            children: [
              reportBox(
                title: 'Total',
                amount: '\$ 6000.00',
                amountColor: AppColor.blueColor,
                boxColor: AppColor.blueLight,
              ),
              reportBox(
                title: 'Paid',
                amount: '\$ 2000.00',
                amountColor: AppColor.greenDark,
                boxColor: AppColor.greenLight,
              ),
              reportBox(
                title: 'Due',
                amount: '\$ 2000.00',
                amountColor: AppColor.redDark,
                boxColor: AppColor.redLight,
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'Recomended Loan',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 15),
        _RecommendedLoanBox(
          mediaQuery: mediaQuery,
          amount: '12000.00',
          icon: 'icon_home',
          iconBoxColor: AppColor.greenLight,
          iconColor: AppColor.greenDark,
          title: 'Home Loan',
          onTapped: (value) {
            tappedValue(value);
            onTapped();
          },
        ),
        const SizedBox(height: 15),
        _RecommendedLoanBox(
          mediaQuery: mediaQuery,
          amount: '15000.00',
          icon: 'icon_business_loan',
          iconBoxColor: AppColor.redLight,
          iconColor: AppColor.redDark,
          title: 'Business Loan',
          onTapped: (value) {
            tappedValue(value);
            onTapped();
          },
        ),
        const SizedBox(height: 15),
        _RecommendedLoanBox(
          mediaQuery: mediaQuery,
          amount: '8000.00',
          icon: 'icon_education_loan',
          iconBoxColor: AppColor.blueLight,
          iconColor: AppColor.blueColor,
          title: 'Education Loan',
          onTapped: (value) {
            tappedValue(value);
            onTapped();
          },
        ),
        const SizedBox(height: 15),
        _RecommendedLoanBox(
          mediaQuery: mediaQuery,
          amount: '8000.00',
          icon: 'icon_car_loan',
          iconBoxColor: AppColor.yellowLight,
          iconColor: AppColor.yellowDark,
          title: 'Car Loan',
          onTapped: (value) {
            tappedValue(value);
            onTapped();
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget reportBox({
    required String amount,
    required Color amountColor,
    required Color boxColor,
    required String title,
  }) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      child: ColoredBox(
        color: boxColor,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'SM',
                    fontSize: 16,
                    color: AppColor.blackColor,
                  ),
                ),
                Text(
                  amount,
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 16,
                    color: amountColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RecommendedLoanBox extends StatelessWidget {
  const _RecommendedLoanBox({
    required this.mediaQuery,
    required this.amount,
    required this.icon,
    required this.iconBoxColor,
    required this.iconColor,
    required this.title,
    required this.onTapped,
  });
  final MediaQueryHandler mediaQuery;
  final String title;
  final String amount;
  final String icon;
  final Color iconColor;
  final Color iconBoxColor;
  final ValueChanged<String> onTapped;
  @override
  Widget build(BuildContext context) {
    return CustomBox(
      height: 91,
      mediaQuery: mediaQuery,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            child: ColoredBox(
              color: iconBoxColor,
              child: SizedBox(
                height: 50,
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    icon.toSvg,
                    colorFilter: ColorFilter.mode(
                      iconColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'SSB',
                  fontSize: 20,
                  color: AppColor.blackColor,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Amount: ',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 12,
                        color: AppColor.greyColor200,
                      ),
                    ),
                    TextSpan(
                      text: '\$ $amount',
                      style: const TextStyle(
                        fontFamily: 'SM',
                        fontSize: 12,
                        color: AppColor.blueColor,
                      ),
                    ),
                    const TextSpan(
                      text: 'USD',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 8,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              onTapped(title);
            },
            child: const ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
              child: ColoredBox(
                color: AppColor.blueColor,
                child: SizedBox(
                  height: 32,
                  width: 80,
                  child: Center(
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 16,
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
    );
  }
}

class _InformationSection extends StatefulWidget {
  const _InformationSection({
    required this.mediaQuery,
    required this.onTapped,
    required this.loanValue,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;
  final String loanValue;

  @override
  State<_InformationSection> createState() => _InformationSectionState();
}

class _InformationSectionState extends State<_InformationSection> {
  int selectedIndexOfDuration = 0;
  bool visibleEye = true;
  Map<String, dynamic> loanValueContent = {};
  List<String> durationList = [
    '6 Months',
    '8 Months',
    '10 Months',
    '12 Months',
    '18 Months',
    '24 Months',
  ];

  late TextEditingController nameController;
  late TextEditingController cnicController;
  late TextEditingController mobileController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    cnicController = TextEditingController();
    mobileController = TextEditingController();
    passwordController = TextEditingController();

    loanValueContent = widget.loanValue.loanValueCalculator;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    cnicController.dispose();
    mobileController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomBox(
            height: 90,
            mediaQuery: widget.mediaQuery,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: ColoredBox(
                    color: loanValueContent['iconBoxColor'],
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset(
                          'assets/images/${loanValueContent['icon']}.svg',
                          colorFilter: ColorFilter.mode(
                            loanValueContent['iconColor'],
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      widget.loanValue,
                      style: const TextStyle(
                        fontFamily: 'SSB',
                        fontSize: 20,
                        color: AppColor.blackColor,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Amount: ',
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 12,
                              color: AppColor.greyColor200,
                            ),
                          ),
                          TextSpan(
                            text: '\$ ${loanValueContent['amount']}',
                            style: const TextStyle(
                              fontFamily: 'SM',
                              fontSize: 12,
                              color: AppColor.blueColor,
                            ),
                          ),
                          const TextSpan(
                            text: 'USD',
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 8,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Duration',
            style: context.headlineMedium,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexOfDuration = index;
                    });
                  },
                  child: Container(
                    height: 48,
                    width: 114,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7),
                      ),
                      color: (selectedIndexOfDuration == index)
                          ? Colors.transparent
                          : context.secondaryContainer,
                      border: Border.all(
                        width: 1.3,
                        color: (selectedIndexOfDuration == index)
                            ? AppColor.blueColor
                            : Colors.transparent,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        durationList[index],
                        style: TextStyle(
                          fontFamily: 'SM',
                          fontSize: 18,
                          color: (selectedIndexOfDuration == index)
                              ? AppColor.blueColor
                              : AppColor.greyColor200,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: durationList.length,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Your Information',
                style: context.headlineMedium,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                mediaQuery: widget.mediaQuery,
                hint: 'Name',
                controller: nameController,
                color: context.secondaryContainer,
              ),
              const SizedBox(height: 9),
              CustomTextField(
                mediaQuery: widget.mediaQuery,
                hint: 'CNIC',
                controller: cnicController,
                color: context.secondaryContainer,
              ),
              const SizedBox(height: 9),
              CustomTextField(
                mediaQuery: widget.mediaQuery,
                hint: 'Mobile',
                controller: mobileController,
                color: context.secondaryContainer,
              ),
              const SizedBox(height: 9),
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
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: SizedBox(
                  height: 63,
                  width: widget.mediaQuery.screenWidth(context),
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onTapped();
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LoanDescriptionSection extends StatefulWidget {
  const _LoanDescriptionSection({
    required this.mediaQuery,
    required this.onTapped,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;

  @override
  State<_LoanDescriptionSection> createState() =>
      __LoanDescriptionSectionState();
}

class __LoanDescriptionSectionState extends State<_LoanDescriptionSection> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Reckoning',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: ColoredBox(
              color: context.secondaryContainer,
              child: SizedBox(
                height: 194,
                width: widget.mediaQuery.screenWidth(context),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Loan Amount',
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 18,
                              color: AppColor.greyColor200,
                            ),
                          ),
                          const Spacer(),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                    fontFamily: 'SR',
                                    fontSize: 22,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: '12.5800.00',
                                  style: TextStyle(
                                    fontFamily: 'SB',
                                    fontSize: 20,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'USD',
                                  style: TextStyle(
                                    fontFamily: 'SM',
                                    fontSize: 10,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        thickness: 1.5,
                        color: Color(0xffe5e7e9),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            'Intrest',
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 18,
                              color: AppColor.greyColor200,
                            ),
                          ),
                          const Spacer(),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                    fontFamily: 'SR',
                                    fontSize: 22,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: '4800.00',
                                  style: TextStyle(
                                    fontFamily: 'SB',
                                    fontSize: 20,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'USD',
                                  style: TextStyle(
                                    fontFamily: 'SM',
                                    fontSize: 10,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        thickness: 1.5,
                        color: Color(0xffe5e7e9),
                      ),
                      const SizedBox(height: 10),
                      const Row(
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
                            'Nov 12, 2024',
                            style: TextStyle(
                              fontFamily: 'SB',
                              fontSize: 20,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Payment Breakdown',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 15),
          CustomBox(
            height: 50,
            mediaQuery: widget.mediaQuery,
            child: const Row(
              children: [
                Text(
                  'Upcoming Payment',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 17,
                    color: AppColor.greyColor200,
                  ),
                ),
                Spacer(),
                Text(
                  '12 Jan',
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 20,
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          CustomBox(
            height: 50,
            mediaQuery: widget.mediaQuery,
            child: Row(
              children: [
                const Text(
                  'Amount',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 17,
                    color: AppColor.greyColor200,
                  ),
                ),
                const Spacer(),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '80.00',
                        style: TextStyle(
                          fontFamily: 'SB',
                          fontSize: 20,
                          color: AppColor.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'USD',
                        style: TextStyle(
                          fontFamily: 'SM',
                          fontSize: 10,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: CustomBox(
              height: 50,
              mediaQuery: widget.mediaQuery,
              child: Row(
                children: [
                  const Text(
                    'Auto Payment',
                    style: TextStyle(
                      fontFamily: 'SM',
                      fontSize: 17,
                      color: AppColor.greyColor200,
                    ),
                  ),
                  const Spacer(),
                  IgnorePointer(
                    ignoring: true,
                    child: FlutterSwitch(
                      height: 22,
                      width: 40,
                      activeColor: AppColor.blueColor,
                      toggleColor: Colors.white,
                      inactiveColor: const Color(0xffe8e9eb),
                      toggleSize: 16,
                      padding: 3,
                      value: isTapped,
                      onToggle: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: SizedBox(
              height: 63,
              width: widget.mediaQuery.screenWidth(context),
              child: ElevatedButton(
                onPressed: () {
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
          ),
        ],
      ),
    );
  }
}

class _PaymentSuccessSection extends StatelessWidget {
  const _PaymentSuccessSection({
    required this.mediaQuery,
    required this.onTapped,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaQuery.screenHeight(context) - 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 55),
            const Text(
              'Congratulations!',
              style: TextStyle(
                fontFamily: 'SSB',
                fontSize: 32,
                color: AppColor.blueColor,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your loan request is accepted. you will get the loan soon.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 18,
                color: AppColor.greyColor200,
              ),
            ),
            SvgPicture.asset(
              'compromise_vector'.toSvg,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: SizedBox(
                height: 63,
                width: mediaQuery.screenWidth(context),
                child: ElevatedButton(
                  onPressed: () {
                    onTapped();
                  },
                  child: const Text(
                    'View Breakdown',
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
    );
  }
}
