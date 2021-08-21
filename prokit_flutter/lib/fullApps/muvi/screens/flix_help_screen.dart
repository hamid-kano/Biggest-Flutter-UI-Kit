import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_faq_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_images.dart';

class HelpScreen extends StatefulWidget {
  static String tag = '/HelpScreen';

  @override
  HelpScreenState createState() => HelpScreenState();
}

class HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: muvi_appBackground,
      appBar: appBarLayout(context, "Help"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            subType(context, "Report Problem", () {}, ic_report),
            subType(context, "Help Center", () {}, ic_help),
            subType(context, "FAQ", () {
              FaqScreen().launch(context);
            }, ic_faq),
          ],
        ),
      ),
    );
  }
}
