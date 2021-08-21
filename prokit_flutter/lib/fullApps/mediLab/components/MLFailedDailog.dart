import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLConfirmAppointmentComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

class MLFailedDailog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(''),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ml_ic_appointment_booked.toString(), width: 150, height: 150),
            Text('Booking Failed !!!', style: boldTextStyle(size: 24, color: mlColorRed)),
            4.height,
            Text(mlBooking_fail_message!, style: secondaryTextStyle(size: 12)),
            12.height,
            AppButton(
                height: 50,
                width: 350,
                color: mlColorDarkBlue,
                child: Text("Back to Booking", style: primaryTextStyle(color: whiteColor)),
                onTap: () {
                  MLConfirmAppointmentComponent().launch(context);
                }).paddingOnly(bottom: 12.0),
          ],
        ),
      ),
      actions: <Widget>[],
    );
  }
}
