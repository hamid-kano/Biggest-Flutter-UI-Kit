import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLNotificationData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLNotificationComponent extends StatefulWidget {
  static String tag = '/MLNotificationComponent';

  @override
  MLNotificationComponentState createState() => MLNotificationComponentState();
}

class MLNotificationComponentState extends State<MLNotificationComponent> {
  List<MLNotificationData> data = mlNotificationDataList();
  bool checked = false;
  int? newNotification = 3;
  Color customColor = mlColorBlue;
  bool valuefirst = false;
  bool valuesecond = false;

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
    return SingleChildScrollView(
      child: Column(
        children: data.map((e) {
          return Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            padding: EdgeInsets.all(16.0),
            decoration: boxDecorationRoundedWithShadow(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: Colors.grey.shade50,
                    borderRadius: radius(8),
                  ),
                  child: Image.asset((e.image).validate(), fit: BoxFit.fill),
                ),
                8.width,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text((e.title).validate(), style: secondaryTextStyle(color: black)),
                    8.height,
                    (e.status != null && e.status != '') ? Text((e.status).validate(), style: secondaryTextStyle()) : 0.height,
                    (e.status != null && e.status != '') ? 8.height : 0.height,
                    Row(
                      children: [
                        Text((e.time).validate(), style: boldTextStyle(size: 14, color: Colors.blue)).expand(),
                        (e.status != null && e.status != '')
                            ? Container(
                                padding: EdgeInsets.all(2.0),
                                decoration: boxDecorationWithRoundedCorners(
                                  backgroundColor: (e.status == 'Canceled') ? mlColorRed : Colors.green,
                                  borderRadius: radius(10),
                                ),
                                child: Text((e.status).validate(), style: secondaryTextStyle(color: white)).paddingOnly(left: 8.0, right: 8.0),
                              )
                            : Container(width: 0, height: 0),
                      ],
                    ),
                  ],
                ).expand(),
              ],
            ),
          );
        }).toList(),
      ).paddingOnly(right: 16.0, left: 16.0),
    );
  }
}
