import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14SignInScreen extends StatefulWidget {
  @override
  _T14SignInScreenState createState() => _T14SignInScreenState();
}

class _T14SignInScreenState extends State<T14SignInScreen> {
  var emailCon = TextEditingController();
  var passwordCon = TextEditingController();

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
      backgroundColor: t14_SignInBgColor,
      appBar: AppBar(
        backgroundColor: t14_SignInBgColor,
        leading: Icon(Icons.arrow_back_ios_outlined, size: 20).onTap(() {
          finish(context);
        }),
        elevation: 0.0,
        actions: [IconButton(icon: Icon(Icons.more_horiz, size: 20), onPressed: () {})],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t14_txt_WelcomeBack, style: boldTextStyle(size: 20)),
              16.height,
              Text(t14_txt_SignIn_SubTitle, style: primaryTextStyle(size: 16)),
            ],
          ).paddingAll(16),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              height: context.height(),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(22)), color: t14_colorWhite),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      AppTextField(
                        controller: emailCon,
                        textFieldType: TextFieldType.EMAIL,
                        textStyle: TextStyle(color: Colors.black54),
                        decoration: InputDecoration(
                          labelText: t14_lbl_email,
                          labelStyle: TextStyle(color: t14_colorBlack),
                          hintStyle: TextStyle(fontSize: 12),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      AppTextField(
                        controller: passwordCon,
                        textFieldType: TextFieldType.PASSWORD,
                        decoration: InputDecoration(
                          labelText: t14_lbl_password,
                          labelStyle: TextStyle(color: t14_colorBlack),
                          hintStyle: TextStyle(fontSize: 12),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      16.height,
                      Text(t14_lbl_ForgotPassword, style: primaryTextStyle(size: 14)),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: 80, height: 1, color: t14_AppDividerColor, margin: EdgeInsets.only(right: 10)),
                          Text('or', style: TextStyle(color: t14_AppDividerColor)),
                          Container(width: 80, height: 1, color: t14_AppDividerColor, margin: EdgeInsets.only(left: 10)),
                        ],
                      ),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 130,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(border: Border.all(color: t14_AppDividerColor)),
                            child: Image.asset(t14_google, height: 20, width: 20),
                          ),
                          Container(
                            width: 130,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(border: Border.all(color: t14_AppDividerColor)),
                            child: Image.asset(t14_appleLogo, height: 20, width: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  24.height,
                  Column(
                    children: [
                      t14AppButton(
                        context,
                        btnText: t14_lbl_SignIn,
                        bgColor: t14_SignInBgColor,
                        width: context.width(),
                        shape: 10.0,
                        txtColor: t14_colorSkyBlue,
                      ).paddingSymmetric(horizontal: 16),
                      16.height,
                      Text.rich(
                        TextSpan(
                          text: t14_lbl_DonAct,
                          style: secondaryTextStyle(),
                          children: <TextSpan>[TextSpan(text: t14_lbl_SignUp, style: boldTextStyle(color: t14_colorSkyBlue))],
                        ),
                      ).center(),
                      16.height,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
