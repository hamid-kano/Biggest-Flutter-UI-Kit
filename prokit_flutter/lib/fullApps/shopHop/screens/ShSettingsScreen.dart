import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class ShSettingsScreen extends StatefulWidget {
  static String tag = '/ShSettingsScreen';

  @override
  ShSettingsScreenState createState() => ShSettingsScreenState();
}

class ShSettingsScreenState extends State<ShSettingsScreen> {
  bool pushNotification = false;
  bool smsNotification = false;
  bool emailNotification = false;
  String? selectedValue = "English(US)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        title: text(sh_lbl_settings, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
        actionsIconTheme: IconThemeData(color: sh_colorPrimary),
        actions: <Widget>[cartIcon(context, 3)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(sh_lbl_push_notification, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                      Switch(
                        value: pushNotification,
                        onChanged: (value) {
                          setState(() {
                            pushNotification = value;
                          });
                        },
                        activeColor: sh_colorPrimary,
                      )
                    ],
                  ),
                  text(sh_lbl_notification_arrive_on_order_status, fontSize: textSizeSMedium),
                  SizedBox(height: spacing_standard_new),
                  divider()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(sh_lbl_sms_notification, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                      Switch(
                        value: smsNotification,
                        onChanged: (value) {
                          setState(() {
                            smsNotification = value;
                          });
                        },
                        activeColor: sh_colorPrimary,
                      )
                    ],
                  ),
                  text(sh_contact_phone, fontSize: textSizeSMedium),
                  SizedBox(height: spacing_standard_new),
                  divider()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(sh_lbl_email_notification, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                      Switch(
                        value: emailNotification,
                        onChanged: (value) {
                          setState(() {
                            emailNotification = value;
                          });
                        },
                        activeColor: sh_colorPrimary,
                      )
                    ],
                  ),
                  text(sh_reference_email, fontSize: textSizeSMedium),
                  SizedBox(height: spacing_standard_new),
                  divider()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(sh_lbl_language, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                      DropdownButton<String>(
                        underline: SizedBox(),
                        items: <String>["English(US)", "English(Canada)"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: text(value, textColor: sh_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontRegular),
                          );
                        }).toList(),
                        //hint:Text(selectedValue),
                        value: selectedValue,
                        onChanged: (newVal) {
                          setState(() {
                            selectedValue = newVal;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: spacing_standard_new),
                  divider()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
