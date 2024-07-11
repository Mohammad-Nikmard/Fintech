import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/widget/custom_notif.dart';
import 'package:flutter/material.dart';

enum NotificationEnum {
  receivedPayment,
  paymentRequest,
  warning,
}

Widget notifWidget(
  NotificationEnum type, {
  required String amount,
  required String picture,
  required String senderOrneedy,
  required MediaQueryHandler mediaQuery,
}) {
  switch (type) {
    case NotificationEnum.receivedPayment:
      return ReceiveNotif(
          amount: amount, picture: picture, sender: senderOrneedy);

    case NotificationEnum.paymentRequest:
      return RequestNotif(
        amount: amount,
        needy: senderOrneedy,
        picture: picture,
        mediaQuery: mediaQuery,
      );

    case NotificationEnum.warning:
      return WarningNotif(
        mediaQuery: mediaQuery,
      );
  }
}
