import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLMedicationData.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLMedicineScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

import 'MLCalenderComponent.dart';

class MLMedicationComponent extends StatefulWidget {
  static String tag = '/MLMedicationComponent';

  @override
  MLMedicationComponentState createState() => MLMedicationComponentState();
}

class MLMedicationComponentState extends State<MLMedicationComponent> {
  String? date = 'October 2021';

  List<MLMedicationData> data = mlPillDataList();

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
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          16.height,
          MLCalenderComponent(),
          8.height,
          Row(
            children: [
              Text('Today medicine', style: boldTextStyle()).expand(),
              Text(date!, style: boldTextStyle()),
            ],
          ).paddingAll(16.0),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorBlue, borderRadius: radius(12)),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.check, color: white).paddingOnly(top: 28.0, bottom: 28.0),
                    ),
                  ), // instead of background
                  Dismissible(
                    key: UniqueKey(),
                    child: primaryBackground(context, index).onTap(() {
                      MLMedicineScreen(index: 0).launch(context);
                    }),
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        data.removeAt(index);
                      });
                    },
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget primaryBackground(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      padding: EdgeInsets.all(8.0),
      decoration: boxDecorationWithRoundedCorners(
        backgroundColor: white,
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: radius(12),
      ),
      child: Row(
        children: [
          4.width,
          Image.asset((data[index].image).validate(), fit: BoxFit.cover, height: 75, width: 75).cornerRadiusWithClipRRect(8.0),
          10.width,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text((data[index].title).validate(), style: boldTextStyle()),
                  8.height,
                  Text(('1 pill, once for day').validate(), style: secondaryTextStyle()),
                  12.height,
                  Text('09:00 am - Before Eating', style: boldTextStyle(size: 14, color: mlColorBlue)),
                  8.height,
                ],
              ),
            ],
          ).expand(),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.notifications_none, color: Colors.grey.shade400, size: 24),
              32.height,
              Icon(Icons.keyboard_arrow_right, color: Colors.grey.shade400, size: 18),
              8.height,
            ],
          ),
          8.width,
        ],
      ),
    );
  }
}
