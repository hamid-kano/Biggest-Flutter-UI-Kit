import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';

class MLHospitalDetailComponent extends StatefulWidget {
  static String tag = '/MLHospitalDetailComponent';

  @override
  MLHospitalDetailComponentState createState() => MLHospitalDetailComponentState();
}

class MLHospitalDetailComponentState extends State<MLHospitalDetailComponent> {
  String? hospitalName = 'The NorthSide Hospital -';
  String? hospitalCity = 'Central Hills';
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
    Widget mOption(var value, var heading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(child: Icon(Icons.home, color: mlColorBlue, size: 18).paddingRight(4)),
                TextSpan(text: value, style: primaryTextStyle()),
              ],
            ),
          ),
          Text(heading, style: secondaryTextStyle(size: 16)),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.all(16.0),
      height: context.height(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          32.height,
          Text(hospitalName!, style: boldTextStyle(size: 24)),
          Text(hospitalCity!, style: boldTextStyle(size: 24)),
          8.height,
          Row(
            children: [
              RatingBarWidget(onRatingChanged: (v) {}, rating: 3.5, size: 18),
              Text(rating!, style: secondaryTextStyle()),
            ],
          ),
          16.height,
          Text('Specifications', style: boldTextStyle()),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mOption('34', 'Rooms'),
              mOption('34', 'Rooms'),
              mOption('34', 'Rooms'),
            ],
          ),
          16.height,
          Divider(height: 0.5),
          16.height,
          Text('Information', style: boldTextStyle()),
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
