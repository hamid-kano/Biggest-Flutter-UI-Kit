import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

class T14SignInScreen2 extends StatefulWidget {
  @override
  _T14SignInScreen2State createState() => _T14SignInScreen2State();
}

class _T14SignInScreen2State extends State<T14SignInScreen2> {
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [t14_SignInBgColor1, t14_SignInBgColor2]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(alignment: Alignment.topRight, child: Image.asset(t14_signIn2, width: 260, fit: BoxFit.cover, height: 340)),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('Welcome', style: boldTextStyle(size: 24)).paddingOnly(top: 22),
                  Text(
                    t14_txt_Login2_subtitle,
                    style: primaryTextStyle(size: 18),
                    textAlign: TextAlign.center,
                  ).paddingOnly(left: 16, right: 16, top: 8, bottom: 16),
                  Container(
                    padding: EdgeInsets.only(left: 24, right: 16, top: 16, bottom: 16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)), color: t14_colorWhite),
                    child: Row(
                      children: [
                        Image.asset(t14_googleIcon, color: t14_SuccessTxtColor, width: 20, height: 20),
                        16.width,
                        Text(t14_txt_SignInGoogle, style: primaryTextStyle(size: 16)),
                      ],
                    ),
                  ).paddingAll(16),
                  Text.rich(
                    TextSpan(
                      text: t14_lbl_AlreadyAct,
                      style: secondaryTextStyle(color: t14_SignIn2Color),
                      children: <TextSpan>[
                        TextSpan(text: t14_lbl_SignIn, style: boldTextStyle(color: t14_OppsColor1, size: 16)),
                      ],
                    ),
                  ).center(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
