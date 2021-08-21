import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLCommonDiseaseScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLSpecialistScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

import 'MLDiseaseHListComponent.dart';
import 'MLSpecialistHListComponet.dart';

class MLDieaseaseComponent extends StatefulWidget {
  static String tag = '/MLDieaseaseComponent';

  @override
  MLDieaseaseComponentState createState() => MLDieaseaseComponentState();
}

class MLDieaseaseComponentState extends State<MLDieaseaseComponent> {
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
    return Container(
      decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
      child: Column(
        children: [
          16.height,
          Row(
            children: [
              Text('Specialist', style: boldTextStyle(size: 18)).expand(),
              Text(mlView_all!, style: secondaryTextStyle(color: mlColorBlue, size: 16)),
              4.width,
              Icon(Icons.arrow_forward_ios, color: mlColorBlue, size: 12),
            ],
          ).paddingAll(16.0).onTap(() {
            MLSpecialistScreen().launch(context);
          }),
          MLSpecialistHorizontalList(),
          16.height,
          MLSpecialistHorizontalList(),
          Row(
            children: [
              Text('Common Disease', style: boldTextStyle(size: 18)).expand(),
              Text(mlView_all!, style: secondaryTextStyle(color: mlColorBlue, size: 16)),
              4.width,
              Icon(Icons.arrow_forward_ios, color: mlColorBlue, size: 12),
            ],
          ).paddingAll(16.0).onTap(() {
            MLCommonDiseaseScreen().launch(context);
          }),
          MLDiseaseHorizontalList(),
          40.height,
        ],
      ),
    );
  }
}
