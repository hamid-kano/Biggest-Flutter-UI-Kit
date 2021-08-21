import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLTopHospitalData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';

class MLAppointmentDetailList extends StatefulWidget {
  @override
  MLAppointmentDetailListState createState() => MLAppointmentDetailListState();
}

class MLAppointmentDetailListState extends State<MLAppointmentDetailList> {
  List<MLTopHospitalData> topHospitalList = mlHospitalListDataList();

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

  Widget mOption(var value) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(Icons.location_searching, size: 12).paddingRight(8),
          ),
          TextSpan(text: value, style: secondaryTextStyle(size: 12, color: black)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(bottom: 80),
        padding: EdgeInsets.all(12.0),
        decoration: boxDecorationWithRoundedCorners(border: Border.all(color: mlColorLightGrey), borderRadius: radius(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset((topHospitalList[0].image).validate(), width: double.infinity, height: 150.0, fit: BoxFit.cover).cornerRadiusWithClipRRect(8.0),
            16.height,
            Text((topHospitalList[0].title).validate(), style: boldTextStyle()),
            16.height,
            Divider(thickness: 0.5),
            16.height,
            mOption('Location'),
            8.height,
            Text(topHospitalList[0].city.validate(), style: primaryTextStyle(color: mlColorDarkBlue)).paddingLeft(18.0),
            16.height,
            mOption('Service'),
            4.height,
            Text('Endocrinology -' + topHospitalList[0].fees.validate(), style: primaryTextStyle(color: mlColorDarkBlue)).paddingLeft(18.0),
            16.height,
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 4),
                  decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorCyan, borderRadius: radius(12)),
                  child: Image.asset(ml_ic_doctor_image!, height: 50, width: 50),
                ),
                8.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Doctor', style: secondaryTextStyle(color: black)),
                    8.height,
                    Text('Dr. Stephen Chew', style: primaryTextStyle(color: mlColorDarkBlue)),
                  ],
                ),
              ],
            ),
            16.height,
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 4.0),
                  decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12), backgroundColor: mlColorCyan),
                  child: Image.asset(ml_ic_profile_picture!, height: 50, width: 50),
                ),
                8.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Patient', style: secondaryTextStyle(color: black)),
                    8.height,
                    Text('Kaixa Pham', style: primaryTextStyle(color: mlColorDarkBlue)),
                  ],
                ),
              ],
            ),
            16.height,
            mOption('Service'),
            4.height,
            Text('Thu, Mar 18 -08:00 AM', style: primaryTextStyle(color: mlColorDarkBlue)).paddingLeft(18.0),
            16.height,
            mOption('Payment Method'),
            4.height,
            Text('Payment at the clinic', style: primaryTextStyle(color: mlColorDarkBlue)).paddingLeft(18.0),
          ],
        ),
      ).paddingAll(16.0),
    );
  }
}
