import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Colors.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Constant.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Images.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Strings.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Widget.dart';

class T11SignIn extends StatefulWidget {
  static String tag = '/T11SignIn';

  @override
  _T11SignInState createState() => _T11SignInState();
}

class _T11SignInState extends State<T11SignIn> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t11_GradientColor2.withOpacity(0.4));
    final topImgView = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          t11_ic_Music,
          height: 100,
          color: t11_PrimaryColor,
          width: 100,
        ).paddingOnly(top: 16, left: 16),
        Row(
          children: <Widget>[
            Container(
              width: 280,
              child: text(welcome_msg, fontSize: textSizeNormal, fontFamily: fontBold, maxLine: 5, textColor: t11_PrimaryColor).paddingOnly(top: 16, left: 16),
            ),
          ],
        )
      ],
    );

    final textFieldView = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: t11_lbl_username,
                labelStyle: primaryTextStyle(size: 20, color: t11_PrimaryColor),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: t11_PrimaryColor),
                ),
              ),
            ).paddingOnly(left: 16, right: 16, top: 8),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: t11_lbl_password,
                labelStyle: primaryTextStyle(size: 20, color: t11_PrimaryColor),
                suffixIcon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: t11_PrimaryColor,
                ).onTap(() {
                  obscureText = !obscureText;
                  setState(() {});
                }),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: t11_PrimaryColor),
                ),
              ),
              autofocus: false,
              obscureText: obscureText,
            ).paddingOnly(left: 16, right: 16, top: 8),
            SizedBox(height: 20),
          ]),
        )
      ],
    );

    final buttonView = Column(
      children: <Widget>[
        buttonStyle(t11_lbl_signIn).paddingAll(16),
        Text(t11_lbl_forgot_password, style: boldTextStyle(size: 18, color: t11_PrimaryColor)).onTap(() {}).paddingAll(16.0),
        MaterialButton(
          child: Text(t11_lbl_create_account,style: primaryTextStyle(size: 18,color: t11_PrimaryColor)),
          color: Colors.grey,
          minWidth: double.infinity,
          height: 50,
          onPressed: () {},
        ).cornerRadiusWithClipRRect(25).paddingAll(16),
      ],
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [t11_GradientColor1, t11_GradientColor2],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              topImgView,
              SizedBox(height: 20),
              textFieldView,
              buttonView,
            ],
          ),
        ),
      ),
    );
  }
}
