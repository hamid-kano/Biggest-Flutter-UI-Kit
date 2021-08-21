import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLDiseaseData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLDiseaseHorizontalList extends StatefulWidget {
  static String tag = '/MLDiseaseHorizontalList';

  @override
  MLDiseaseHorizontalListState createState() => MLDiseaseHorizontalListState();
}

class MLDiseaseHorizontalListState extends State<MLDiseaseHorizontalList> {
  List<MLDiseaseData> listDisease = mlDiseaseDataList();

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
    return HorizontalList(
        wrapAlignment: WrapAlignment.spaceEvenly,
        itemCount: listDisease.length,
        padding: EdgeInsets.only(right: 16, left: 8),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 150,
            padding: EdgeInsets.all(16),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radius(12),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(listDisease[index].image.validate(), fit: BoxFit.cover, height: 100).cornerRadiusWithClipRRect(12.0),
                8.height,
                Text(listDisease[index].title.validate(), style: boldTextStyle(size: 14, color: mlColorDarkBlue)),
                4.height,
                Text(listDisease[index].subtitle.validate(), style: secondaryTextStyle(size: 16)),
                4.height,
              ],
            ),
          ).paddingOnly(left: 8);
        });
  }
}
