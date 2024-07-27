import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_amount_selection_box.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  int progressIndicator = 0;
  String selectedAmount = '';
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
                  child: _RechargeSection(
                    selectedAmount: (value) {
                      setState(() {
                        selectedAmount = value;
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
              } else if (progressIndicator == 1)
                ...{}
              else if (progressIndicator == 2)
                ...{},
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  title: (progressIndicator > 0) ? 'Confirmation' : 'Recharge',
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

class _RechargeSection extends StatefulWidget {
  const _RechargeSection({
    required this.mediaQuery,
    required this.onTapped,
    required this.selectedAmount,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;
  final ValueChanged<String> selectedAmount;

  @override
  State<_RechargeSection> createState() => _RechargeSectionState();
}

class _RechargeSectionState extends State<_RechargeSection> {
  late TextEditingController mobileNumberController;

  int selectedIndex = 0;

  String selectedAmount = '';

  List<String> networkList = [
    'AT&T',
    'T-Mobile',
    'Verizon',
  ];

  @override
  void initState() {
    super.initState();
    mobileNumberController = TextEditingController();
  }

  @override
  void dispose() {
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Mobile Number',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 5),
        const Text(
          'Enter recipient mobile number',
          style: TextStyle(
            fontFamily: 'SM',
            fontSize: 16,
            color: AppColor.greyColor200,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          width: widget.mediaQuery.screenWidth(context),
          child: CustomTextField(
            mediaQuery: widget.mediaQuery,
            hint: 'Mobile Number',
            controller: mobileNumberController,
            color: context.secondaryContainer,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Select Network',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 105,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    height: 103,
                    width: 112,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.white,
                      border: Border.all(
                        width: 1.5,
                        color: (selectedIndex == index)
                            ? AppColor.blueColor
                            : Colors.transparent,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, -5),
                          spreadRadius: -20,
                          blurRadius: 25,
                          color: AppColor.greyColor200,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.black,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            networkList[index],
                            style: const TextStyle(
                              fontFamily: 'SM',
                              fontSize: 13,
                              color: AppColor.greyColor200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: networkList.length,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Enter Amount',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 15),
        CustomAmountSelectionBox(
          selectedAmount: (value) {
            setState(() {
              selectedAmount = value;
            });
          },
          mediaQuery: widget.mediaQuery,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 63,
            width: widget.mediaQuery.screenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                widget.selectedAmount(selectedAmount);
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
    );
  }
}
