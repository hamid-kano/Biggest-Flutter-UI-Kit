import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDStyle.dart';
import 'package:prokit_flutter/fullApps/smartDeck/Screens/SDLoginScreen.dart';

class SDForgotPwdScreen extends StatefulWidget {
  @override
  _SDForgotPwdScreenState createState() => _SDForgotPwdScreenState();
}

class _SDForgotPwdScreenState extends State<SDForgotPwdScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: context.height(),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 100, left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Password reset', style: boldTextStyle(size: 25)),
                SizedBox(height: 25),
                Text('Enter email address to send reset code', style: secondaryTextStyle(size: 16, color: sdTextSecondaryColor.withOpacity(0.7))),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 8, bottom: 8),
                  decoration: boxDecorations(radius: 5, showShadow: true),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(border: InputBorder.none, hintText: "Email Address"),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(height: 30),
                SDButton(
                  textContent: "SEND",
                  onPressed: () {
                    SDLoginScreen().launch(context);
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
