import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

void initServiceLocator() {
  locator.registerSingleton<MediaQueryHandler>(AppMediaQuery());

  locator.registerSingleton<NavigatorHandler>(AppNavigator());
}
