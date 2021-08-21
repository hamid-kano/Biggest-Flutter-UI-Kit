import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusDataGenerator.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

class QIBusNotification extends StatefulWidget {
  static String tag = '/QIBusNotification';

  @override
  QIBusNotificationState createState() => QIBusNotificationState();
}

class QIBusNotificationState extends State<QIBusNotification> {
  late List<QIBusBookingModel> mList;

  @override
  void initState() {
    super.initState();
    mList = QIBusGetNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qIBus_app_background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            title(QIBus_lbl_notification, context),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Notification(mList[index], index);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Notification extends StatelessWidget {
  late QIBusBookingModel model;

  Notification(QIBusBookingModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      decoration: boxDecoration(
        showShadow: true,
        radius: spacing_middle,
      ),
      padding: EdgeInsets.all(spacing_middle),
      margin: EdgeInsets.only(bottom: spacing_standard_new, right: spacing_standard_new, left: spacing_standard_new),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: w * 0.2,
            height: w * 0.2,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: qIBus_colorPrimary, width: spacing_control_half)),
            child: Center(
              child: text("28 May"),
            ),
          ),
          SizedBox(
            width: spacing_standard_new,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              text(model.destination, fontFamily: fontMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
//                  text(
//                    model.passengerName,
//                    textColor: qIBus_textChild,
//                  ),
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(text: model.totalFare, style: TextStyle(fontSize: textSizeMedium, color: qIBus_color_check)),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: spacing_standard),
                          child: Icon(
                            Icons.check_circle,
                            color: qIBus_color_check,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
