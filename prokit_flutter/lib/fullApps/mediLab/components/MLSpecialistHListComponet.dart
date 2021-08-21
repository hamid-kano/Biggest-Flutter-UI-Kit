import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLSpecialistData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLSpecialistHorizontalList extends StatefulWidget {
  static String tag = '/MLSpecialistHorizontalList';

  @override
  MLSpecialistHorizontalListState createState() => MLSpecialistHorizontalListState();
}

class MLSpecialistHorizontalListState extends State<MLSpecialistHorizontalList> {
  List<MLSpecialistData> listSpecialist = mlSpecialistDataDataList();

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
        padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 8.0),
        wrapAlignment: WrapAlignment.spaceEvenly,
        itemCount: listSpecialist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 4),
            padding: EdgeInsets.all(16),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radius(12.0),
              border: Border.all(color: Colors.grey.shade100),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.grey.shade50, borderRadius: radius(12.0)),
                  child: Image.asset(listSpecialist[index].image.validate(), fit: BoxFit.fill, width: 48, height: 48),
                ),
                8.height,
                Text(listSpecialist[index].title.validate(), style: boldTextStyle(size: 14, color: mlColorDarkBlue)),
                4.height,
                Text(listSpecialist[index].subtitle.validate(), style: secondaryTextStyle()),
                4.height,
              ],
            ),
          );
        });
  }
}
