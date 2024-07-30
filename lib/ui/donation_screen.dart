import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_amount_input.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_box.dart';
import 'package:fintech/widget/custom_payment_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({
    super.key,
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  int progressIndicator = 0;
  String donation = '';
  String amount = '';
  String donationOwner = '';

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
                  child: _CharityList(
                    dontationOwner: (value) {
                      setState(() {
                        donationOwner = value;
                      });
                    },
                    mediaQuery: widget.mediaQuery,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 1;
                      });
                    },
                    selectedCharity: (value) {
                      setState(() {
                        donation = value;
                      });
                    },
                  ),
                ),
              } else if (progressIndicator == 1) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: _DonationDetails(
                    onTapped: () {
                      setState(() {
                        progressIndicator = 2;
                      });
                    },
                    enteredAmount: (value) {
                      setState(() {
                        amount = value;
                      });
                    },
                    mediaQuery: widget.mediaQuery,
                    selectedDonation: donation,
                    selectedOwner: donationOwner,
                  ),
                ),
              } else if (progressIndicator == 2) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: CustomPaymentConfirmation(
                    title: donationOwner,
                    buttonText: 'Send Money',
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
                    firstRowDescription: const Row(
                      children: [
                        Text(
                          'Account Type',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 18,
                            color: AppColor.greyColor200,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Current Account',
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
                    icon: Positioned(
                      top: -45,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(
                            'assets/images/${donation.substring(11)}.png'),
                      ),
                    ),
                    text:
                        'We care about your privacy, please make sure that you want to donate money.',
                    mediaQuery: widget.mediaQuery,
                    onTapped: () {
                      setState(() {
                        progressIndicator = 3;
                      });
                    },
                  ),
                )
              },
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  title: titleConditions(),
                  leftIcon: (progressIndicator > 2)
                      ? 'my_photo.jpg'
                      : 'icon_arrow_left',
                  isLeftProfile: (progressIndicator > 2) ? true : false,
                  rightIcon: 'icon_notification',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String titleConditions() {
    switch (progressIndicator) {
      case 0:
        return 'Charity';

      case 1:
        return 'Donation';

      case > 1:
        return 'Confirmation';

      default:
        return 'Charity';
    }
  }
}

class _CharityList extends StatefulWidget {
  const _CharityList({
    required this.mediaQuery,
    required this.onTapped,
    required this.selectedCharity,
    required this.dontationOwner,
  });
  final MediaQueryHandler mediaQuery;
  final VoidCallback onTapped;
  final ValueChanged<String> selectedCharity;
  final ValueChanged<String> dontationOwner;

  @override
  State<_CharityList> createState() => _CharityListState();
}

class _CharityListState extends State<_CharityList> {
  List<String> charityList = [
    'Donate for Child Education',
    'Donate for Cancer Patients',
  ];

  List<String> ownerList = [
    'HEADS Foundation',
    'Core Club',
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
                  height: 368,
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
                      Stack(
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
                                    'assets/images/${charityList[index].substring(11)}.png',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 20,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(7),
                              ),
                              child: SizedBox(
                                height: 35,
                                width: 95,
                                child: ColoredBox(
                                  color: (index == 0)
                                      ? const Color(0xff3a786a).withOpacity(0.5)
                                      : const Color(0xffe59b94)
                                          .withOpacity(0.5),
                                  child: Center(
                                    child: Text(
                                      (index == 0)
                                          ? '14 Days Left'
                                          : '2 Days Left',
                                      style: TextStyle(
                                        fontFamily: 'SM',
                                        fontSize: 16,
                                        color: (index == 0)
                                            ? AppColor.greenDark
                                            : AppColor.redDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      charityList[index],
                                      style: const TextStyle(
                                        fontFamily: 'SSB',
                                        fontSize: 20,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                    Text(
                                      'Arrange by ${ownerList[index]}',
                                      style: const TextStyle(
                                        fontFamily: 'SR',
                                        fontSize: 15,
                                        color: AppColor.greyColor200,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(7),
                                  ),
                                  child: SizedBox(
                                    height: 26,
                                    width: 44,
                                    child: ColoredBox(
                                      color: (index == 0)
                                          ? AppColor.redLight
                                          : AppColor.greenLight,
                                      child: Center(
                                        child: Text(
                                          (index == 0) ? '40%' : '60%',
                                          style: TextStyle(
                                            fontFamily: 'SM',
                                            fontSize: 16,
                                            color: (index == 0)
                                                ? AppColor.redDark
                                                : AppColor.greenDark,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Container(
                              width: widget.mediaQuery.screenWidth(context),
                              height: 6,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: context.secondaryContainer,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: (index == 0) ? 165 : 50),
                                  child: const ColoredBox(
                                    color: AppColor.blueColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$',
                                        style: TextStyle(
                                          fontFamily: 'SR',
                                          fontSize: 22,
                                          color: AppColor.greyColor200,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '10245.00',
                                        style: TextStyle(
                                          fontFamily: 'SB',
                                          fontSize: 22,
                                          color: AppColor.greyColor200,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'USD',
                                        style: TextStyle(
                                          fontFamily: 'SM',
                                          fontSize: 12,
                                          color: AppColor.greyColor200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(7),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.dontationOwner(ownerList[index]);
                                      widget
                                          .selectedCharity(charityList[index]);
                                      widget.onTapped();
                                    },
                                    child: const SizedBox(
                                      height: 32,
                                      width: 102,
                                      child: ColoredBox(
                                        color: AppColor.blueColor,
                                        child: Center(
                                          child: Text(
                                            'Donate',
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
            itemCount: charityList.length,
          ),
        ),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.title,
    required this.owner,
    required this.mediaQuery,
  });
  final String title;
  final String owner;
  final MediaQueryHandler mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Container(
        width: mediaQuery.screenWidth(context),
        height: 260,
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
                    'assets/images/${title.substring(11)}.png',
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
                    'Donate for $title',
                    style: const TextStyle(
                      fontFamily: 'SSB',
                      fontSize: 18,
                      color: AppColor.blackColor,
                    ),
                  ),
                  Text(
                    'Arrange by $owner',
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

class _DonationDetails extends StatelessWidget {
  const _DonationDetails({
    required this.mediaQuery,
    required this.selectedDonation,
    required this.selectedOwner,
    required this.enteredAmount,
    required this.onTapped,
  });
  final MediaQueryHandler mediaQuery;
  final String selectedOwner;
  final String selectedDonation;
  final ValueChanged<String> enteredAmount;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _AppBar(
          title: selectedDonation,
          owner: selectedOwner,
          mediaQuery: mediaQuery,
        ),
        CustomBox(
          height: 91,
          mediaQuery: mediaQuery,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: ColoredBox(
                    color: AppColor.greenLight,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'icon_checkmark'.toSvg,
                        colorFilter: const ColorFilter.mode(
                          AppColor.greenDark,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Heads Foundation ',
                        style: TextStyle(
                          fontFamily: 'SSB',
                          fontSize: 20,
                          color: AppColor.blackColor,
                        ),
                      ),
                      SvgPicture.asset(
                        'icon_approval'.toSvg,
                      ),
                    ],
                  ),
                  const Text(
                    'Verified Foundation',
                    style: TextStyle(
                      fontFamily: 'SR',
                      fontSize: 13,
                      color: AppColor.blackColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 35),
        Text(
          'Participants',
          style: context.headlineMedium,
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Stack(
              children: [
                const _CircularProfile(
                  picture: DecorationImage(
                    image: AssetImage('assets/images/my_photo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: _CircularProfile(
                    backgroundColor: Colors.yellow,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: _CircularProfile(
                    backgroundColor: Colors.teal,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 90),
                  child: _CircularProfile(
                    backgroundColor: Colors.redAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: _CircularProfile(
                    backgroundColor: context.secondaryContainer,
                    child: const Center(
                      child: Text(
                        '9+',
                        style: TextStyle(
                          fontFamily: 'SR',
                          color: AppColor.greyColor200,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(7),
              ),
              child: GestureDetector(
                onTap: () {},
                child: const SizedBox(
                  height: 32,
                  width: 102,
                  child: ColoredBox(
                    color: AppColor.blueColor,
                    child: Center(
                      child: Text(
                        'See all',
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
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 63,
            width: mediaQuery.screenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return CustomAmountInputSheet(
                      onTapped: () {
                        onTapped();
                      },
                      mediaQuery: mediaQuery,
                      eneterdAmount: (value) {
                        enteredAmount(value);
                      },
                    );
                  },
                  backgroundColor: Colors.transparent,
                );
              },
              child: const Text(
                'Donate Now',
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

class _CircularProfile extends StatelessWidget {
  const _CircularProfile({
    this.backgroundColor,
    this.picture,
    this.child,
  });
  final Color? backgroundColor;
  final DecorationImage? picture;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        image: picture,
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
      ),
      child: child,
    );
  }
}
