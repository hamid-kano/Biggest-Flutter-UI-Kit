import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLNewsData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLNewsAnVideoComponent extends StatefulWidget {
  static String tag = '/MLNewsAnVideoComponent';

  @override
  MLNewsAnVideoComponentState createState() => MLNewsAnVideoComponentState();
}

class MLNewsAnVideoComponentState extends State<MLNewsAnVideoComponent> {
  List<MLNewsData> data = mlCovidNewsDataList();

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset((data[0].image).validate(), height: 200, width: context.width(), fit: BoxFit.cover).cornerRadiusWithClipRRect(12.0),
          16.height,
          Text((data[0].title).validate(), style: boldTextStyle()),
          4.height,
          Text(data[0].duration.validate(), style: secondaryTextStyle(size: 16, color: Colors.grey[400])),
          32.height,
          Text('List news', style: boldTextStyle()),
          16.height,
          Column(
            children: data.map((e) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset((e.image).validate(), width: 80, height: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(12.0),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((e.title).validate(), style: boldTextStyle()),
                      8.height,
                      Text((e.duration).validate(), style: secondaryTextStyle(size: 16, color: Colors.grey[400]), textAlign: TextAlign.center),
                    ],
                  ).expand()
                ],
              ).paddingBottom(16.0);
            }).toList(),
          ),
        ],
      ).paddingAll(16.0),
    );
  }
}
