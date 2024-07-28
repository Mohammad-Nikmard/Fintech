import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_selection_box.dart';
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
              } else if (progressIndicator == 2)
                ...{}
              else if (progressIndicator == 3)
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
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Container(
              width: widget.mediaQuery.screenWidth(context),
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
                          'assets/images/${widget.selectedInsurance}.png',
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
                          widget.selectedInsurance,
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
