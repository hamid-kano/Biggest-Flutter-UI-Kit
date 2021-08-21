import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

import 'MLLoginScreen.dart';

class MLAuthenticationScreen extends StatefulWidget {
  static String tag = '/MLAuthenticationScreen';

  @override
  _MLAuthenticationScreenState createState() => _MLAuthenticationScreenState();
}

class _MLAuthenticationScreenState extends State<MLAuthenticationScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double buttonOpacity = 1.0;
  double buttonHeight = 50.0;
  double containerOpacity = 0.0;
  String? phoneNumber = '+34 409 5446 54664';

  Duration get duration => controller.duration! * controller.value;

  bool get expired => duration.inSeconds == 0;
  int endTime = DateTime.now().millisecond + 1000 * 30;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mlPrimaryColor,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 24.0),
            height: context.height(),
            decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  64.height,
                  Text(mlEnter_code!, style: boldTextStyle(size: 24)),
                  8.height,
                  createRichText(list: [
                    TextSpan(text: mlAuthentication_msg!, style: secondaryTextStyle()),
                    TextSpan(text: phoneNumber!, style: boldTextStyle(color: mlColorDarkBlue)),
                  ]),
                  16.height,
                  otpField(),
                  24.height,
                  Row(
                    children: [Text(mlHave_no_code!, style: primaryTextStyle()), 8.width, Text('Re-send', style: boldTextStyle(color: mlColorDarkBlue, decoration: TextDecoration.underline)), Text('01:58', textAlign: TextAlign.right).expand()],
                  ),
                  24.height,
                  Container(
                    height: buttonHeight,
                    child: AppButton(
                      width: double.infinity,
                      color: mlColorDarkBlue,
                      onTap: () {
                        setState(() {
                          buttonOpacity = 0.0;
                          buttonHeight = 0.0;
                          containerOpacity = 1.0;
                        });
                      },
                      child: Text(mlDone!, style: boldTextStyle(color: white)),
                    ),
                  ).opacity(opacity: buttonOpacity),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Divider(height: 0.5),
                      32.height,
                      Text(mlAdd_password!, style: boldTextStyle(size: 20)),
                      8.height,
                      AppTextField(
                        textFieldType: TextFieldType.PASSWORD,
                        decoration: InputDecoration(
                          labelText: mlPassword!,
                          labelStyle: secondaryTextStyle(size: 16),
                          prefixIcon: Icon(Icons.lock_outline, size: 20),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mlColorLightGrey)),
                        ),
                      ),
                      16.height,
                      AppTextField(
                        textFieldType: TextFieldType.PASSWORD,
                        decoration: InputDecoration(
                          labelText: mlReenter_password!,
                          labelStyle: secondaryTextStyle(size: 16),
                          prefixIcon: Icon(Icons.lock_outline, size: 20),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mlColorLightGrey)),
                        ),
                      ),
                      32.height,
                      AppButton(
                        width: double.infinity,
                        color: mlColorDarkBlue,
                        onTap: () => MLLoginScreen().launch(context),
                        child: Text(mlDone!, style: boldTextStyle(color: white)),
                      ),
                    ],
                  ).opacity(opacity: containerOpacity),
                ],
              ).paddingAll(16.0),
            ),
          ),
          Positioned(
            top: 30,
            child: mlBackToPrevious(context, black),
          ),
        ],
      ),
    );
  }

  Widget otpField() {
    return Wrap(
      children: <Widget>[
        OTPTextField(
          length: 6,
          width: double.infinity,
          fieldWidth: 35,
          style: boldTextStyle(size: 24),
          textFieldAlignment: MainAxisAlignment.spaceBetween,
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
            print("Completed: " + pin);
          },
        ),
      ],
    );
  }
}
