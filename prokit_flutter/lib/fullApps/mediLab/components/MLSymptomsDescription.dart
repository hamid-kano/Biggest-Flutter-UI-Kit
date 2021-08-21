import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLInboxData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

class MLSymptomsDiscriptionComponent extends StatefulWidget {
  static String tag = '/MLSymptomsDiscriptionComponent';

  @override
  MLSymptomsDiscriptionComponentState createState() => MLSymptomsDiscriptionComponentState();
}

class MLSymptomsDiscriptionComponentState extends State<MLSymptomsDiscriptionComponent> {
  int i = 0;
  List<MLInboxData> data = <MLInboxData>[
    MLInboxData(id: 1, message: mlCovid_desc1),
    MLInboxData(id: 2, message: mlCovid_desc2),
  ];

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About Corona Virus', style: boldTextStyle()),
        8.height,
        for (i = 0; i < data.length; i++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data[i].id.validate().toString() + '. ', style: secondaryTextStyle(size: 16, color: Colors.grey)),
              4.height,
              Text(data[i].message.validate(), style: secondaryTextStyle(size: 16, color: Colors.grey), textAlign: TextAlign.justify).expand()
            ],
          ).paddingAll(8.0),
        8.height,
        Text('Do you have a desire to treat this disease', style: boldTextStyle()),
        8.height,
        for (i = 0; i < data.length; i++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data[i].id.validate().toString() + '. ', style: secondaryTextStyle(size: 16, color: Colors.grey)),
              4.height,
              Text(data[i].message.validate(), style: secondaryTextStyle(size: 16, color: Colors.grey), textAlign: TextAlign.justify).expand()
            ],
          ).paddingAll(8.0),
      ],
    ).paddingAll(16.0);
  }
}
