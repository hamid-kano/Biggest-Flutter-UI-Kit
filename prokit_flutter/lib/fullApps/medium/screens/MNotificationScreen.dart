import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';

class MNotificationScreen extends StatefulWidget {
  static String tag = '/MNotificationScreen';

  @override
  MNotificationScreenState createState() => MNotificationScreenState();
}

class MNotificationScreenState extends State<MNotificationScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Notifications', color: black, iconColor: white, textColor: white),
      body: Container(
        color: mGreyColor,
        height: context.height(),
      ),
    );
  }
}
