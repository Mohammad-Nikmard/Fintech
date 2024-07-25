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
      backgroundColor: context.background,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                if (progressIndicator == 0) ...{
                  _BankOptionsSection(
                    onTapped: () {
                      setState(() {
                        progressIndicator = 1;
                      });
                    },
                    mediaQuery: widget.mediaQuery,
                  )
                } else if (progressIndicator == 1)
                  ...{}
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: CustomAppbar(
                title: 'Bank Transfer',
                leftIcon: 'icon_arrow_left',
                rightIcon: 'icon_notification',
              ),
            ),
          ],
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
        const Text(
          'Transfer to Bank',
          style: TextStyle(
            fontFamily: 'SSB',
            fontSize: 20,
            color: AppColor.blackColor,
          ),
        ),
        const Text(
          'Search or Select recipients bank',
          style: TextStyle(
            fontFamily: 'SM',
            fontSize: 16,
            color: AppColor.greyColor400,
          ),
        ),
        const SizedBox(height: 5),
        CustomTextField(
          prefixIcon: SvgPicture.asset(
            'icon_search'.toSvg,
          ),
          mediaQuery: widget.mediaQuery,
          hint: 'Search',
          controller: searchController,
          color: const Color(0xff8E949A),
        ),
        const SizedBox(height: 50),
        ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
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
            );
          },
          itemCount: bankNames.length,
        ),
        const SizedBox(height: 80),
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
        )
      ],
    );
  }
}
