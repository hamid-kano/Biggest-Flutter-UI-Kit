import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryNotification extends StatefulWidget {
  static String tag = '/GroceryNotification';

  @override
  GroceryNotificationState createState() => GroceryNotificationState();
}

class GroceryNotificationState extends State<GroceryNotification> {
  late List<NotificationModel> mList;

  @override
  void initState() {
    super.initState();
    mList = notificationItem();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, width * 0.25),
        child: TopBar(Icons.close, grocery_title_notifications, Icons.notifications, () {}),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  text("Today", fontFamily: fontMedium, textColor: grocery_textColorSecondary),
                  text(grocery_lbl_clear_all, textColor: grocery_colorPrimary),
                ],
              ).paddingAll(spacing_standard_new),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Notification(mList[index], index);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Notification extends StatelessWidget {
  late NotificationModel model;

  Notification(NotificationModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(spacing_standard),
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
      decoration: boxDecoration(showShadow: true),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: grocery_colorPrimary_light),
            width: width * 0.12,
            height: width * 0.12,
            padding: EdgeInsets.all(width * 0.02),
            child: Icon(Icons.notifications_none, color: grocery_colorPrimary),
          ),
          SizedBox(width: spacing_standard),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(model.name, fontFamily: fontMedium),
                    text(model.duration, textColor: grocery_textColorSecondary),
                  ],
                ),
                text(model.description, textColor: grocery_textColorSecondary, isLongText: true),
              ],
            ),
          )
        ],
      ),
    );
  }
}
