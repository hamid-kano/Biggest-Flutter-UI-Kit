import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLProfileFormComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLDashboardScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';

class MLUpdateProfileScreen extends StatefulWidget {
  @override
  _MLUpdateProfileScreenState createState() => _MLUpdateProfileScreenState();
}

class _MLUpdateProfileScreenState extends State<MLUpdateProfileScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mlPrimaryColor,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 24.0),
            decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
            height: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  54.height,
                  Text('Update your information', style: boldTextStyle(size: 24)),
                  32.height,
                  MLProfileFormComponent(),
                  42.height,
                ],
              ),
            ),
          ),
          Positioned(top: 30, child: mlBackToPrevious(context, blackColor)),
          Positioned(
            bottom: 8,
            left: 16,
            right: 16,
            child: AppButton(
              height: 50,
              width: context.width(),
              color: mlPrimaryColor,
              onTap: () {
                finish(context);
                finish(context);
                finish(context);
                finish(context);
                return MLDashboardScreen().launch(context);
              },
              child: Text('Save', style: boldTextStyle(color: white)),
            ),
          ),
        ],
      ),
    );
  }
}
