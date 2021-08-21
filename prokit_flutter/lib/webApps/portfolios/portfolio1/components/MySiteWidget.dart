import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/DataGenerator.dart';

import '../../../../main.dart';

class MySiteWidget extends StatefulWidget {
  static String tag = '/MySiteScreen';

  @override
  MySiteWidgetState createState() => MySiteWidgetState();
}

class MySiteWidgetState extends State<MySiteWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      padding: EdgeInsets.only(left: 42, right: 42),
      margin: EdgeInsets.only(left: 42, right: 42, bottom: 42),
      child: Column(
        children: [
          Column(
            children: [
              40.height,
              Text('Welcome To My Site', style: primaryTextStyle(size: 36, color: appStore.textPrimaryColor)),
              32.height,
              Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem '
                      'Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum'
                      'Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum'
                      ' is simply dummy text of the printing and typesetting industry.',
                      style: boldTextStyle(size: 16, color: appStore.textSecondaryColor),
                      textAlign: TextAlign.center)
                  .withWidth(context.width() * 0.5),
              32.height,
            ],
          ).paddingOnly(left: 32, right: 32),
          50.height,
          Wrap(
            spacing: 30,
            runSpacing: 20,
            children: getSkills().map((e) {
              return Container(
                width: context.width() * 0.25,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.title!, style: boldTextStyle(size: 14)),
                    8.height,
                    LinearProgressIndicator(
                      value: e.percentage, // percent filled
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      backgroundColor: Color(0xFFE9ECF0),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
          40.height,
        ],
      ),
    );
  }
}
