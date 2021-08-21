import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';

import 'BHVerificationScreen.dart';

class BHForgotPasswordScreen extends StatefulWidget {
  static String tag = '/ForgotPasswordScreen';

  @override
  BHForgotPasswordScreenState createState() => BHForgotPasswordScreenState();
}

class BHForgotPasswordScreenState extends State<BHForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BHColorPrimary,
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  finish(context);
                },
                icon: Icon(Icons.arrow_back, color: whiteColor),
              ),
            ),
            Positioned(
              top: 70,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(BHTxtForgotPwd, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: BHAppTextColorPrimary)),
                    16.height,
                    Text(BHForgotPasswordSubTitle, textAlign: TextAlign.center, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                    8.height,
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: blackColor),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        labelText: "Email",
                        labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                      ),
                    ),
                    16.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          primary: BHColorPrimary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onPressed: () {
                          finish(context);
                          BHVerificationScreen().launch(context);
                        },
                        child: Text(
                          BHBtnSend,
                          style: TextStyle(color: whiteColor, fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
