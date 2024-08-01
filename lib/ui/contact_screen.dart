import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({
    super.key,
    required this.mediaQuery,
    required this.nav,
  });
  final MediaQueryHandler mediaQuery;
  final NavigatorHandler nav;

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late TextEditingController callController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    callController = TextEditingController(text: '+98 9377964183');
    emailController = TextEditingController(text: 'mnikmard1344@gmail.com');
  }

  @override
  void dispose() {
    super.dispose();
    callController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              CustomAppbar(
                nav: widget.nav,
                mediaQuery: widget.mediaQuery,
                title: 'Contact',
                leftIcon: 'icon_arrow_left',
                rightIcon: 'icon_notification',
              ),
              const SizedBox(height: 48),
              Text(
                'Call Us',
                style: context.headlineMedium,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                prefixIcon: SizedBox(
                  height: 22,
                  width: 22,
                  child: Center(
                    child: SvgPicture.asset(
                      'icon_call'.toSvg,
                      colorFilter: const ColorFilter.mode(
                        AppColor.greyColor200,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                readOnly: true,
                textColor: AppColor.greyColor200,
                mediaQuery: widget.mediaQuery,
                hint: '',
                controller: callController,
                color: context.secondaryContainer,
              ),
              const SizedBox(height: 20),
              Text(
                'Your Name',
                style: context.headlineMedium,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                prefixIcon: SizedBox(
                  height: 22,
                  width: 22,
                  child: Center(
                    child: SvgPicture.asset(
                      'icon_bag'.toSvg,
                      colorFilter: const ColorFilter.mode(
                        AppColor.greyColor200,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                readOnly: true,
                textColor: AppColor.greyColor200,
                mediaQuery: widget.mediaQuery,
                hint: '',
                controller: emailController,
                color: context.secondaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
