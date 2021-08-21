import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/model/DatingAppModel.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAColors.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DADataGenerator.dart';

class DANotificationScreen extends StatefulWidget {
  @override
  DANotificationScreenState createState() => DANotificationScreenState();
}

class DANotificationScreenState extends State<DANotificationScreen> {
  List<DatingAppModel> list = getNotificationList();

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
      appBar: appBarWidget(
        'Notifications',
        center: true,
        titleTextStyle: boldTextStyle(size: 20),
      ),
      body: Column(
        children: [
          16.height,
          ...list.map(
            (e) {
              return InkWell(
                splashColor: white,
                highlightColor: white,
                onTap: () {
                  e.mISCheck = !e.mISCheck!;
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: grey)),
                  width: context.width(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.name!, style: boldTextStyle()),
                      Switch(
                          activeColor: primaryColor,
                          value: e.mISCheck!,
                          onChanged: (val) {
                            e.mISCheck = !e.mISCheck!;
                            setState(() {});
                          })
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ],
      ).paddingOnly(left: 16, right: 16),
    );
  }
}
