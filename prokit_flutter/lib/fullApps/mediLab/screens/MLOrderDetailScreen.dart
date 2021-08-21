import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLOrderTrackingComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';

class MLOrderDetailScreen extends StatefulWidget {
  static String tag = '/MLOrderDetailScreen';

  @override
  MLOrderDetailScreenState createState() => MLOrderDetailScreenState();
}

class MLOrderDetailScreenState extends State<MLOrderDetailScreen> {
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
        body: Column(
          children: [
            8.height,
            Row(
              children: [
                mlBackToPreviousWidget(context, white),
                8.width,
                Text('Order Detail', style: boldTextStyle(size: 24, color: white)).expand(),
                Icon(Icons.info_outline, color: white, size: 24),
                8.width,
              ],
            ).paddingAll(16.0),
            8.height,
            Container(
              decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
              child: MLOrderTrackingDetailComponent(),
            ).expand(),
          ],
        ),
      ),
    );
  }
}
