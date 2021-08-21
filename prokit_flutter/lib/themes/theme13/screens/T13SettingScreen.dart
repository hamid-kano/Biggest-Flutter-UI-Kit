import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Widget.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Constant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';

import '../../../main.dart';

class T13SettingScreen extends StatefulWidget {
  static String tag = '/T13SettingScreen';

  @override
  T13SettingScreenState createState() => T13SettingScreenState();
}

class T13SettingScreenState extends State<T13SettingScreen> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    Widget mLabel(String value) {
      return Padding(
        padding: EdgeInsets.all(spacing_standard_new),
        child: text(value.toUpperCase(), textColor: appStore.textPrimaryColor),
      );
    }

    var mView = Container(
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
      child: Divider(height: 0.5, color: appStore.textPrimaryColor),
    );

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      appBar: appBar(context, t13_lbl_setting),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      mLabel(t13_lbl_country),
                      Padding(
                        padding: EdgeInsets.all(spacing_standard_new),
                        child: CountryCodePicker(
                          onChanged: print,
                          showFlag: true,
                          searchStyle: primaryTextStyle(color: appStore.textPrimaryColor),
                          textStyle: TextStyle(color: appStore.textPrimaryColor),
                        ),
                      )
                    ],
                  ),
                  mView,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      mLabel(t13_lbl_currency),
                      Padding(
                        padding: EdgeInsets.all(spacing_standard_new),
                        child: text(t13_lbl_cad, textColor: t13_textColorSecondary),
                      ),
                    ],
                  ),
                  mView,
                  mLabel(t13_lbl_change_password),
                  Container(height: 4, color: appStore.iconSecondaryColor, width: MediaQuery.of(context).size.width),
                  mLabel(t13_lbl_privacy_policy),
                  mView,
                  mLabel(t13_lbl_support_amp_faqs),
                  Container(height: 4, color: appStore.iconSecondaryColor, width: MediaQuery.of(context).size.width),
                  SizedBox(height: spacing_large),
                  Container(
                    child: T13Button(
                        textContent: t13_lbl_logout,
                        onPressed: () {
                          finish(context);
                        }),
                    margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
