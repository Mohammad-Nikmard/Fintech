import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_selection_box.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BankTransferScreen extends StatefulWidget {
  const BankTransferScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {
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
                  child: _BankOptionsSection(
                    onTapped: () {
                      setState(() {
                        progressIndicator = 1;
                      });
                    },
                    mediaQuery: widget.mediaQuery,
                  ),
                ),
              } else if (progressIndicator == 1) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: _BankTransferFields(
                    onTapped: () {
                      setState(() {
                        progressIndicator = 2;
                      });
                    },
                    mediaQuery: widget.mediaQuery,
                  ),
                )
              } else if (progressIndicator == 2) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: _TransferDescriptionSection(
                    mediaQuery: widget.mediaQuery,
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
                  child: _TransferConfirmationSection(
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
                  child: _SuccessfulTransferSection(
                    mediaQuery: widget.mediaQuery,
                  ),
                ),
              },
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  title: (progressIndicator < 2)
                      ? 'Bank Transfer'
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

class _BankOptionsSection extends StatefulWidget {
  const _BankOptionsSection({
    required this.mediaQuery,
    required this.onTapped,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;

  @override
  State<_BankOptionsSection> createState() => _BankOptionsSectionState();
}

class _BankOptionsSectionState extends State<_BankOptionsSection> {
  late TextEditingController searchController;

  int selectedIndex = 0;

  List<String> bankNames = [
    'Byline Bank',
    'Shamrock Bank',
    'M&T Bank',
    'Turist Financial',
  ];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transfer to Bank',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 5),
        const Text(
          'Search or Select recipients bank',
          style: TextStyle(
            fontFamily: 'SM',
            fontSize: 16,
            color: AppColor.greyColor400,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 48,
          width: widget.mediaQuery.screenWidth(context),
          child: TextField(
            style: const TextStyle(
              fontFamily: 'SM',
              fontSize: 16,
              color: AppColor.blackColor,
            ),
            controller: searchController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              fillColor: context.secondaryContainer,
              filled: true,
              hintText: 'Search',
              contentPadding: const EdgeInsets.only(top: 15, left: 20),
              hintStyle: const TextStyle(
                fontFamily: 'SM',
                fontSize: 16,
                color: AppColor.greyColor200,
              ),
              prefixIcon: SizedBox(
                height: 14,
                width: 14,
                child: Center(
                  child: SvgPicture.asset(
                    'icon_search'.toSvg,
                    colorFilter: const ColorFilter.mode(
                      AppColor.greyColor400,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        SizedBox(
          height: 384,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: CustomSelectionBox(
                    height: 51,
                    width: widget.mediaQuery.screenWidth(context),
                    index: index,
                    selectedIndex: selectedIndex,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: SvgPicture.asset(
                                bankNames[index].toSvg,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          bankNames[index],
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
            itemCount: bankNames.length,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
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
        )
      ],
    );
  }
}

class _BankTransferFields extends StatefulWidget {
  const _BankTransferFields({
    required this.onTapped,
    required this.mediaQuery,
  });
  final VoidCallback onTapped;
  final MediaQueryHandler mediaQuery;

  @override
  State<_BankTransferFields> createState() => _BankTransferFieldsState();
}

class _BankTransferFieldsState extends State<_BankTransferFields> {
  late TextEditingController cardHolderNameController;
  late TextEditingController cardNumberController;
  late TextEditingController dateController;
  late TextEditingController cvvController;
  late TextEditingController paymentPurposeController;
  late TextEditingController amountController;

  int selectedIndex = 0;

  String selectedAmount = '250.00';

  List<String> amountBoxList = [
    '\$100',
    '\$150',
    '\$200',
  ];

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController(text: '\$250.00');
    cardHolderNameController = TextEditingController();
    cardNumberController = TextEditingController();
    dateController = TextEditingController();
    cvvController = TextEditingController();
    paymentPurposeController = TextEditingController();
  }

  @override
  void dispose() {
    amountController.dispose();
    cardHolderNameController.dispose();
    cardNumberController.dispose();
    dateController.dispose();
    cvvController.dispose();
    paymentPurposeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Account Details',
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
        const SizedBox(height: 10),
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
        const SizedBox(height: 10),
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
        const SizedBox(height: 35),
        Text(
          'Enter Amount',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 65,
          width: widget.mediaQuery.screenWidth(context),
          child: TextField(
            style: const TextStyle(
              fontFamily: 'SB',
              fontSize: 28,
              color: AppColor.blueColor,
            ),
            controller: amountController,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  color: AppColor.blueColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  color: AppColor.blueColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        amountController.text =
                            '${amountBoxList[selectedIndex]}.00';
                      });
                    },
                    child: Container(
                      height: 48,
                      width: 114,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                        border: Border.all(
                          width: 1.5,
                          color: (selectedIndex == index)
                              ? AppColor.blueColor
                              : Colors.transparent,
                        ),
                        color: (selectedIndex == index)
                            ? Colors.transparent
                            : context.secondaryContainer,
                      ),
                      child: Center(
                        child: Text(
                          amountBoxList[index],
                          style: const TextStyle(
                            fontFamily: 'SB',
                            fontSize: 22,
                            color: AppColor.greyColor400,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 3,
            )),
        const SizedBox(height: 30),
        Text(
          'Payment Purpose',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 60,
          width: widget.mediaQuery.screenWidth(context),
          child: CustomTextField(
            mediaQuery: widget.mediaQuery,
            hint: 'Purpose of payment (Optional)',
            controller: paymentPurposeController,
            color: context.secondaryContainer,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
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
    );
  }
}

class _TransferDescriptionSection extends StatelessWidget {
  const _TransferDescriptionSection({
    required this.mediaQuery,
    required this.onTapped,
  });
  final MediaQueryHandler mediaQuery;
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
          'Bank',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 15),
        Container(
          height: 81,
          width: mediaQuery.screenWidth(context),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
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
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SvgPicture.asset(
                        'Byline Bank'.toSvg,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  'Byline Bank',
                  style: context.headlineMedium,
                ),
                const Spacer(),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: AppColor.blueColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AnimatedContainer(
                      curve: Curves.decelerate,
                      duration: const Duration(milliseconds: 250),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.blueColor),
                    ),
                  ),
                ),
              ],
            ),
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
                                text: '250.00',
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
                                text: '250.00',
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

class _TransferConfirmationSection extends StatelessWidget {
  const _TransferConfirmationSection({
    required this.mediaQuery,
    required this.onTapped,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'Are you sure?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SSB',
              fontSize: 32,
              color: AppColor.blueColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            'We care about your privacy, please make sure that you want to transfer money.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SM',
              fontSize: 18,
              color: AppColor.greyColor200,
            ),
          ),
        ),
        const SizedBox(height: 70),
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: SizedBox(
                height: 369,
                width: mediaQuery.screenWidth(context),
                child: ColoredBox(
                  color: context.secondaryContainer,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 56),
                    child: Column(
                      children: [
                        const Text(
                          'Mohammad Nikmard',
                          style: TextStyle(
                            fontFamily: 'SSB',
                            fontSize: 26,
                            color: AppColor.blackColor,
                          ),
                        ),
                        const Text(
                          '*******4183',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 16,
                            color: AppColor.greyColor200,
                          ),
                        ),
                        const SizedBox(height: 15),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: SizedBox(
                            height: 38,
                            width: 249,
                            child: ColoredBox(
                              color: AppColor.redLight,
                              child: const Center(
                                child: Text(
                                  'Transaction Status: Pending',
                                  style: TextStyle(
                                    fontFamily: 'SSB',
                                    fontSize: 16,
                                    color: AppColor.redDark,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  fontFamily: 'SR',
                                  fontSize: 36,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: '250.00',
                                style: TextStyle(
                                  fontFamily: 'SB',
                                  fontSize: 36,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: 'USD',
                                style: TextStyle(
                                  fontFamily: 'SSB',
                                  fontSize: 18,
                                  color: AppColor.greyColor200,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Column(
                          children: [
                            const Row(
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
                            const SizedBox(height: 15),
                            const Divider(
                              height: 0,
                              thickness: 1.5,
                              color: Color(0xffe5e7e9),
                            ),
                            const SizedBox(height: 15),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              top: -45,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('assets/images/my_photo.jpg'),
              ),
            ),
          ],
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
                'Send',
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

class _SuccessfulTransferSection extends StatelessWidget {
  const _SuccessfulTransferSection({
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'Transfer Successful',
            style: TextStyle(
              fontFamily: 'SSB',
              fontSize: 32,
              color: AppColor.blueColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            'Your money has been transferred successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SM',
              fontSize: 18,
              color: AppColor.greyColor200,
            ),
          ),
        ),
        const SizedBox(height: 70),
        SvgPicture.asset(
          'success_vector'.toSvg,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 35),
          child: SizedBox(
            height: 63,
            width: mediaQuery.screenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return const _ReceiptContent();
                  },
                );
              },
              child: const Text(
                'Veiw Receipt',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _ReceiptContent extends StatelessWidget {
  const _ReceiptContent();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          height: 400,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 55),
              const Center(
                child: Text(
                  'Mohammad Nikmard',
                  style: TextStyle(
                    fontFamily: 'SSB',
                    fontSize: 26,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  '*******4183',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.greyColor200,
                    fontFamily: 'SM',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: SizedBox(
                        height: 38,
                        width: 249,
                        child: ColoredBox(
                          color: AppColor.greenLight,
                          child: const Center(
                            child: Text(
                              'Transaction Status: Paid',
                              style: TextStyle(
                                fontFamily: 'SSB',
                                fontSize: 16,
                                color: AppColor.greenDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontFamily: 'SR',
                              fontSize: 36,
                              color: AppColor.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: '250.00',
                            style: TextStyle(
                              fontFamily: 'SB',
                              fontSize: 36,
                              color: AppColor.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: 'USD',
                            style: TextStyle(
                              fontFamily: 'SSB',
                              fontSize: 18,
                              color: AppColor.greyColor200,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        const Row(
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
                        const SizedBox(height: 15),
                        const Divider(
                          height: 0,
                          thickness: 1.5,
                          color: Color(0xffe5e7e9),
                        ),
                        const SizedBox(height: 15),
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
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
      ],
    );
  }
}
