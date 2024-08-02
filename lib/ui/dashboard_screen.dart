import 'package:fintech/constatns/color_constants.dart';
import 'package:fintech/ui/home_screen.dart';
import 'package:fintech/util/extensions/string_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    required this.mediaQuery,
    required this.navigator,
  });
  final MediaQueryHandler mediaQuery;
  final NavigatorHandler navigator;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      backgroundColor: const Color(0xfff9f9fb),
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 250),
          curve: Curves.decelerate,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 80,
      navBarStyle: NavBarStyle.style8,
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(
        mediaQuery: widget.mediaQuery,
        nav: widget.navigator,
      ),
      Scaffold(),
      Scaffold(),
      Scaffold(),
      Scaffold(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 21,
          width: 24,
          child: Center(
            child: SvgPicture.asset(
              'icon_home'.toSvg,
              colorFilter: const ColorFilter.mode(
                AppColor.blueColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        inactiveIcon: SizedBox(
          height: 21,
          width: 24,
          child: Center(
            child: SvgPicture.asset(
              'icon_home'.toSvg,
              colorFilter: const ColorFilter.mode(
                AppColor.greyColor200,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 21,
          width: 24,
          child: Center(
            child: SvgPicture.asset(
              'icon_map'.toSvg,
              colorFilter: const ColorFilter.mode(
                AppColor.blueColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        inactiveIcon: SizedBox(
          height: 21,
          width: 24,
          child: Center(
            child: SvgPicture.asset(
              'icon_map'.toSvg,
              colorFilter: const ColorFilter.mode(
                AppColor.greyColor200,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 21,
          width: 24,
          child: Center(
            child: SvgPicture.asset(
              'icon_scan'.toSvg,
              colorFilter: const ColorFilter.mode(
                AppColor.blueColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        inactiveIcon: SizedBox(
          height: 21,
          width: 24,
          child: Center(
            child: SvgPicture.asset(
              'icon_scan'.toSvg,
              colorFilter: const ColorFilter.mode(
                AppColor.greyColor200,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 21,
          width: 24,
          child: Center(
            child: SvgPicture.asset(
              'icon_analytics'.toSvg,
              colorFilter: const ColorFilter.mode(
                AppColor.blueColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        inactiveIcon: SizedBox(
          height: 21,
          width: 24,
          child: Center(
            child: SvgPicture.asset(
              'icon_analytics'.toSvg,
              colorFilter: const ColorFilter.mode(
                AppColor.greyColor200,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 21,
          width: 24,
          child: Center(
            child: SvgPicture.asset(
              'icon_category'.toSvg,
              colorFilter: const ColorFilter.mode(
                AppColor.blueColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        inactiveIcon: SizedBox(
          height: 21,
          width: 24,
          child: Center(
            child: SvgPicture.asset(
              'icon_category'.toSvg,
              colorFilter: const ColorFilter.mode(
                AppColor.greyColor200,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
