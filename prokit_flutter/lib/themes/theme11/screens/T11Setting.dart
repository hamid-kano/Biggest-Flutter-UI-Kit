import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Colors.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Constant.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Strings.dart';

class T11Setting extends StatefulWidget {
  static String tag = '/T11Setting';

  @override
  _T11SettingState createState() => _T11SettingState();
}

class _T11SettingState extends State<T11Setting> {
  bool isAutoPlay = true;
  bool isVolume = true;
  bool isDataServer = true;
  String? selectedValue = 'High';
  String? downloadSpeed = 'High';

  Widget build(BuildContext context) {
    final listView = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(t11_lbl_Playback, textColor: t11_blackColor, fontSize: textSizeNormal, fontFamily: fontRegular).paddingOnly(top: 16, left: 8, right: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            text(t11_lbl_AutoPlay, textColor: t11_blackColor, fontSize: textSizeLargeMedium, fontFamily: fontRegular).paddingOnly(top: 4, left: 8, right: 8, bottom: 8),
            Switch(
              value: isAutoPlay,
              onChanged: (value) {
                setState(() {
                  isAutoPlay = value;
                  print(isAutoPlay);
                });
              },
              activeTrackColor: t11_PrimaryColor.withOpacity(0.4),
              activeColor: t11_PrimaryColor,
            ),
          ],
        ).paddingOnly(top: 16),
        Divider(thickness: 0.8).paddingOnly(left: 8, right: 8),
        text(t11_lbl_Normalized_Volume, textColor: t11_blackColor, fontSize: textSizeNormal, fontFamily: fontRegular).paddingOnly(top: 16, left: 8, right: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            text(t11_lbl_SetVolume_allTrack, textColor: t11_PrimaryColor, fontSize: textSizeMedium, fontFamily: fontRegular).paddingOnly(top: 4, left: 8, right: 8, bottom: 8),
            Switch(
              value: isVolume,
              onChanged: (value) {
                setState(() {
                  isVolume = value;
                });
              },
              activeTrackColor: t11_PrimaryColor.withOpacity(0.4),
              activeColor: t11_PrimaryColor,
            ),
          ],
        ),
        Divider(thickness: 0.8).paddingOnly(left: 8, right: 8),
        text(t11_lbl_Data_Server, textColor: t11_blackColor, fontSize: textSizeNormal, fontFamily: fontRegular).paddingOnly(top: 16, left: 8, right: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: text(t11_lbl_when_offline, textColor: t11_PrimaryColor, fontSize: textSizeMedium, fontFamily: fontRegular).paddingOnly(top: 4, left: 8, right: 8, bottom: 8)),
            Switch(
              value: isDataServer,
              onChanged: (value) {
                setState(() {
                  isDataServer = value;
                });
              },
              activeTrackColor: t11_PrimaryColor.withOpacity(0.4),
              activeColor: t11_PrimaryColor,
            ),
          ],
        ),
        Divider(thickness: 0.8).paddingOnly(left: 8, right: 8),
        text(t11_lbl_Volume_Level, textColor: t11_blackColor, fontSize: textSizeNormal, fontFamily: fontRegular).paddingOnly(top: 16, left: 8, right: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: text(t11_lbl_adjust_volume, textColor: t11_PrimaryColor, fontSize: textSizeMedium, fontFamily: fontRegular).paddingOnly(top: 4, left: 8, right: 8, bottom: 8),
            ),
            DropdownButton<String>(
              items: <String>[t11_lbl_high, t11_lbl_Normal, t11_lbl_low].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: text(value, textColor: t11_blackColor, fontSize: textSizeSmall, fontFamily: fontRegular),
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
        Divider(thickness: 0.8).paddingOnly(left: 8, right: 8),
        text(t11_lbl_Others, textColor: t11_blackColor, fontSize: textSizeNormal, fontFamily: fontRegular).paddingOnly(top: 32, left: 8, right: 8, bottom: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            text(t11_lbl_Download_Speed, textColor: t11_PrimaryColor, fontSize: textSizeNormal, fontFamily: fontRegular).paddingOnly(top: 4, left: 8, right: 8, bottom: 8),
            DropdownButton<String>(
              items: <String>[t11_lbl_high, t11_lbl_Normal, t11_lbl_low].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: text(value, textColor: t11_blackColor, fontSize: textSizeSmall, fontFamily: fontRegular),
                );
              }).toList(),
              //hint:Text(selectedValue),
              value: downloadSpeed,
              onChanged: (newVal) {
                setState(() {
                  downloadSpeed = newVal;
                });
              },
            ),
          ],
        ),
        Divider(thickness: 0.8).paddingOnly(left: 8, right: 8, bottom: 16),
        text(t11_lbl_Privacy_Setting, textColor: t11_PrimaryColor, fontSize: textSizeNormal, fontFamily: fontRegular).paddingOnly(top: 4, left: 8, right: 8, bottom: 8),
        Divider(thickness: 0.8).paddingOnly(left: 8, right: 8),
        text(t11_lbl_logout, textColor: t11_PrimaryColor, fontSize: textSizeNormal, fontFamily: fontRegular).paddingOnly(top: 16, left: 8, right: 8, bottom: 16),
      ],
    );

    return Scaffold(
      backgroundColor: t11_GradientColor2.withOpacity(1.0),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, MediaQuery.of(context).size.width * 0.22),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.navigate_before, size: 40, color: t11_PrimaryColor).onTap(() {
                    finish(context);
                  }),
                  text(t11_lbl_Settings, textColor: t11_blackColor, fontSize: textSizeNormal, fontFamily: fontBold).paddingAll(24),
                  Icon(Icons.navigate_before, color: Colors.transparent),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            listView,
          ],
        ),
      ),
    );
  }
}
