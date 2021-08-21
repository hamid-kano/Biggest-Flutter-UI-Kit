import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14SignUpScreen2 extends StatefulWidget {
  @override
  _T14SignUpScreen2State createState() => _T14SignUpScreen2State();
}

class _T14SignUpScreen2State extends State<T14SignUpScreen2> {
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
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp, size: 20, color: black),
            onPressed: () {
              finish(context);
            }),
        backgroundColor: t14_colorWhite,
        title: Text(t14_txt_Registration, style: boldTextStyle(color: t14_colorBlue, size: 16)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t14_txt_Enter_Mob_Num, textAlign: TextAlign.center, style: boldTextStyle(color: t14_colorBlue, size: 20)).paddingOnly(top: 24),
          Text(t14_txt_Regi2_subtitle, textAlign: TextAlign.center, style: secondaryTextStyle()).paddingOnly(top: 16),
          TextFormField(
            keyboardType: TextInputType.phone,
            maxLength: 10,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              hintText: 'Enter mobile number',
              counterText: '',
              helperStyle: TextStyle(fontSize: 12),
              hintStyle: TextStyle(color: t14_colorBlue.withOpacity(0.2)),
              filled: true,
              fillColor: t14_colorWhite,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: t14_colorBlue.withOpacity(0.3), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: t14_colorBlue.withOpacity(0.3), width: 1),
              ),
            ),
          ).center().expand(),
          t14AppButton(
            context,
            btnText: t14_txt_Next,
            bgColor: t14_SignInBgColor,
            width: context.width(),
            shape: 10.0,
            txtColor: t14_colorSkyBlue,
          ).paddingOnly(left: 16, right: 16, bottom: 16),
        ],
      ).paddingAll(16),
    );
  }
}
