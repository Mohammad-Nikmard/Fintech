import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_box.dart';
import 'package:fintech/widget/custom_payment_confirmation.dart';
import 'package:fintech/widget/custom_payment_success.dart';
import 'package:fintech/widget/custom_receipt_content.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NetflixPaymentScreen extends StatefulWidget {
  const NetflixPaymentScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<NetflixPaymentScreen> createState() => _NetflixPaymentScreenState();
}

class _NetflixPaymentScreenState extends State<NetflixPaymentScreen> {
  int progressIndicator = 0;
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
              if (progressIndicator == 0) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: _PaymentFeilds(
                    mediaQuery: widget.mediaQuery,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 1;
                      });
                    },
                  ),
                )
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
                          'August 6, 2024',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 18,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ],
                    ),
                    firstRowDescription: Row(
                      children: [
                        const Text(
                          'Transfer fee',
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
                                  fontSize: 18,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: '0.00',
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
                                  fontSize: 10,
                                  color: AppColor.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    amount: '1.00',
                    paymentStatus: 'Unpaid',
                    icon: const Positioned(
                      top: -35,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: SizedBox(
                          height: 75,
                          width: 75,
                          child: ColoredBox(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    text: 'Please make sure that you want to pay netflix bill',
                    mediaQuery: widget.mediaQuery,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 2;
                      });
                    },
                  ),
                ),
              } else if (progressIndicator == 2) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: CustomPaymentSuccessful(
                    title: 'Transfer Successful',
                    receipt: CustomReceiptContent(
                      subtitle: '*******4183',
                      icon: const Positioned(
                        top: -35,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: SizedBox(
                            height: 75,
                            width: 75,
                            child: ColoredBox(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      title: 'Netflix',
                      amount: '1.00',
                      firstRowContent: Row(
                        children: [
                          const Text(
                            'Transfer fee',
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
                                    fontSize: 18,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: '0.00',
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
                                    fontSize: 10,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      secondRowContent: const Row(
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
                            'August 8, 2024',
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 18,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    text: 'Your payment has been transferred successfully',
                    mediaQuery: widget.mediaQuery,
                  ),
                ),
              },
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  title: topicConditions(),
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

  String topicConditions() {
    if (progressIndicator == 0) {
      return 'Netflix Payment';
    } else if (progressIndicator == 1) {
      return 'Pay Bill';
    } else {
      return 'Confirmation';
    }
  }
}

class _PaymentFeilds extends StatefulWidget {
  const _PaymentFeilds({
    required this.mediaQuery,
    required this.onTapped,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;

  @override
  State<_PaymentFeilds> createState() => _PaymentFeildsState();
}

class _PaymentFeildsState extends State<_PaymentFeilds> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController addressController;
  late TextEditingController zipCodeController;
  late TextEditingController stateController;
  late TextEditingController cityController;
  late TextEditingController countryController;
  late TextEditingController cardHolderNameController;
  late TextEditingController cardNumberController;
  late TextEditingController dateController;
  late TextEditingController cvvController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    addressController = TextEditingController();
    zipCodeController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    countryController = TextEditingController();
    cardHolderNameController = TextEditingController();
    cardNumberController = TextEditingController();
    dateController = TextEditingController();
    cvvController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    zipCodeController.dispose();
    stateController.dispose();
    cityController.dispose();
    countryController.dispose();
    cardHolderNameController.dispose();
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
          CustomBox(
            height: 81,
            mediaQuery: widget.mediaQuery,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: SizedBox(
                    height: 51,
                    width: 51,
                    child: Center(
                      child: SvgPicture.asset(
                        'icon_netflix'.toSvg,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Netflix',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 16,
                        color: AppColor.blackColor,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Next Payment: ',
                          style: TextStyle(
                            fontFamily: 'SSB',
                            fontSize: 14,
                            color: AppColor.greyColor200,
                          ),
                        ),
                        Text(
                          '12/04',
                          style: TextStyle(
                            fontFamily: 'SSB',
                            fontSize: 14,
                            color: AppColor.blueColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '\$',
                        style: TextStyle(
                          fontFamily: 'SR',
                          fontSize: 20,
                          color: AppColor.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: '1.00',
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
          const SizedBox(height: 35),
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
              hint: 'Address',
              controller: addressController,
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
                    hint: 'Postal Code',
                    controller: zipCodeController,
                    color: context.secondaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  child: CustomTextField(
                    mediaQuery: widget.mediaQuery,
                    hint: 'State',
                    controller: stateController,
                    color: context.secondaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: CustomTextField(
                    mediaQuery: widget.mediaQuery,
                    hint: 'City',
                    controller: cityController,
                    color: context.secondaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  child: CustomTextField(
                    mediaQuery: widget.mediaQuery,
                    hint: 'Country',
                    controller: countryController,
                    color: context.secondaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Add Acount Details',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 60,
            width: widget.mediaQuery.screenWidth(context),
            child: CustomTextField(
              mediaQuery: widget.mediaQuery,
              hint: 'Card Holder Name',
              controller: cardHolderNameController,
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
          const SizedBox(height: 50),
          SizedBox(
            height: 63,
            width: widget.mediaQuery.screenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                widget.onTapped();
              },
              child: const Text(
                'Send',
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
