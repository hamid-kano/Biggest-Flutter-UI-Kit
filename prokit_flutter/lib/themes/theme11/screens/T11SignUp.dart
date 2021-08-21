import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Colors.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Images.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Strings.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Widget.dart';

class T11SignUp extends StatefulWidget {
  static String tag = '/T11SignUp';

  @override
  _T11SignUpState createState() => _T11SignUpState();
}

class _T11SignUpState extends State<T11SignUp> {
  var btn2 = false;
  var btn3 = false;
  var password = true;
  var retypePwd = true;
  var agree = false;

  var step = 1;

  @override
  Widget build(BuildContext context) {
    final accountDetail = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              t11_lbl_enter_account_details,
              style: boldTextStyle(size: 24, color: blackColor),
            ).paddingAll(16),
            TextFormField(
              style: primaryTextStyle(size: 20, color: textPrimaryColor),
              decoration: InputDecoration(
                hintText: t11_lbl_username,
                  labelStyle: TextStyle(height: 16, fontSize: 20.0, color: t11_PrimaryColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: t11_PrimaryColor),
                  ),
                  border: UnderlineInputBorder()),
              obscureText: false,
            ).paddingOnly(top: 16, left: 16, right: 16, bottom: 8),
             TextFormField(
              style: primaryTextStyle(size: 20, color: textPrimaryColor),
              decoration: InputDecoration(
                hintText: t11_lbl_mobile_no,
                  labelStyle: TextStyle(height: 16, fontSize: 20.0, color: t11_PrimaryColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: t11_PrimaryColor),
                    //  when the TextFormField in focused
                  ),
                  border: UnderlineInputBorder()),
              obscureText: false,
            ).paddingOnly(top: 8, left: 16, right: 16, bottom: 8),
            TextFormField(
              style: primaryTextStyle(size: 20, color: textPrimaryColor),
              decoration: InputDecoration(
                hintText: t11_lbl_password,
                  labelStyle: TextStyle(height: 16, fontSize: 20.0, color: t11_PrimaryColor),
                  suffixIcon: Icon(
                    password ? Icons.visibility_off : Icons.visibility,
                    color: t11_PrimaryColor,
                  ).onTap(() {
                    password = !password;
                    setState(() {});
                  }),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: t11_PrimaryColor),
                    //  when the TextFormField in focused
                  ),
                  border: UnderlineInputBorder()),
              obscureText: password,
            ).paddingOnly(top: 8, left: 16, right: 16, bottom: 8),
            TextFormField(
              style: primaryTextStyle(size: 20, color: textPrimaryColor),
              decoration: InputDecoration(
                hintText: t11_lbl_retype_password,
                  labelStyle: TextStyle(height: 16, fontSize: 20.0, color: t11_PrimaryColor),
                  suffixIcon: Icon(
                    retypePwd ? Icons.visibility_off : Icons.visibility,
                    color: t11_PrimaryColor,
                  ).onTap(() {
                    retypePwd = !retypePwd;
                    setState(() {});
                  }),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: t11_PrimaryColor),
                    //  when the TextFormField in focused
                  ),
                  border: UnderlineInputBorder()),
              obscureText: retypePwd,
            ).paddingAll(16),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        MaterialButton(
          color: t11_PrimaryColor,
          height: 50,
          minWidth: 150,
          child: Text(
            t11_lbl_next,
            style: boldTextStyle(size: 20, color: whiteColor),
          ),
          onPressed: () {
            setState(() {
              btn3 = false;
              btn2 = true;
              step = 2;
            });
          },
        ).cornerRadiusWithClipRRect(25).paddingAll(16)
      ],
    );

    final socialAccount = Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(height: 50),
            Text(t11_lbl_connect_social_account, style: boldTextStyle(size: 24, color: blackColor)).paddingAll(16),
            TextFormField(
              style: primaryTextStyle(size: 20, color: textPrimaryColor),
              decoration: InputDecoration(
                  hintText: t11_lbl_fb,
                  hintStyle: TextStyle(
                    fontSize: 20.0,
                    color: t11_PrimaryColor,
                  ),
                  suffixIcon: Image.asset(
                    t11_ic_Fb,
                    height: 8,
                    width: 8,
                    color: t11_PrimaryColor,
                  ).paddingAll(12),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: t11_PrimaryColor),
                  ),
                  border: UnderlineInputBorder()),
              obscureText: false,
            ).paddingOnly(top: 16, left: 16, right: 16, bottom: 8),
            TextFormField(
              style: primaryTextStyle(size: 20, color: textPrimaryColor),
              decoration: InputDecoration(
                  hintText: t11_lbl_twitter,
                  hintStyle: TextStyle(fontSize: 20.0, color: t11_PrimaryColor),
                  suffixIcon: Image.asset(
                    t11_ic_Twitter,
                    height: 8,
                    width: 8,
                    color: t11_PrimaryColor,
                  ).paddingAll(12),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: t11_PrimaryColor),
                  ),
                  border: UnderlineInputBorder()),
              obscureText: false,
            ).paddingOnly(top: 16, left: 16, right: 16, bottom: 8),
            TextFormField(
              style: primaryTextStyle(size: 20, color: textPrimaryColor),
              decoration: InputDecoration(
                  hintText: t11_lbl_sourceCloud,
                  hintStyle: TextStyle(fontSize: 20.0, color: t11_PrimaryColor),
                  suffixIcon: Image.asset(
                    t11_ic_cloudy,
                    height: 8,
                    width: 8,
                    color: t11_PrimaryColor,
                  ).paddingAll(12),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: t11_PrimaryColor),
                  ),
                  border: UnderlineInputBorder()),
              obscureText: false,
            ).paddingOnly(top: 16, left: 16, right: 16, bottom: 8),
            TextFormField(
              style: primaryTextStyle(size: 20, color: textPrimaryColor),
              decoration: InputDecoration(
                  hintText: t11_lbl_tumbler,
                  hintStyle: TextStyle(fontSize: 20.0, color: t11_PrimaryColor),
                  suffixIcon: Image.asset(
                    t11_ic_Tumbler,
                    height: 8,
                    width: 8,
                    color: t11_PrimaryColor,
                  ).paddingAll(12),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: t11_PrimaryColor),
                  ),
                  border: UnderlineInputBorder()),
              obscureText: false,
            ).paddingOnly(top: 16, left: 16, right: 16, bottom: 8)
          ],
        ),
        SizedBox(height: 50),
        MaterialButton(
          color: t11_PrimaryColor,
          height: 50,
          minWidth: 150,
          child: Text(t11_lbl_next, style: boldTextStyle(size: 20, color: whiteColor)),
          onPressed: () {
            setState(() {
              btn2 = true;
              btn3 = true;
              step = 3;
            });
          },
        ).cornerRadiusWithClipRRect(25).paddingAll(16),
      ],
    );

    final termsService = Column(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              t11_lbl_term_service,
              style: boldTextStyle(size: 24, color: blackColor),
            ).paddingAll(16),
            Text(
              t11_lbl_Long_Text,
              style: primaryTextStyle(size: 18, color: Colors.black45),
            ).paddingAll(16).center(),
            Row(
              children: <Widget>[
                InkWell(
                  child: Icon(
                    agree ? Icons.check_box_outline_blank : Icons.check_box,
                    size: 25,
                    color: t11_PrimaryColor,
                  ).paddingOnly(top: 8, left: 16),
                  onTap: () {
                    setState(() {
                      agree = !agree;
                    });
                  },
                ),
                SizedBox(width: 8),
                InkWell(
                  child: Text(
                    t11_lbl_agree_condition,
                    style: primaryTextStyle(size: 18, color: t11_PrimaryColor),
                  ).paddingTop(8),
                  onTap: () {
                    setState(() {
                      agree = !agree;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
//            MaterialButton(
//              child: Text(t11_lbl_create_account).withStyle(fontSize: 18, color: whiteColor),
//              color: t11_PrimaryColor,
//              minWidth: double.infinity,
//              height: 50,
//              onPressed: () {},
//            ).cornerRadiusWithClipRRect(25).paddingAll(16),
            buttonStyle(t11_lbl_create_account).onTap(() {}).paddingAll(16)
          ],
        )
      ],
    );

    final stepView = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        MaterialButton(
          child: Text(t11_lbl_step1,style: primaryTextStyle(size: 18,color: whiteColor)),
          color: t11_PrimaryColor,
          minWidth: 50,
          height: 50,
          onPressed: () {
            setState(() {
              btn2 = false;
              btn3 = false;
              step = 1;
            });
          },
        ).cornerRadiusWithClipRRect(20).paddingOnly(top: 32, left: 8),
        Container(
          height: 1,
          width: 50,
          color: Colors.black12,
        ).paddingOnly(top: 32, left: 8),
        MaterialButton(
          child: Text(t11_lbl_step2,style: primaryTextStyle(size: 18,color: btn2 ? whiteColor : t11_PrimaryColor)),
          color: btn2 ? t11_PrimaryColor : whiteColor,
          minWidth: 50,
          height: 50,
          onPressed: () {
            setState(() {
              btn3 = false;
              btn2 = true;
              step = 2;
            });
          },
        ).cornerRadiusWithClipRRect(20).paddingOnly(top: 32, left: 8),
        Container(
          height: 1,
          width: 50,
          color: Colors.black12,
        ).paddingOnly(top: 32, left: 8),
        MaterialButton(
          child: Text(t11_lbl_step3,style: primaryTextStyle(size: 18,color: btn3 ? whiteColor : t11_PrimaryColor)),
          color: btn3 ? t11_PrimaryColor : whiteColor,
          minWidth: 50,
          height: 50,
          onPressed: () {
            setState(() {
              btn2 = true;
              btn3 = true;
              step = 3;
            });
          },
        ).cornerRadiusWithClipRRect(20).paddingOnly(top: 32, left: 8),
      ],
    );

    Widget selectedWidget() {
      if (step == 1) {
        return accountDetail;
      } else if (step == 2) {
        return socialAccount;
      } else {
        return termsService;
      }
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              t11_GradientColor1,
              t11_GradientColor2,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children:[
              SizedBox(height: 40),
              stepView,
              selectedWidget(),
            ],
          ).paddingOnly(top: 16),
        ),
      ),
    );
  }
}
