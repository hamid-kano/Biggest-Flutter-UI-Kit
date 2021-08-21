import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDataProviders.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBNotificationSettingScreen extends StatefulWidget {
  static String tag = '/NBNotificationSettingScreen';

  @override
  NBNotificationSettingScreenState createState() => NBNotificationSettingScreenState();
}

class NBNotificationSettingScreenState extends State<NBNotificationSettingScreen> {
  List<NBNotificationItemModel> mNotificationList = nbGetNotificationItems();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nbAppBarWidget(context, title: 'Notification Setting'),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, index) {
          return Divider();
        },
        itemCount: mNotificationList.length,
        itemBuilder: (_, index) {
          return SwitchListTile(
            contentPadding: EdgeInsets.all(0),
            value: mNotificationList[index].isOn,
            onChanged: (value) {
              setState(() {
                mNotificationList[index].isOn = !mNotificationList[index].isOn;
              });
            },
            title: Text('${mNotificationList[index].title}', style: primaryTextStyle()),
            activeColor: NBPrimaryColor,
          );
        },
      ),
    );
  }
}
