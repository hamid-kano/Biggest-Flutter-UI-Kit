import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

class QIBusSetting extends StatefulWidget {
  static String tag = '/QIBusSetting';

  @override
  QIBusSettingState createState() => QIBusSettingState();
}

class QIBusSettingState extends State<QIBusSetting> {
  bool mEmailNotification = false;
  bool mContactNotification = false;
  String _selectedLocation = 'English';
  String _selectedLocation1 = 'India';
  List<String> language = <String>['English', 'Arabic', 'French'];
  List<String> country = <String>['India', 'United State', 'Canada'];

  Widget mSetting(var heading, var subLabel, var value) {
    return Container(
      decoration: boxDecoration(showShadow: true),
      padding: EdgeInsets.fromLTRB(spacing_standard, spacing_standard, spacing_standard, spacing_standard_new),
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: const EdgeInsets.fromLTRB(spacing_standard, 0, spacing_standard, 0), child: text(heading, fontFamily: fontMedium)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, spacing_standard, 16, spacing_standard),
                child: text(subLabel, textColor: qIBus_textChild),
              ),
              Switch(
                value: value,
                onChanged: (value) {
                  setState(() {
                    value = value;
                  });
                },
                activeTrackColor: qIBus_colorPrimary,
                activeColor: qIBus_view_color,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget mSeeting1(var heading, var subLabel, List<String> a, String? value) {
    return Container(
      decoration: boxDecoration(showShadow: true),
      padding: EdgeInsets.all(spacing_standard_new),
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: const EdgeInsets.fromLTRB(spacing_standard, 0, spacing_standard, 0), child: text(heading, fontFamily: fontMedium)),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, spacing_standard, 16, spacing_standard),
                child: text(subLabel, textColor: qIBus_textChild),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  items: a.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: text(value, fontSize: textSizeMedium, textColor: qIBus_textChild),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      value = newValue;
                    });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: qIBus_app_background,
        body: Column(
          children: <Widget>[
            TopBar(
              QIBus_text_settings,
              icon: qibus_gif_bell,
              isVisible: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      mSetting(QIBus_title_email_notification_settings, QIBus_txt_email_notification, mEmailNotification),
                      mSetting(QIBus_lbl_contact_number_settings, QIBus_lbl_number_notification, mContactNotification),
                      mSeeting1(QIBus_title_language_setting, QIBus_lbl_language, language, _selectedLocation),
                      mSeeting1(QIBus_text_country, QIBus_title_country_settings, country, _selectedLocation1),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
