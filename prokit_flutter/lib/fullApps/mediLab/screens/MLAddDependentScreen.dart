import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLProfileFormComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';

class MLAddDependentScreen extends StatefulWidget {
  static String tag = '/MLAddDependentScreen';

  @override
  MLAddDependentScreenState createState() => MLAddDependentScreenState();
}

class MLAddDependentScreenState extends State<MLAddDependentScreen> {
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
      backgroundColor: mlPrimaryColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: context.height(),
              padding: EdgeInsets.all(16.0),
              decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    mlBackToPreviousWidget(context, black),
                    34.height,
                    Text('Add A Dependent', style: boldTextStyle(size: 24)),
                    16.height,
                    MLProfileFormComponent(),
                    48.height,
                  ],
                ),
              ),
            ),
            AppButton(
              width: context.width(),
              color: mlColorDarkBlue,
              child: Text("Save", style: boldTextStyle(color: white)),
              onTap: () {
                finish(context);
              },
            ).paddingOnly(right: 16, left: 16, bottom: 16),
          ],
        ),
      ),
    );
  }
}
