import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';

class MLBookedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(''),
      content: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ml_ic_appointment_booked.toString(), width: 250, height: 200, fit: BoxFit.cover),
          Text('Appointment Booked', style: boldTextStyle(size: 24)),
          4.height,
          Text('Please check the app carefully to keep your health better', style: secondaryTextStyle(size: 12), textAlign: TextAlign.center),
          16.height,
          AppButton(
            height: 50,
            width: context.width(),
            color: mlColorDarkBlue,
            child: Text("Add to Calender", style: primaryTextStyle(color: whiteColor)),
            onTap: () {
              finish(context);
              finish(context);
            },
          ),
          16.height,
          Container(
            alignment: Alignment.center,
            height: 50,
            width: context.width(),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radius(12),
              border: Border.all(color: mlColorBlue),
            ),
            child: Text("Close", style: primaryTextStyle(color: mlColorDarkBlue)),
          ).onTap(() {
            finish(context);
          }),
        ],
      )),
      actions: <Widget>[],
    );
  }
}
