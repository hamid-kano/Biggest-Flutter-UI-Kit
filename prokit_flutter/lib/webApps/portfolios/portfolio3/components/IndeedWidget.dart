import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

import '../../../../main.dart';
import '../Colors.dart';

class IndeedWidget extends StatefulWidget {
  static String tag = '/IndeedWidget';

  @override
  IndeedWidgetState createState() => IndeedWidgetState();
}

class IndeedWidgetState extends State<IndeedWidget> {
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
      padding: EdgeInsets.only(top: 24, bottom: 24),
      color: appStore.isDarkModeOn ? appBackgroundColorDark : portfolio3BackgroundColor,
      child: Column(
        children: [
          24.height,
          Text('I\'am available for freelance projects.', style: secondaryTextStyle(size: 18)),
          16.height,
          Text('Let\'s work together indeed!', style: boldTextStyle(size: 40)),
          24.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32), primary: portfolio3PrimaryColor),
                child: Text('GET QUOTES', style: boldTextStyle(color: Colors.white, size: 18)),
              ),
              16.width,
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: portfolio3PrimaryColor),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                  primary: Colors.transparent,
                ),
                child: Text('HIRE ME', style: boldTextStyle(color: portfolio3PrimaryColor, size: 18)),
              ),
            ],
          ),
          24.height,
        ],
      ),
    );
  }
}
