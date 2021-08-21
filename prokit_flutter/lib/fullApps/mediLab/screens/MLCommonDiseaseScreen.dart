import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLCommonDiseaseListComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLDiseaseData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLCommonDiseaseScreen extends StatefulWidget {
  static String tag = '/MLCommonDiseaseScreen';

  @override
  MLCommonDiseaseScreenState createState() => MLCommonDiseaseScreenState();
}

class MLCommonDiseaseScreenState extends State<MLCommonDiseaseScreen> {
  int i = 0;
  List<MLDiseaseData> data = mlDiseaseDataList();

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: mlPrimaryColor,
        body: Container(
          padding: EdgeInsets.all(16.0),
          decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              8.height,
              Row(
                children: [
                  8.width,
                  mlBackToPreviousWidget(context, black),
                  8.width,
                  Text('Common Disesase', style: boldTextStyle(size: 24)).expand(),
                ],
              ),
              16.height,
              MLCommonDiseaseListComponent().expand()
            ],
          ),
        ),
      ),
    );
  }
}
