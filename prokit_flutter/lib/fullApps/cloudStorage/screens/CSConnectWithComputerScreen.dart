import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/screens/CSDashboardScreen.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSConstants.dart';

class CSConnectWithComputerScreen extends StatefulWidget {
  static String tag = '/CSConnectWithComputerScreen';

  @override
  CSConnectWithComputerScreenState createState() => CSConnectWithComputerScreenState();
}

class CSConnectWithComputerScreenState extends State<CSConnectWithComputerScreen> {
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
      appBar: appBarWidget(""),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Wrap(
            children: [
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "On your computer, go to ",
                    style: primaryTextStyle(size: 24),
                    children: [TextSpan(text: "$CSAppName.com/connect", style: boldTextStyle(size: 25))],
                  ))
            ],
          ),
          Container(width: 250, height: 250, color: Colors.black).onTap(() {
            CSDashboardScreen().launch(context);
            // finish(context);
          }).paddingTop(20),
          Wrap(children: [
            Text(
              "Point your phone at your computer with the website above and wait.",
              style: primaryTextStyle(size: 20),
              textAlign: TextAlign.center,
            ).paddingTop(20)
          ])
        ]).paddingAll(20),
      ),
    );
  }
}
