import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_selection_box.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';

class InsuranceScreen extends StatefulWidget {
  const InsuranceScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<InsuranceScreen> createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  int progressIndicator = 0;
  String insurance = '';
  String amount = '';

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
                  child: _InsuranceList(
                    selectedInsurance: (value) {
                      setState(() {
                        insurance = value;
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
                  child: _InsurancePlanSelection(
                    onTapped: () {
                      setState(() {
                        progressIndicator = 2;
                      });
                    },
                    mediaQuery: widget.mediaQuery,
                    selectedAmount: (value) {
                      setState(() {
                        amount = value;
                      });
                    },
                    selectedInsurance: insurance,
                  ),
                ),
              } else if (progressIndicator == 2) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: _InsuranceFields(
                    mediaQuery: widget.mediaQuery,
                    selectedInsurance: insurance,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 3;
                      });
                    },
                  ),
                ),
              } else if (progressIndicator == 3)
                ...{}
              else if (progressIndicator == 4)
                ...{},
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  title: (progressIndicator < 3) ? 'Insurance' : 'Confirmation',
                  leftIcon: (progressIndicator > 4)
                      ? 'my_photo.jpg'
                      : 'icon_arrow_left',
                  isLeftProfile: (progressIndicator > 4) ? true : false,
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

class _InsuranceList extends StatefulWidget {
  const _InsuranceList({
    required this.mediaQuery,
    required this.onTapped,
    required this.selectedInsurance,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;
  final ValueChanged<String> selectedInsurance;

  @override
  State<_InsuranceList> createState() => _InsuranceListState();
}

class _InsuranceListState extends State<_InsuranceList> {
  List<String> insuranceList = [
    'Family Insurance',
    'House Insurance',
    'Health Insurance',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  width: widget.mediaQuery.screenWidth(context),
                  height: 352,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        spreadRadius: -18,
                        blurRadius: 25,
                        color: AppColor.greyColor200,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: SizedBox(
                          height: 221,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/${insuranceList[index]}.png',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              insuranceList[index],
                              style: const TextStyle(
                                fontFamily: 'SSB',
                                fontSize: 20,
                                color: AppColor.blackColor,
                              ),
                            ),
                            const Text(
                              'Family plan cover two or more membeers.',
                              style: TextStyle(
                                fontFamily: 'SR',
                                fontSize: 15,
                                color: AppColor.greyColor200,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Get ',
                                      style: TextStyle(
                                        fontFamily: 'SM',
                                        fontSize: 20,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                    Text(
                                      '10% ',
                                      style: TextStyle(
                                        fontFamily: 'SM',
                                        fontSize: 20,
                                        color: AppColor.blueColor,
                                      ),
                                    ),
                                    Text(
                                      'Cashback',
                                      style: TextStyle(
                                        fontFamily: 'SM',
                                        fontSize: 20,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.selectedInsurance(
                                          insuranceList[index]);
                                      widget.onTapped();
                                    },
                                    child: const SizedBox(
                                      height: 32,
                                      width: 102,
                                      child: ColoredBox(
                                        color: AppColor.blueColor,
                                        child: Center(
                                          child: Text(
                                            'Create Plan',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: insuranceList.length,
          ),
        ),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.title,
    required this.mediaQuery,
  });
  final String title;
  final MediaQueryHandler mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Container(
        width: mediaQuery.screenWidth(context),
        height: 239,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              spreadRadius: -18,
              blurRadius: 25,
              color: AppColor.greyColor200,
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: SizedBox(
                height: 155,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.asset(
                    'assets/images/$title.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'SSB',
                      fontSize: 20,
                      color: AppColor.blackColor,
                    ),
                  ),
                  const Text(
                    'Family plan cover two or more membeers.',
                    style: TextStyle(
                      fontFamily: 'SR',
                      fontSize: 15,
                      color: AppColor.greyColor200,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InsurancePlanSelection extends StatefulWidget {
  const _InsurancePlanSelection({
    required this.mediaQuery,
    required this.selectedAmount,
    required this.selectedInsurance,
    required this.onTapped,
  });
  final MediaQueryHandler mediaQuery;
  final ValueChanged<String> selectedAmount;
  final String selectedInsurance;
  final VoidCallback onTapped;

  @override
  State<_InsurancePlanSelection> createState() =>
      _InsurancePlanSelectionState();
}

class _InsurancePlanSelectionState extends State<_InsurancePlanSelection> {
  int selectedIndex = 0;

  List<String> priceList = [
    '150.00',
    '250.00',
    '350.00',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AppBar(
            title: widget.selectedInsurance,
            mediaQuery: widget.mediaQuery,
          ),
          Text(
            'Select a Insurance Plan',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 354,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CustomSelectionBox(
                      height: 103,
                      width: widget.mediaQuery.screenWidth(context),
                      index: index,
                      selectedIndex: selectedIndex,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Monthly Plan',
                            style: TextStyle(
                              fontFamily: 'SSB',
                              fontSize: 18,
                              color: AppColor.greyColor200,
                            ),
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: '\$',
                                      style: TextStyle(
                                        fontFamily: 'SR',
                                        fontSize: 18,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: priceList[index],
                                      style: const TextStyle(
                                        fontFamily: 'SB',
                                        fontSize: 20,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: 'USD/month',
                                      style: TextStyle(
                                        fontFamily: 'SM',
                                        fontSize: 12,
                                        color: AppColor.greyColor200,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: priceList.length,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
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
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _InsuranceFields extends StatefulWidget {
  const _InsuranceFields({
    required this.mediaQuery,
    required this.selectedInsurance,
    required this.onTapped,
  });
  final MediaQueryHandler mediaQuery;
  final String selectedInsurance;
  final VoidCallback onTapped;

  @override
  State<_InsuranceFields> createState() => _InsuranceFieldsState();
}

class _InsuranceFieldsState extends State<_InsuranceFields> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController familyMemberController;
  late TextEditingController paymentDateController;
  late TextEditingController purposeOfPaymentController;
  late TextEditingController cardHolderController;
  late TextEditingController cardNumberController;
  late TextEditingController dateController;
  late TextEditingController cvvController;

  int selectedIndex = 0;

  List<String> planList = [
    'Monthly',
    'Quarterly',
    'Yearly',
  ];

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    familyMemberController = TextEditingController();
    paymentDateController = TextEditingController();
    purposeOfPaymentController = TextEditingController();
    cardHolderController = TextEditingController();
    cardNumberController = TextEditingController();
    dateController = TextEditingController();
    cvvController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    familyMemberController.dispose();
    paymentDateController.dispose();
    purposeOfPaymentController.dispose();
    cardHolderController.dispose();
    cardNumberController.dispose();
    dateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AppBar(
            title: widget.selectedInsurance,
            mediaQuery: widget.mediaQuery,
          ),
          Text(
            'Add Information',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'First Name',
              controller: firstNameController,
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'Last Name',
              controller: lastNameController,
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'Total family Members',
              controller: familyMemberController,
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'Payment Date',
              controller: paymentDateController,
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'Purpose if payment (Optional)',
              controller: purposeOfPaymentController,
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Add Acount Details',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'Card Holder Name',
              controller: cardHolderController,
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'Card Number',
              controller: cardNumberController,
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: CustomTextField(
                    mediaQuery: widget.mediaQuery,
                    hint: 'MM/YY',
                    controller: dateController,
                    color: context.secondaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 60,
                  width: widget.mediaQuery.screenWidth(context),
                  child: CustomTextField(
                    mediaQuery: widget.mediaQuery,
                    hint: 'CVV',
                    controller: cvvController,
                    color: context.secondaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Payment Plan',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 48,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
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
                      color: (selectedIndex == index)
                          ? Colors.transparent
                          : context.secondaryContainer,
                      border: Border.all(
                        width: 1.5,
                        color: (selectedIndex == index)
                            ? AppColor.blueColor
                            : Colors.transparent,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        planList[index],
                        style: TextStyle(
                          fontFamily: 'SM',
                          fontSize: 17,
                          color: (selectedIndex == index)
                              ? AppColor.blueColor
                              : AppColor.greyColor400,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: planList.length,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
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
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
