import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTWidgets.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'DTDrawerWidget.dart';

class DTFAQDetailScreen extends StatefulWidget {
  static String tag = '/DTFAQDetailScreen';

  @override
  _DTFAQDetailScreenState createState() => _DTFAQDetailScreenState();
}

class _DTFAQDetailScreenState extends State<DTFAQDetailScreen> {
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
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'What is Airbnb plus and how to different?'),
        drawer: DTDrawerWidget(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hosting', style: secondaryTextStyle(color: appColorPrimary, size: 12)),
              4.height,
              Text('What is Airbnb plus and how to different ?', style: boldTextStyle(size: 24), maxLines: 2),
              8.height,
              Text(LoremText, style: primaryTextStyle(size: 14)),
              16.height,
              FadeInImage(
                placeholder: Image.asset('images/widgets/cupertinoWidgets/grey.jpg', fit: BoxFit.cover).image,
                image: Image.network(SampleImageUrl4).image,
                height: isMobile ? 200 : 300,
                width: context.width(),
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(5),
              16.height,
              Text(LoremText, style: primaryTextStyle(size: 14)),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dot(),
                  16.width,
                  dot(),
                  16.width,
                  dot(),
                ],
              ),
              20.height,
              Text('was this answer helpful ?', style: secondaryTextStyle()),
              8.height,
              Row(
                children: [
                  Container(
                    width: 100,
                    padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                    decoration: BoxDecoration(color: Colors.green.withOpacity(0.7), borderRadius: BorderRadius.all(Radius.circular(30)), border: Border.all(color: Colors.black12, width: 0.5)),
                    child: Text('Yes', style: primaryTextStyle(size: 14, color: white), textAlign: TextAlign.center),
                  ),
                  8.width,
                  Container(
                    width: 100,
                    padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                    decoration: BoxDecoration(color: redColor.withOpacity(0.7), borderRadius: BorderRadius.all(Radius.circular(30)), border: Border.all(color: Colors.black12, width: 0.5)),
                    child: Text('No', style: primaryTextStyle(size: 14, color: white), textAlign: TextAlign.center),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
