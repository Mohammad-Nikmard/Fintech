import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class PinCodeChangeScreen extends StatefulWidget {
  const PinCodeChangeScreen({
    super.key,
    required this.mediaQuery,
    required this.nav,
  });
  final MediaQueryHandler mediaQuery;
  final NavigatorHandler nav;

  @override
  State<PinCodeChangeScreen> createState() => _PinCodeChangeScreenState();
}

class _PinCodeChangeScreenState extends State<PinCodeChangeScreen> {
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
              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Column(
                  children: [
                    if (progressIndicator == 0) ...{
                      _MobileNumberSection(
                        mediaQuery: widget.mediaQuery,
                        onTapped: () {
                          setState(() {
                            progressIndicator = 1;
                          });
                        },
                      ),
                    } else if (progressIndicator == 1) ...{
                      _OTPSection(
                        mediaQuery: widget.mediaQuery,
                      ),
                    }
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppbar(
                  nav: widget.nav,
                  mediaQuery: widget.mediaQuery,
                  title: (progressIndicator == 0)
                      ? 'Mobile Number'
                      : 'OTP Verification',
                  leftIcon: 'icon_arrow_left',
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

class _MobileNumberSection extends StatefulWidget {
  const _MobileNumberSection({
    required this.onTapped,
    required this.mediaQuery,
  });
  final VoidCallback onTapped;
  final MediaQueryHandler mediaQuery;

  @override
  State<_MobileNumberSection> createState() => _MobileNumberSectionState();
}

class _MobileNumberSectionState extends State<_MobileNumberSection> {
  late TextEditingController mobileNumberController;

  @override
  void initState() {
    super.initState();
    mobileNumberController = TextEditingController(text: '+98 9377964183');
  }

  @override
  void dispose() {
    super.dispose();
    mobileNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 138,
            width: 138,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.blueColor,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset('mobile_otp'.toSvg),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'Mobile Number',
            style: TextStyle(
              fontFamily: 'SB',
              fontSize: 32,
              color: AppColor.blackColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'We need to send OTP to authenticate your number to change your pin',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'SM',
            fontSize: 18,
            color: AppColor.greyColor400,
          ),
        ),
        const SizedBox(height: 60),
        const Text(
          'Mobile Number',
          style: TextStyle(
            fontFamily: 'SM',
            fontSize: 18,
            color: AppColor.greyColor400,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 65,
          child: TextField(
            controller: mobileNumberController,
            style: const TextStyle(
              fontFamily: 'SM',
              fontSize: 16,
              color: AppColor.blackColor,
            ),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: Center(
                    child: SvgPicture.asset(
                      'iran-flag-icon'.toSvg,
                      height: 16,
                      width: 16,
                    ),
                  ),
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 23, vertical: 22),
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
                borderSide: BorderSide(
                  color: AppColor.blueColor,
                  width: 1.3,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 150),
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
                'Next',
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

class _OTPSection extends StatefulWidget {
  const _OTPSection({
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<_OTPSection> createState() => _OTPSectionState();
}

class _OTPSectionState extends State<_OTPSection> {
  late TextEditingController pinController;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    pinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 138,
            width: 138,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.blueColor,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset('mobile_message'.toSvg),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'OTP',
            style: TextStyle(
              fontFamily: 'SB',
              fontSize: 32,
              color: AppColor.blackColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Please enter the OTP sent to your mobile number ',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 18,
                    color: AppColor.greyColor400,
                  ),
                ),
                TextSpan(
                  text: '+98 937 796 4183',
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 18,
                    color: AppColor.blueColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: SizedBox(
            height: 58,
            child: Pinput(
              obscuringWidget: const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  '*',
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 30,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              obscureText: true,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              controller: pinController,
              length: 4,
              defaultPinTheme: const PinTheme(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  color: Color(0xfff1f2f3),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              focusedPinTheme: PinTheme(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(
                    color: AppColor.blueColor,
                    width: 1.3,
                  ),
                ),
              ),
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            ),
          ),
        ),
        const SizedBox(height: 100),
        const Center(
          child: Column(
            children: [
              Text(
                "Didn't receive an OTP?",
                style: TextStyle(
                  fontFamily: 'SM',
                  fontSize: 16,
                  color: AppColor.greyColor400,
                ),
              ),
              Text(
                'Resend OTP',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: 'SSB',
                  fontSize: 18,
                  color: AppColor.blackColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: SizedBox(
            height: 63,
            width: widget.mediaQuery.screenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return _NewPinCodeSection(
                      mediaQuery: widget.mediaQuery,
                    );
                  },
                );
              },
              child: const Text(
                'Next',
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

class _NewPinCodeSection extends StatefulWidget {
  const _NewPinCodeSection({
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<_NewPinCodeSection> createState() => _NewPinCodeSectionState();
}

class _NewPinCodeSectionState extends State<_NewPinCodeSection> {
  late TextEditingController pinController;
  late TextEditingController pinConfirmController;

  String pin = '*';
  String pinConfirm = '';

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
    pinConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    pinController.dispose();
    pinConfirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: context.background,
      ),
      height: 501,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'icon_close'.toSvg,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter New Pin',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 19,
                color: AppColor.blackColor,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 58,
              child: Pinput(
                onChanged: (value) {
                  setState(() {
                    pin = value;
                  });
                },
                obscuringWidget: const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    '*',
                    style: TextStyle(
                      fontFamily: 'SB',
                      fontSize: 30,
                      color: AppColor.blackColor,
                    ),
                  ),
                ),
                obscureText: true,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                controller: pinController,
                length: 5,
                defaultPinTheme: const PinTheme(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    color: Color(0xfff1f2f3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(
                      color: AppColor.blueColor,
                      width: 1.3,
                    ),
                  ),
                ),
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              ),
            ),
            const SizedBox(height: 37),
            const Text(
              'Confirm Pin Code',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 19,
                color: AppColor.blackColor,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 58,
              child: Pinput(
                onChanged: (value) {
                  setState(() {
                    pinConfirm = value;
                  });
                },
                obscuringWidget: const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    '*',
                    style: TextStyle(
                      fontFamily: 'SB',
                      fontSize: 30,
                      color: AppColor.blackColor,
                    ),
                  ),
                ),
                obscureText: true,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                controller: pinConfirmController,
                length: 5,
                defaultPinTheme: const PinTheme(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    color: Color(0xfff1f2f3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(
                      color: AppColor.blueColor,
                      width: 1.3,
                    ),
                  ),
                ),
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  (pin == pinConfirm)
                      ? 'Your PIN codes are the same'
                      : 'Your PIN codes are not the same',
                  style: const TextStyle(
                    fontFamily: 'SM',
                    fontSize: 16,
                    color: AppColor.blackColor,
                  ),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset(
                  (pin == pinConfirm) ? 'icon_tick'.toSvg : 'icon_close'.toSvg,
                  height: 12,
                  width: 12,
                  colorFilter: ColorFilter.mode(
                    (pin == pinConfirm) ? AppColor.blueColor : AppColor.redDark,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 63),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: SizedBox(
                height: 63,
                width: widget.mediaQuery.screenWidth(context),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Done',
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
