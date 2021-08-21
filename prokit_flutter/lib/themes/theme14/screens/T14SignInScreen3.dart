import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14SignInScreen3 extends StatefulWidget {
  @override
  _T14SignInScreen3State createState() => _T14SignInScreen3State();
}

class _T14SignInScreen3State extends State<T14SignInScreen3> {
  FocusNode firstDigit = FocusNode();
  FocusNode secondDigit = FocusNode();
  FocusNode thirdDigit = FocusNode();
  FocusNode forthDigit = FocusNode();

  int _counter = 59;
  Timer? _timer;

  void _startTimer() {
    _counter = 59;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (_timer) {
        setState(() {
          if (_counter > 0) {
            _counter--;
          } else {
            _timer.cancel();
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Image.asset(t14_authorisation, width: context.width(), fit: BoxFit.cover),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded, size: 18),
                      onPressed: () {
                        finish(context);
                      },
                    ),
                    Text('Skip', style: boldTextStyle(size: 14)).onTap(() {
                      finish(context);
                    }).paddingOnly(right: 16)
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Security Code', style: boldTextStyle(size: 18)),
                16.height,
                Text(
                  t14_txt_Login3_subtitle,
                  style: primaryTextStyle(size: 16),
                  textAlign: TextAlign.center,
                ),
                PinEntryTextField(),
                16.height,
                Text.rich(
                  TextSpan(
                    text: t14_txt_Verification,
                    style: secondaryTextStyle(),
                    children: <TextSpan>[
                      TextSpan(text: ' $_counter seconds', style: boldTextStyle(color: t14_colorSkyBlue, size: 14)),
                    ],
                  ),
                ).center().onTap(() {
                  _startTimer();
                }),
                16.height,
                t14AppButton(
                  context,
                  btnText: t14_lbl_SignIn3,
                  bgColor: t14_SignInBgColor,
                  width: context.width(),
                  shape: 10.0,
                  txtColor: t14_colorSkyBlue,
                ),
              ],
            ).paddingAll(16),
          ]),
        ),
      ),
    );
  }
}
