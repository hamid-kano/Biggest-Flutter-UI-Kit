import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLMedicationData.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLMedicineScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLAllMedicineComponent extends StatefulWidget {
  @override
  MLAllMedicineComponentState createState() => MLAllMedicineComponentState();
}

class MLAllMedicineComponentState extends State<MLAllMedicineComponent> {
  String? time = '09:00 am -Before Eating';
  String? numberOfPill = '1 pill once for day';
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
      padding: EdgeInsets.only(bottom: 42.0),
      child: Column(
        children: data.map((e) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(12.0),
            decoration: boxDecorationWithRoundedCorners(border: Border.all(color: Colors.grey.withOpacity(0.3)), borderRadius: radius(12)),
            child: Row(
              children: [
                Image.asset((e.image).validate(), height: 75, width: 75, fit: BoxFit.cover).cornerRadiusWithClipRRect(8.0),
                8.width,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text((e.title).validate(), style: boldTextStyle()),
                    8.height,
                    Text(numberOfPill!, style: secondaryTextStyle()),
                    12.height,
                    Text(time!, style: boldTextStyle(color: mlColorBlue)),
                    8.height,
                  ],
                ).expand(),
                8.width,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications_none, color: Colors.grey.shade400, size: 24),
                    32.height,
                    Icon(Icons.keyboard_arrow_right, color: Colors.grey.shade400, size: 18),
                    8.height,
                  ],
                ),
              ],
            ).onTap(() {
              MLMedicineScreen(index: 1).launch(context);
            }),
          );
        }).toList(),
      ),
    );
  }
}
