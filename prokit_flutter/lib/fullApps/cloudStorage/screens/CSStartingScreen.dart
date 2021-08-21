import 'package:prokit_flutter/fullApps/cloudStorage/screens/CSCreateAccountScreenByEmail.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/screens/CSDashboardScreen.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/screens/CSSignInScreen.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/screens/CSSignUpScreen.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSImages.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CSStartingScreen extends StatefulWidget {
  static String tag = '/CSStartingScreen';

  @override
  CSStartingScreenState createState() => CSStartingScreenState();
}

class CSStartingScreenState extends State<CSStartingScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Send Videos from the Air', style: boldTextStyle(size: 20)),
              50.height,
              Image.asset(CSCloudboxLogo, height: 200, width: 200),
              50.height,
              googleSignInWidget().onTap(() {
                CSDashboardScreen().launch(context);
              }),
              15.height,
              appleSignInWidget().onTap(() {
                CSCreateAccountScreenByEmail().launch(context);
              }),
              15.height,
              authButtonWidget("Sign Up").onTap(() {
                CSSignUpScreen().launch(context);
              }),
              20.height,
              RichText(
                text: TextSpan(
                  text: "Already have an account?",
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(text: " Sign In", style: TextStyle(color: CSDarkBlueColor)),
                  ],
                ),
              ).onTap(() {
                CSSignInScreen().launch(context);
              }),
            ],
          ).paddingAll(16.0),
        ),
      ),
    );
  }
}
