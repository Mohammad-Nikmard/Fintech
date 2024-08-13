import 'package:fintech/constatns/color_constants.dart';

extension StringToSvg on String {
  String get toSvg => 'assets/images/$this.svg';
}

extension StringToPNG on String {
  String get toPng => 'assets/images/$this.png';
}

extension StringToJpg on String {
  String get toJpg => 'assets/images/$this.jpg';
}

extension LoanDataExtractor on String {
  Map<String, dynamic> get loanValueCalculator {
    switch (this) {
      case 'Home Loan':
        return {
          'amount': '12000.00',
          'iconBoxColor': AppColor.greenLight,
          'iconColor': AppColor.greenDark,
          'icon': 'icon_home'
        };

      case 'Business Loan':
        return {
          'amount': '15000.00',
          'iconBoxColor': AppColor.redLight,
          'iconColor': AppColor.redDark,
          'icon': 'icon_business_loan'
        };

      case 'Education Loan':
        return {
          'amount': '8000.00',
          'iconBoxColor': AppColor.blueLight,
          'iconColor': AppColor.blueColor,
          'icon': 'icon_education_loan'
        };

      case 'Car Loan':
        return {
          'amount': '8000.00',
          'iconBoxColor': AppColor.yellowLight,
          'iconColor': AppColor.yellowDark,
          'icon': 'icon_car_loan'
        };

      default:
        return {};
    }
  }
}
