import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Colors.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Constant.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Strings.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Widget.dart';

import '../../../main.dart';

class T6Setting extends StatefulWidget {
  static String tag = '/T6Setting';

  @override
  T6SettingState createState() => T6SettingState();
}

class T6SettingState extends State<T6Setting> {
  // ignore: non_constant_identifier_names
  bool mSwitched_On = false;
  // ignore: non_constant_identifier_names
  bool isSwitched_Sync = false;
  String? _selectedLocation = '10 Sec';

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          TopBar(titleName: t6_lbl_calories),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(t6_lbl_workout_plan, textColor: t6colorPrimary, fontFamily: fontMedium),
                  SizedBox(height: 10),
                  Container(
                    decoration: boxDecoration(radius: 16, showShadow: true, bgColor: appStore.scaffoldBackground),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              settingText(t6_lbl_workout_plan),
                              CustomTheme(
                                child: DropdownButton<String>(
                                  icon: Icon(Icons.arrow_drop_down, color: t6textColorSecondary),
                                  underline: SizedBox(),
                                  value: _selectedLocation,
                                  items: <String>['10 Sec', '20 Sec', '1 min'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: text(value, fontSize: textSizeMedium, textColor: t6textColorSecondary),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedLocation = newValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              settingText(t6_lbl_countdown_time),
                              CustomTheme(
                                child: DropdownButton<String>(
                                  icon: Icon(Icons.arrow_drop_down, color: t6textColorSecondary),
                                  underline: SizedBox(),
                                  value: _selectedLocation,
                                  items: <String>['10 Sec', '20 Sec', '1 min'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: text(value, fontSize: textSizeMedium, textColor: t6textColorSecondary),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedLocation = newValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          settingText(t6_lbl_sound_options),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  text(t6_lbl_share_option, textColor: t6colorPrimary, fontFamily: fontMedium),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: boxDecoration(radius: 16, showShadow: true, bgColor: appStore.scaffoldBackground),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          settingText(t6_lbl_test_voice),
                          settingText(t6_lbl_select_tts_engine),
                          settingText(t6_lbl_download_tts_engine),
                          settingText(t6_lbl_voice_languages),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  text(t6_lbl_general_setting, textColor: t6colorPrimary, fontFamily: fontMedium),
                  SizedBox(height: 10),
                  Container(
                    decoration: boxDecoration(radius: 16, showShadow: true, bgColor: appStore.scaffoldBackground),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              settingText(t6_lbl_keep_the_screen_on),
                              Switch(
                                value: mSwitched_On,
                                onChanged: (value) {
                                  setState(() {
                                    mSwitched_On = value;
                                  });
                                },
                                activeColor: t6colorPrimary,
                                activeTrackColor: t6view_color,
                              )
                            ],
                          ),
                          settingText(t6_lbl_health_data),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              settingText(t6_lbl_sync_to_google_fit),
                              Switch(
                                value: isSwitched_Sync,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched_Sync = value;
                                  });
                                },
                                activeColor: t6colorPrimary,
                                activeTrackColor: t6view_color,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  text(t6_lbl_community, textColor: t6colorPrimary, fontFamily: fontMedium),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: boxDecoration(radius: 16, showShadow: true, bgColor: appStore.scaffoldBackground),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: settingText(t6_lbl_share_with_friends),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
