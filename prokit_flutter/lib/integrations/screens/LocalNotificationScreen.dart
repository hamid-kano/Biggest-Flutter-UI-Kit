import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LocalNotificationScreen extends StatefulWidget {
  static String tag = '/LocalNotificationScreen';

  @override
  LocalNotificationScreenState createState() => LocalNotificationScreenState();
}

class LocalNotificationScreenState extends State<LocalNotificationScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  AndroidInitializationSettings? androidInitializationSettings;
  IOSInitializationSettings? iosInitializationSettings;
  late InitializationSettings initializationSettings;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    androidInitializationSettings = AndroidInitializationSettings('app_icon2');
    iosInitializationSettings = IOSInitializationSettings();
    initializationSettings = InitializationSettings(android: androidInitializationSettings, iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Local Notification"),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: appColorPrimary,
              ),
              onPressed: () {
                buildSingleNotification();
              },
              child: Text("Simple notification", style: boldTextStyle(color: Colors.white, size: 16)),
            ).paddingAll(16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: appColorPrimary,
              ),
              onPressed: () {
                buildMultipleNotification();
              },
              child: Text("Multiple notification", style: boldTextStyle(color: Colors.white, size: 16)),
            ).paddingAll(8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: appColorPrimary,
              ),
              onPressed: () {
                buildBigPictureNotification();
              },
              child: Text("Big Picture notification", style: boldTextStyle(color: Colors.white, size: 16)),
            ).paddingAll(16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: appColorPrimary,
              ),
              onPressed: () {
                buildInboxStyleNotification();
              },
              child: Text("Inbox notification", style: boldTextStyle(color: Colors.white, size: 16)),
            ).paddingAll(8)
          ],
        ),
      ).center(),
    );
  }

  Future<void> buildSingleNotification() async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'Channel ID',
      'Channel title',
      'channel body',
      priority: Priority.high,
      importance: Importance.max,
      icon: "app_icon2",
      channelShowBadge: true,
      largeIcon: DrawableResourceAndroidBitmap("app_icon"),
    );

    NotificationDetails notificationDetail = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(0, 'New Notification', 'New User send Message', notificationDetail);
  }

  Future<void> buildMultipleNotification() async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'Channel ID',
      'Channel title',
      'channel body',
      priority: Priority.high,
      importance: Importance.max,
      groupKey: 'commonMessage',
    );

    NotificationDetails notificationDetail = NotificationDetails(android: androidNotificationDetails);

    flutterLocalNotificationsPlugin.show(0, 'New Notification', 'User 1 send Message', notificationDetail);

    Future.delayed(Duration(milliseconds: 1000), () {
      flutterLocalNotificationsPlugin.show(1, 'New Notification', 'User 2 send Message', notificationDetail);
    });

    Future.delayed(Duration(milliseconds: 1500), () {
      flutterLocalNotificationsPlugin.show(2, 'New Notification', 'User 3 send Message', notificationDetail);
    });

    List<String> lines = ['user1', 'user2', 'user3'];

    InboxStyleInformation inboxStyleInformation = InboxStyleInformation(lines, contentTitle: '${lines.length} messages', summaryText: 'prokit_flutter.com');

    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'groupChannelId',
      'groupChannelName',
      'groupChannelDescription',
      styleInformation: inboxStyleInformation,
      groupKey: 'commonMessage',
      setAsGroupSummary: true,
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    flutterLocalNotificationsPlugin.show(3, 'Attention', '${lines.length} messages', platformChannelSpecifics);
  }

  Future<void> buildBigPictureNotification() async {
    BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap("app_icon"),
      largeIcon: DrawableResourceAndroidBitmap("app_icon"),
      contentTitle: 'prokit notification',
    );

    AndroidNotificationDetails bigPictureNoti = AndroidNotificationDetails('bigChannelId', 'bigChannelName', 'bigChannelDescription', styleInformation: bigPictureStyleInformation);

    NotificationDetails platformChannelSpecifics = NotificationDetails(android: bigPictureNoti);

    await flutterLocalNotificationsPlugin.show(4, 'New Notification', 'someone send Image', platformChannelSpecifics);
  }

  Future<void> buildInboxStyleNotification() async {
    InboxStyleInformation inboxInfo = InboxStyleInformation(
      ["this is a inbox style notification", "this is use to show an inbox style notification in flutter", "this is use for more show more text content in flutter"],
      contentTitle: "Prokit Flutter",
    );

    AndroidNotificationDetails infoNotification = AndroidNotificationDetails('InboxChannelId', 'InboxChannelName', 'InboxChannelDescription', styleInformation: inboxInfo);

    NotificationDetails infoDetails = NotificationDetails(android: infoNotification);

    flutterLocalNotificationsPlugin.show(5, 'New notification', 'Inbox Notification Flutter', infoDetails);
  }
}
