import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBForgotPasswordScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBHomeScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBSingUpScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBImages.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBSignInScreen extends StatefulWidget {
  static String tag = '/NBSignInScreen';

  @override
  NBSignInScreenState createState() => NBSignInScreenState();
}

class NBSignInScreenState extends State<NBSignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.height,
            Text('Welcome to\nNews Blog', style: boldTextStyle(size: 30)),
            30.height,
            nbAppTextFieldWidget(emailController, 'Email Address', TextFieldType.EMAIL, focus: emailFocus, nextFocus: passwordFocus),
            16.height,
            nbAppTextFieldWidget(passwordController, 'Password', TextFieldType.PASSWORD, focus: passwordFocus),
            16.height,
            Align(
                alignment: Alignment.centerRight,
                child: Text('Forgot Password?', style: boldTextStyle(color: NBPrimaryColor)).onTap(() {
                  NBForgotPasswordScreen().launch(context);
                })),
            16.height,
            nbAppButtonWidget(context, 'Sign In', () {
              NBHomeScreen().launch(context);
            }),
            30.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?', style: primaryTextStyle()),
                Text(' Sign Up', style: boldTextStyle(color: NBPrimaryColor)).onTap(() {
                  NBSingUpScreen().launch(context);
                }),
              ],
            ),
            50.height,
            Row(
              children: [
                Divider(thickness: 2).expand(),
                8.width,
                Text('Or Sign In with', style: secondaryTextStyle()),
                8.width,
                Divider(thickness: 2).expand(),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  child: Row(
                    children: [
                      Image.asset(NBFacebookLogo, width: 20, height: 20),
                      8.width,
                      Text('Facebook', style: primaryTextStyle(color: white)),
                    ],
                  ),
                  onTap: () {},
                  width: (context.width() - (3 * 16)) * 0.5,
                  color: NBFacebookColor,
                  elevation: 0,
                ).cornerRadiusWithClipRRect(20),
                16.width,
                AppButton(
                  child: Row(
                    children: [
                      Image.asset(NBGoogleLogo, width: 20, height: 20),
                      8.width,
                      Text('Google', style: primaryTextStyle(color: black)),
                    ],
                  ),
                  onTap: () {},
                  width: (context.width() - (3 * 16)) * 0.5,
                  elevation: 0,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(width: 1, color: grey)),
                ),
              ],
            ),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
