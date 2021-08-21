import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14SignInScreen4 extends StatefulWidget {
  @override
  _T14SignInScreen4State createState() => _T14SignInScreen4State();
}

class _T14SignInScreen4State extends State<T14SignInScreen4> {
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: context.height() * 0.56,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.topLeft, colors: [t14_txt_Login4BgColor2, t14_txt_Login4BgColor1]),
              ),
            ),
            Column(
              children: [
                40.height,
                Image.asset(t14_signIn4, fit: BoxFit.cover, height: context.height() * 0.62, alignment: Alignment.center),
                16.height,
                Container(
                  color: white,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(t14_txt_WalkThrough1_title, textAlign: TextAlign.center, style: boldTextStyle(color: t14_colorBlue, size: 20)),
                      8.height,
                      Text(t14_txt_WalkThrough1_SubTitle, textAlign: TextAlign.center, style: secondaryTextStyle(size: 16)),
                      16.height,
                      t14AppButton(
                        context,
                        btnText: t14_btn_LoginFB,
                        bgColor: t14_SuccessBgColor,
                        width: context.width(),
                        shape: 25.0,
                        txtColor: t14_txt_BlueColor,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
