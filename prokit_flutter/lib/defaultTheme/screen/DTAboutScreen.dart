import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'DTDrawerWidget.dart';

class DTAboutScreen extends StatefulWidget {
  static String tag = '/DTAboutScreen';

  @override
  DTAboutScreenState createState() => DTAboutScreenState();
}

class DTAboutScreenState extends State<DTAboutScreen> {
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
    return Scaffold(
      appBar: appBar(context, 'About'),
      drawer: DTDrawerWidget(),
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: boxDecoration(showShadow: true),
              child: Image.asset('images/app/app_icon.png', height: 100),
            ).cornerRadiusWithClipRRect(50),
            20.height,
            FutureBuilder<String>(
              future: PackageInfo.fromPlatform().then((value) => value.version),
              builder: (_, snap) {
                if (snap.hasData)
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Version:', style: secondaryTextStyle()),
                      5.width,
                      Text(snap.data!, style: primaryTextStyle(size: 18)),
                    ],
                  );
                return SizedBox();
              },
            ),
            10.height,
            Text(LoremText, style: primaryTextStyle(), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
