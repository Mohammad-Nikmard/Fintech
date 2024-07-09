import 'package:flutter/material.dart';

abstract class MediaQueryHandler {
  double screenHeight(BuildContext context);
  double screenWidth(BuildContext context);
}

class AppMediaQuery extends MediaQueryHandler {
  @override
  double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  @override
  double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
