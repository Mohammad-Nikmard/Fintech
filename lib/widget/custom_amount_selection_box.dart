import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:flutter/material.dart';

class CustomAmountSelectionBox extends StatefulWidget {
  const CustomAmountSelectionBox({
    super.key,
    required this.mediaQuery,
    required this.selectedAmount,
  });
  final MediaQueryHandler mediaQuery;
  final ValueChanged<String> selectedAmount;

  @override
  State<CustomAmountSelectionBox> createState() =>
      _CustomAmountSelectionBoxState();
}

class _CustomAmountSelectionBoxState extends State<CustomAmountSelectionBox> {
  late TextEditingController amountController;
  int selectedIndex = 1;
  List<String> amountBoxList = [
    '\$100',
    '\$150',
    '\$200',
  ];

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController(text: '\$150.00');
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  Radius.circular(7),
                ),
                borderSide: BorderSide(
                  color: AppColor.blueColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
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

                      widget.selectedAmount(amountController.text);
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
          ),
        ),
      ],
    );
  }
}
