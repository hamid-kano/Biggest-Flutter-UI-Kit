import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/DataGenerator.dart';

import '../../../../main.dart';
import '../Colors.dart';

class ServicesScreen extends StatefulWidget {
  static String tag = '/ServicesScreen';

  @override
  ServicesScreenState createState() => ServicesScreenState();
}

class ServicesScreenState extends State<ServicesScreen> {
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
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 30, bottom: 30),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 16,
        spacing: 16,
        children: getPortfolio2Services().map((e) {
          return Container(
            width: context.width() * 0.25,
            height: 200,
            decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor!),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.computer_rounded, color: portfolio2PrimaryColor, size: 34),
                16.height,
                Text(e.name!, style: boldTextStyle()),
                4.height,
                Text(e.desc!, style: secondaryTextStyle(), textAlign: TextAlign.center, maxLines: 4).paddingOnly(left: 8, right: 8),
              ],
            ),
          );
        }).toList(),
      ).withWidth(context.width() * 0.8),
    );
  }
}
