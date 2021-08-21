import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MDashBoardScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MSelectTopicScreen.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MConstants.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MImages.dart';

class MSignUpScreen extends StatefulWidget {
  static String tag = '/MSignUpScreen';

  @override
  MSignUpScreenState createState() => MSignUpScreenState();
}

class MSignUpScreenState extends State<MSignUpScreen> {
  bool isSignIn = false;
  String title = 'Join $MAppName';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 1.seconds.delay;
    setStatusBarColor(black);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    if (appStore.isDarkModeOn) {
      setStatusBarColor(black);
    } else {
      setStatusBarColor(white);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget commonButton({required String title, required String icon, Function? onTap}) {
      return Container(
        decoration: boxDecoration(color: white, radius: 5, bgColor: Colors.transparent),
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            8.width,
            Image.asset(icon, height: 20, width: 20),
            16.width,
            Text(title, style: primaryTextStyle(color: white, size: 12)),
          ],
        ),
      ).onTap(onTap);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(app_ic_medium, height: 20, width: 50, fit: BoxFit.fitHeight, color: white),
                    Text(MAppName, style: boldTextStyle(size: 24, color: white)),
                  ],
                ),
                42.height,
                Text(title, style: boldTextStyle(size: 32, color: white)),
                24.height,
                commonButton(
                  icon: MIconGoogle,
                  title: 'Sign up with Google',
                  onTap: () {
                    MSelectTopicScreen().launch(context);
                  },
                ),
                commonButton(
                  icon: MIconFb,
                  title: 'Sign up with Facebook',
                  onTap: () {
                    MSelectTopicScreen().launch(context);
                  },
                ),
                commonButton(
                  icon: MIconTwitter,
                  title: 'Sign up with Twitter',
                  onTap: () {
                    MSelectTopicScreen().launch(context);
                  },
                ).visible(isSignIn),
                Container(
                  decoration: boxDecoration(color: white, radius: 5, bgColor: Colors.transparent),
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      8.width,
                      Image.asset(MIconEmail, height: 20, width: 20, color: white),
                      16.width,
                      Text('Sign up with email', style: primaryTextStyle(color: white, size: 12)),
                    ],
                  ),
                ).onTap(() {
                  MDashBoardScreen().launch(context);
                }),
                8.height,
                createRichText(list: [
                  TextSpan(
                    text: isSignIn ? 'Don\'t have an account? ' : 'Already have an account? ',
                    style: primaryTextStyle(size: 12, color: white),
                  ),
                  TextSpan(text: isSignIn ? 'Sign up.' : 'Sign in.', style: boldTextStyle(size: 12, color: mLimeColor)),
                ], textAlign: TextAlign.center)
                    .onTap(() {
                  if (isSignIn) {
                    isSignIn = false;
                    title = 'Join $MAppName';
                  } else {
                    isSignIn = true;
                    title = 'Welcome Back.';
                  }
                  setState(() {});
                }),
              ],
            ),
            createRichText(
              list: [
                TextSpan(
                  text: 'By Signing up, you agree to our ',
                  style: primaryTextStyle(size: 12, color: white),
                ),
                TextSpan(text: ' Terms of Service ', style: primaryTextStyle(size: 12, color: mLimeColor, decoration: TextDecoration.underline)),
                TextSpan(text: ' and ', style: primaryTextStyle(size: 12, color: white)),
                TextSpan(text: ' acknowledge that our ', style: primaryTextStyle(size: 12, color: white)),
                TextSpan(text: 'Privacy Policy ', style: primaryTextStyle(size: 12, color: mLimeColor, decoration: TextDecoration.underline)),
                TextSpan(text: ' applies to you', style: primaryTextStyle(size: 12, color: white)),
              ],
              textAlign: TextAlign.center,
              maxLines: 3,
            ).paddingBottom(16).visible(!isSignIn),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
