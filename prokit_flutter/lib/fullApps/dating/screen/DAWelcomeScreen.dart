import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DACreateAccountScreen.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DASignInScreen.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAColors.dart';

class DAWelcomeScreen extends StatefulWidget {
  @override
  DAWelcomeScreenState createState() => DAWelcomeScreenState();
}

class DAWelcomeScreenState extends State<DAWelcomeScreen> {
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('apes', style: boldTextStyle(size: 35)).center().expand(),
            42.height,
            Text('No more lonely \n days!', style: boldTextStyle(size: 25), textAlign: TextAlign.center),
            16.height,
            Text('Sign in and find your couple now!', style: primaryTextStyle()),
            32.height,
            Container(
              width: context.width(),
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
              decoration: BoxDecoration(border: Border.all(color: grey), borderRadius: BorderRadius.circular(10)),
              child: Text('Do you already have an account?', style: boldTextStyle(), textAlign: TextAlign.center),
            ).onTap((){
              finish(context);
              DACreateAccountScreen().launch(context);
            },highlightColor: white, splashColor: white),
            8.height,
            AppButton(
              text: 'Get Started',
              textStyle: boldTextStyle(color: white),
              width: context.width(),
              color: primaryColor,
              onTap: () {
                finish(context);
                DASignInScreen().launch(context);
              },
            ).paddingOnly(left: 16, right: 16,bottom: 16)
          ],
        ),
      ),
    );
  }
}
