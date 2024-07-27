import 'package:fintech/util/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomMasterCard extends StatelessWidget {
  const CustomMasterCard({
    super.key,
    required this.backgroundColor,
  });
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      height: 228,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Active Balance',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: 'SR',
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontFamily: 'SR',
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: '4,228',
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: '.76',
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(
                  'icon_simcard'.toSvg,
                ),
              ],
            ),
            const Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    '****  ****  ****  ',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontFamily: 'SM',
                    ),
                  ),
                ),
                Text(
                  '8635',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontFamily: 'SM',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              children: [
                Text(
                  'Valid From ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'SR',
                  ),
                ),
                Text(
                  '10/25',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'SB',
                  ),
                ),
                SizedBox(width: 17),
                Text(
                  'Valid Thru ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'SR',
                  ),
                ),
                Text(
                  '10/30',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'SB',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Holder',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'SR',
                      ),
                    ),
                    Text(
                      'Mohammad Nikmard',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'SSB',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.center,
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundColor: const Color(0xfff79e1b),
                    ),
                    Positioned(
                      left: -15,
                      top: 0.5,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor:
                            const Color(0xffeb001b).withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
