import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:fintech/widget/custom_box.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({
    super.key,
    required this.mediaQuery,
    required this.navigator,
  });
  final MediaQueryHandler mediaQuery;
  final NavigatorHandler navigator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(top: 80),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const Text(
                          'Available Balance',
                          style: TextStyle(
                            color: AppColor.greyColor200,
                            fontSize: 15,
                            fontFamily: 'SM',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '\$',
                                    style: TextStyle(
                                      fontFamily: 'SR',
                                      fontSize: 34,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '4228',
                                    style: TextStyle(
                                      fontFamily: 'SB',
                                      fontSize: 34,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '.76',
                                    style: TextStyle(
                                      fontFamily: 'SM',
                                      fontSize: 18,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Image.asset(
                                'us_vector'.toPng,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 45, bottom: 25),
                  sliver: SliverToBoxAdapter(
                    child: SizedBox(
                      height: 255,
                      width: mediaQuery.screenWidth(context),
                      child: LineChart(
                        mainData(),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 10, left: 30),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Last 30 Days',
                      style: context.headlineMedium,
                    ),
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(bottom: 30, right: 30, left: 30),
                  sliver: _Last30DaysContent(),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 10, left: 30),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Recent Transactions',
                      style: context.headlineMedium,
                    ),
                  ),
                ),
                SliverPadding(
                  padding:
                      const EdgeInsets.only(bottom: 30, right: 30, left: 30),
                  sliver: _RecentTransactionSection(
                    mediaQuery: mediaQuery,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
              child: CustomAppbar(
                nav: navigator,
                mediaQuery: mediaQuery,
                title: 'Fintech',
                leftIcon: 'icon_arrow_left',
                rightIcon: 'icon_notification',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontFamily: 'SM',
      color: AppColor.greyColor200,
      fontSize: 15,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Nov 10', style: style);
        break;
      case 3:
        text = const Text('Nov 15', style: style);
        break;
      case 5:
        text = const Text('Nov 20', style: style);
        break;

      case 7:
        text = const Text('Nov 25', style: style);
        break;

      case 9:
        text = const Text('Nov 30', style: style);
        break;

      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData() {
    List<Color> gradientColors = [
      AppColor.blueColor,
      const Color(0xfffefefe),
    ];

    return LineChartData(
      lineTouchData: const LineTouchData(
        touchSpotThreshold: 10,
      ),
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 10,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2, 3),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: AppColor.blueColor,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}

class _Last30DaysContent extends StatelessWidget {
  const _Last30DaysContent();

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: ColoredBox(
              color: AppColor.greenLight,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Money In',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 14,
                            color: AppColor.greenDark,
                          ),
                        ),
                        const SizedBox(height: 3),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 18,
                                  color: AppColor.greenDark,
                                ),
                              ),
                              TextSpan(
                                text: '271.00',
                                style: TextStyle(
                                  fontFamily: 'SB',
                                  fontSize: 20,
                                  color: AppColor.greenDark,
                                ),
                              ),
                              TextSpan(
                                text: 'USD',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 10,
                                  color: AppColor.greenDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: ColoredBox(
                          color: AppColor.greenLight,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: SvgPicture.asset(
                              'icon_arrow_down'.toSvg,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: ColoredBox(
              color: AppColor.redLight,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Money Out',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 14,
                            color: AppColor.redDark,
                          ),
                        ),
                        const SizedBox(height: 3),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 18,
                                  color: AppColor.redDark,
                                ),
                              ),
                              TextSpan(
                                text: '271.00',
                                style: TextStyle(
                                  fontFamily: 'SB',
                                  fontSize: 20,
                                  color: AppColor.redDark,
                                ),
                              ),
                              TextSpan(
                                text: 'USD',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 10,
                                  color: AppColor.redDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: ColoredBox(
                          color: AppColor.redLight,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: SvgPicture.asset(
                              'icon_arrow_up'.toSvg,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 89,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
    );
  }
}

class _RecentTransactionSection extends StatefulWidget {
  const _RecentTransactionSection({
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<_RecentTransactionSection> createState() =>
      _RecentTransactionSectionState();
}

class _RecentTransactionSectionState extends State<_RecentTransactionSection> {
  List<String> titles = [
    'Drop Box',
    'Apple Pay',
    'LinkedIn',
  ];

  List<String> paymentDays = [
    '3 Days ago',
    '1 Week ago',
    '1 Month age',
  ];

  List<String> prices = [
    '10.00',
    '8.50',
    '5.00',
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 13),
            child: CustomBox(
              height: 81,
              mediaQuery: widget.mediaQuery,
              child: Row(
                children: [
                  Image.asset(titles[index].toPng),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        titles[index],
                        style: const TextStyle(
                          fontFamily: 'SSB',
                          fontSize: 14,
                          color: AppColor.blackColor,
                        ),
                      ),
                      Text(
                        paymentDays[index],
                        style: const TextStyle(
                          fontFamily: 'SSB',
                          fontSize: 12,
                          color: AppColor.greyColor200,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$${prices[index]}',
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
            ),
          );
        },
        childCount: 3,
      ),
    );
  }
}
