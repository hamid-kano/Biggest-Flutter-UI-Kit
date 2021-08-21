import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

class MLDoctorDetailComponent extends StatefulWidget {
  static String tag = '/MLDoctorDetailComponent';

  @override
  MLDoctorDetailComponentState createState() => MLDoctorDetailComponentState();
}

class MLDoctorDetailComponentState extends State<MLDoctorDetailComponent> {
  String? doctorName = 'Dr. Edward Jenner';
  String? subtitle = 'Endocrinology - INternal Medicine';
  String? rating = '4.8 (456 Reviews)';

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
      padding: EdgeInsets.all(16.0),
      height: context.height(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.height,
          Text(doctorName!, style: boldTextStyle(size: 24)),
          8.height,
          Text(subtitle!, style: boldTextStyle(color: mlColorBlue)),
          8.height,
          Row(
            children: [
              RatingBarWidget(onRatingChanged: (v) {}, rating: 3.5, size: 18),
              Text(rating!, style: secondaryTextStyle(size: 16)),
            ],
          ),
          16.height,
          Text('Introduction', style: boldTextStyle()),
          8.height,
          Text(mlCovid_desc1!, textAlign: TextAlign.justify, style: secondaryTextStyle(size: 16)),
          16.height,
          Text('Information', style: boldTextStyle()),
          8.height,
          Divider(height: 0.5),
          16.height,
          Text('Location', style: boldTextStyle(color: mlColorBlue)),
          8.height,
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: boxDecorationWithRoundedCorners(border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined, size: 20, color: Colors.grey),
                4.width,
                Text('35 St Martin\'s St West end', style: boldTextStyle(size: 14, color: Colors.grey)),
              ],
            ),
          ),
          16.height,
          Text('Other Information', style: boldTextStyle(color: mlColorBlue)),
          8.height,
          Text(
            'The job of a doctor is to diagnose and treat illness and injury.'
            ' Doctors examine patients and arrive upon diagnosis, perform surgeries, prescribe medications.',
            style: secondaryTextStyle(size: 16),
            textAlign: TextAlign.justify,
          ),
          32.height,
        ],
      ),
    );
  }
}
