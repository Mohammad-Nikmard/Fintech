import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomPaymentSuccessful extends StatelessWidget {
  const CustomPaymentSuccessful({
    super.key,
    required this.mediaQuery,
    required this.text,
    required this.title,
    required this.receipt,
  });
  final MediaQueryHandler mediaQuery;
  final String text;
  final String title;
  final Widget receipt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'SSB',
              fontSize: 32,
              color: AppColor.blueColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
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
                    return receipt;
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
