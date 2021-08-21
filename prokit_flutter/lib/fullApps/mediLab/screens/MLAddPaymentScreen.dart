import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLAddPaymentListComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLBookedDailog.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';

class MLAddPaymentScreen extends StatefulWidget {
  static String tag = '/MLAddPaymentScreen';

  @override
  MLAddPaymentScreenState createState() => MLAddPaymentScreenState();
}

class MLAddPaymentScreenState extends State<MLAddPaymentScreen> {
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
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 90),
              decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Add a Payment', style: boldTextStyle(size: 24)),
                  8.height,
                  Text('Choose your payment method for hospital clinic visit', style: secondaryTextStyle(size: 16)),
                  16.height,
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        MLAddPaymentListComponent(),
                        8.height,
                        Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12), border: Border.all(color: mlColorBlue)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Add New card', style: primaryTextStyle(color: mlColorDarkBlue)),
                              8.width,
                              Icon(Icons.add_circle_outline, color: mlColorDarkBlue, size: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingOnly(right: 16.0, left: 16.0),
            ),
            Positioned(
              top: 32.0,
              left: 24.0,
              child: mlBackToPreviousWidget(context, black),
            ),
            Positioned(
              bottom: 8,
              right: 16.0,
              left: 16.0,
              child: Column(
                children: [
                  8.height,
                  AppButton(
                    width: context.width(),
                    color: mlColorDarkBlue,
                    child: Text("Save", style: boldTextStyle(color: white)),
                    onTap: () {
                      _showDialog(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return MLBookedDialog();
        });
  }
}
