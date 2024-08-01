import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:fintech/widget/custom_amount_selection_box.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_box.dart';
import 'package:fintech/widget/custom_payment_confirmation.dart';
import 'package:fintech/widget/custom_payment_success.dart';
import 'package:fintech/widget/custom_receipt_content.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SendGiftScreen extends StatefulWidget {
  const SendGiftScreen({
    super.key,
    required this.mediaQuery,
    required this.nav,
  });
  final MediaQueryHandler mediaQuery;
  final NavigatorHandler nav;

  @override
  State<SendGiftScreen> createState() => _SendGiftScreenState();
}

class _SendGiftScreenState extends State<SendGiftScreen> {
  int progressIndicator = 0;
  String gift = '';
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
                  child: _GiftList(
                    mediaQuery: widget.mediaQuery,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 1;
                      });
                    },
                    selectedGift: (value) {
                      setState(() {
                        gift = value;
                      });
                    },
                  ),
                ),
              } else if (progressIndicator == 1) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: _GiftFields(
                    gift: gift,
                    mediaQuery: widget.mediaQuery,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 2;
                      });
                    },
                    selectedAmount: (value) {
                      setState(() {
                        amount = value;
                      });
                    },
                  ),
                ),
              } else if (progressIndicator == 2) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: _GiftDetails(
                    mediaQuery: widget.mediaQuery,
                    selectedAmount: amount,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 3;
                      });
                    },
                  ),
                ),
              } else if (progressIndicator == 3) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: CustomPaymentConfirmation(
                    title: 'Mohammad Nikmard',
                    buttonText: 'Send',
                    secondRowDescription: Row(
                      children: [
                        const Text(
                          'Transfer Fee',
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
                    firstRowDescription: const Row(
                      children: [
                        Text(
                          'Card Type',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 18,
                            color: AppColor.greyColor200,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Debit Card',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 18,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ],
                    ),
                    amount: amount.substring(1),
                    paymentStatus: 'Pending',
                    icon: const Positioned(
                      top: -45,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            AssetImage('assets/images/my_photo.jpg'),
                      ),
                    ),
                    text:
                        'We care about your privacy, please make sure that you want to transfer money.',
                    mediaQuery: widget.mediaQuery,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 4;
                      });
                    },
                  ),
                )
              } else if (progressIndicator == 4) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: CustomPaymentSuccessful(
                    title: 'Transfer Successful',
                    receipt: CustomReceiptContent(
                      subtitle: '*******4183',
                      icon: Positioned(
                        top: -30,
                        child: Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/my_photo.jpg'),
                            ),
                          ),
                        ),
                      ),
                      title: 'Mohammad Nikmard',
                      amount: amount.substring(1),
                      firstRowContent: const Row(
                        children: [
                          Text(
                            'Card Type',
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 18,
                              color: AppColor.greyColor200,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Debit Card',
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 18,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ],
                      ),
                      secondRowContent: Row(
                        children: [
                          const Text(
                            'Transfer Fee',
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
                    ),
                    text: 'Your money has been transferred successfully',
                    mediaQuery: widget.mediaQuery,
                  ),
                ),
              },
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  nav: widget.nav,
                  mediaQuery: widget.mediaQuery,
                  title: (progressIndicator < 1) ? 'Gift' : 'Confirmation',
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

class _GiftList extends StatefulWidget {
  const _GiftList({
    required this.mediaQuery,
    required this.onTapped,
    required this.selectedGift,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;
  final ValueChanged<String> selectedGift;

  @override
  State<_GiftList> createState() => _GiftListState();
}

class _GiftListState extends State<_GiftList> {
  List<String> giftList = [
    'Eid Gift',
    'Birthday Gift',
    'Marriage Gift',
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
                                'assets/images/${giftList[index]}.png',
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
                              giftList[index],
                              style: const TextStyle(
                                fontFamily: 'SSB',
                                fontSize: 20,
                                color: AppColor.blackColor,
                              ),
                            ),
                            Text(
                              'Send ${giftList[index]} to your loved ones',
                              style: const TextStyle(
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
                                      widget.selectedGift(giftList[index]);
                                      widget.onTapped();
                                    },
                                    child: const SizedBox(
                                      height: 32,
                                      width: 82,
                                      child: ColoredBox(
                                        color: AppColor.blueColor,
                                        child: Center(
                                          child: Text(
                                            'Send',
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
            itemCount: giftList.length,
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
                  Text(
                    'Sned $title to your loved ones',
                    style: const TextStyle(
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

class _GiftFields extends StatefulWidget {
  const _GiftFields({
    required this.gift,
    required this.mediaQuery,
    required this.onTapped,
    required this.selectedAmount,
  });
  final MediaQueryHandler mediaQuery;
  final String gift;
  final VoidCallback onTapped;
  final ValueChanged<String> selectedAmount;

  @override
  State<_GiftFields> createState() => _GiftFieldsState();
}

class _GiftFieldsState extends State<_GiftFields> {
  late TextEditingController nameController;
  late TextEditingController amountController;
  late TextEditingController mobileNumberController;
  late TextEditingController purposeOfPaymentController;
  late TextEditingController passwordController;
  late TextEditingController giftMessageController;

  bool visibleEye = false;
  String selectedAmount = '';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    amountController = TextEditingController();
    mobileNumberController = TextEditingController();
    purposeOfPaymentController = TextEditingController();
    passwordController = TextEditingController();
    giftMessageController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    mobileNumberController.dispose();
    purposeOfPaymentController.dispose();
    passwordController.dispose();
    giftMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AppBar(
            title: widget.gift,
            mediaQuery: widget.mediaQuery,
          ),
          Text(
            'Add Recipient Bank Detail',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 20),
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
              hint: 'Enter Account Number',
              controller: amountController,
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
          const SizedBox(height: 30),
          CustomAmountSelectionBox(
            mediaQuery: widget.mediaQuery,
            selectedAmount: (value) {
              setState(() {
                selectedAmount = value;
              });
            },
          ),
          const SizedBox(height: 30),
          Text(
            'Enter Gift Messge',
            style: context.headlineMedium,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            maxLines: 4,
            mediaQuery: widget.mediaQuery,
            hint: 'Type your message here...',
            controller: purposeOfPaymentController,
            color: context.secondaryContainer,
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 63,
            width: widget.mediaQuery.screenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                widget.selectedAmount(selectedAmount);
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

class _GiftDetails extends StatelessWidget {
  const _GiftDetails({
    required this.mediaQuery,
    required this.selectedAmount,
    required this.onTapped,
  });
  final MediaQueryHandler mediaQuery;
  final String selectedAmount;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recipient',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 15),
        Container(
          height: 81,
          width: mediaQuery.screenWidth(context),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -1),
                spreadRadius: -24,
                blurRadius: 25,
                color: AppColor.greyColor200,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/my_photo.jpg'),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mohammad',
                      style: context.headlineMedium,
                    ),
                    const Text(
                      '*******4183',
                      style: TextStyle(
                        fontFamily: 'SSB',
                        fontSize: 16,
                        color: AppColor.greyColor200,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SvgPicture.asset(
                        'icon_edit'.toSvg,
                        height: 16,
                        width: 16,
                        colorFilter: const ColorFilter.mode(
                          AppColor.greyColor400,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Card',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 15),
        CustomBox(
          height: 81,
          mediaQuery: mediaQuery,
          child: Row(
            children: [
              SvgPicture.asset(
                'small_debitcard_vector'.toSvg,
              ),
              const SizedBox(width: 15),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    'Debit Card',
                    style: TextStyle(
                      fontFamily: 'SSB',
                      fontSize: 18,
                      color: AppColor.blackColor,
                    ),
                  ),
                  Text(
                    'Master Card',
                    style: TextStyle(
                      fontFamily: 'SSB',
                      fontSize: 16,
                      color: AppColor.greyColor200,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const Spacer(),
              Container(
                height: 21,
                width: 21,
                decoration: ShapeDecoration(
                  color: AppColor.blueLight,
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: RotatedBox(
                      quarterTurns: 90,
                      child: SvgPicture.asset(
                        'icon_arrow_left'.toSvg,
                        colorFilter: const ColorFilter.mode(
                          AppColor.blueColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Transfer Details',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 15),
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: SizedBox(
            height: 201,
            width: mediaQuery.screenWidth(context),
            child: ColoredBox(
              color: context.secondaryContainer,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Transfer Amount',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 18,
                            color: AppColor.greyColor200,
                          ),
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 18,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: selectedAmount.substring(1),
                                style: const TextStyle(
                                  fontFamily: 'SB',
                                  fontSize: 20,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              const TextSpan(
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
                    const Divider(
                      thickness: 1.5,
                      color: Color(0xffe5e7e9),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Transfer Fee',
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
                                  fontFamily: 'SM',
                                  fontSize: 18,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: '0.00',
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
                    const Divider(
                      thickness: 1.5,
                      color: Color(0xffe5e7e9),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 18,
                            color: AppColor.greyColor200,
                          ),
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 18,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: selectedAmount.substring(1),
                                style: const TextStyle(
                                  fontFamily: 'SB',
                                  fontSize: 20,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              const TextSpan(
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
                  ],
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 63,
            width: mediaQuery.screenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                onTapped();
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
