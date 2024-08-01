import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

abstract class NavigatorHandler {
  Future<void> fadeNav(BuildContext context, Widget page);
}

class AppNavigator extends NavigatorHandler {
  @override
  Future<void> fadeNav(BuildContext context, Widget page) async {
    Navigator.push(
      context,
      PageTransition(
        child: page,
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 400),
        reverseDuration: const Duration(milliseconds: 400),
      ),
    );
  }
}
