import 'package:fintech/model/notification.dart';
import 'package:fintech/util/extensions/theme_extension.dart';
import 'package:fintech/util/mediaquery_handler.dart';
import 'package:fintech/util/navigator.dart';
import 'package:fintech/util/notifications_enum.dart';
import 'package:fintech/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    super.key,
    required this.mediaQuery,
    required this.nav,
  });
  final MediaQueryHandler mediaQuery;
  final NavigatorHandler nav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 30),
                      child: Text(
                        'Today',
                        style: context.headlineMedium,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Divider(
                        thickness: 1.5,
                        color: context.secondaryContainer,
                      ),
                    ),
                  ),
                  _TodayNotifList(
                    mediaQuery: mediaQuery,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 20, left: 30, top: 20),
                      child: Text(
                        'This Week',
                        style: context.headlineMedium,
                      ),
                    ),
                  ),
                  _ThisWeekNotifList(
                    mediaQuery: mediaQuery,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
              child: CustomAppbar(
                nav: nav,
                mediaQuery: mediaQuery,
                title: 'Notifications',
                leftIcon: 'icon_arrow_left',
                rightIcon: 'my_photo.jpg',
                isRightProfile: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TodayNotifList extends StatefulWidget {
  const _TodayNotifList({
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<_TodayNotifList> createState() => _TodayNotifListState();
}

class _TodayNotifListState extends State<_TodayNotifList> {
  List<Notifications> notifs = [
    Notifications(
      'David John',
      '560.00',
      'randomP-1.jpg',
      NotificationEnum.receivedPayment,
    ),
    Notifications(
      'Avian Rizky',
      '369.00',
      'randomP-2.jpg',
      NotificationEnum.paymentRequest,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return notifWidget(
            mediaQuery: widget.mediaQuery,
            notifs[index].type,
            amount: notifs[index].amount,
            senderOrneedy: notifs[index].senderOrNeedy,
            picture: notifs[index].picture,
          );
        },
        childCount: notifs.length,
      ),
    );
  }
}

class _ThisWeekNotifList extends StatefulWidget {
  const _ThisWeekNotifList({
    required this.mediaQuery,
  });
  final MediaQueryHandler mediaQuery;

  @override
  State<_ThisWeekNotifList> createState() => __ThisWeekNotifListState();
}

class __ThisWeekNotifListState extends State<_ThisWeekNotifList> {
  List<Notifications> notifs = [
    Notifications(
      '',
      '',
      '',
      NotificationEnum.warning,
    ),
    Notifications(
      'David John',
      '560.00',
      'randomP-1.jpg',
      NotificationEnum.receivedPayment,
    ),
    Notifications(
      'David John',
      '469.00',
      'randomP-3.jpg',
      NotificationEnum.paymentRequest,
    ),
    Notifications(
      'David John',
      '960.00',
      'randomP-4.jpg',
      NotificationEnum.receivedPayment,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return notifWidget(
            mediaQuery: widget.mediaQuery,
            notifs[index].type,
            amount: notifs[index].amount,
            senderOrneedy: notifs[index].senderOrNeedy,
            picture: notifs[index].picture,
          );
        },
        childCount: notifs.length,
      ),
    );
  }
}
