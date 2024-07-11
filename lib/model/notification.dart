import 'package:fintech/util/notifications_enum.dart';

class Notifications {
  String senderOrNeedy;
  String amount;
  String picture;
  NotificationEnum type;

  Notifications(
    this.senderOrNeedy,
    this.amount,
    this.picture,
    this.type,
  );
}
