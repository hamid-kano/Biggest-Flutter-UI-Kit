import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14SignUpScreen extends StatefulWidget {
  @override
  _T14SignUpScreenState createState() => _T14SignUpScreenState();
}

class _T14SignUpScreenState extends State<T14SignUpScreen> {
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
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: t14_colorWhite,
        automaticallyImplyLeading: false,
        title: Text(t14_txt_Registration, style: boldTextStyle(color: t14_colorBlue, size: 16)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            t14_txt_Registration_title,
            textAlign: TextAlign.center,
            style: boldTextStyle(color: t14_colorBlue, size: 20),
          ).paddingOnly(top: 40, left: 40, right: 40),
          Image.asset(t14_oopsIcon, height: 100, width: 200).expand(),
          t14AppButton(
            context,
            btnText: t14_txt_face_id,
            bgColor: t14_SignInBgColor,
            width: context.width(),
            shape: 10.0,
            txtColor: t14_colorSkyBlue,
          ).paddingOnly(left: 24, right: 24, bottom: 16),
          Text('No thanks', textAlign: TextAlign.center, style: boldTextStyle(color: t14_OppsColor, size: 12)).paddingOnly(bottom: 16),
        ],
      ),
    );
  }
}
