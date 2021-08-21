import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Colors.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Constant.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Images.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Strings.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Widget.dart';
import 'package:prokit_flutter/themes/theme5/utils/widgets/T5Expandable.dart';

import '../../../main.dart';

class T5Settings extends StatefulWidget {
  static var tag = "/T5Settings";

  @override
  T5SettingsState createState() => T5SettingsState();
}

class T5SettingsState extends State<T5Settings> {
  int selectedPos = 1;
  bool notification = false;
  bool discounts = false;
  bool gift = false;
  bool fastPayment = false;
  ExpandableController _controller = new ExpandableController();
  String? _selectedLocation = 'English';

  late double width;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
  }

  Widget settingItem(String name, {String icon = "", var pad = 16.0}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(pad),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 18),
              width: width / 7.5,
              height: width / 7.5,
              padding: EdgeInsets.all(width / 30),
              decoration: icon.isNotEmpty ? boxDecoration(radius: 4, bgColor: appStore.scaffoldBackground, showShadow: true) : null,
              child: icon.isNotEmpty ? SvgPicture.asset(icon) : SizedBox(),
            ),
            text(name, textColor: appStore.textPrimaryColor, fontFamily: fontMedium, fontSize: textSizeLargeMedium)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10),
              child: text(t5_settings, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeXLarge),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 24),
                      T5ExpandablePanel(
                        // ignore: deprecated_member_use_from_same_package
                        hasIcon: false,
                        header: Row(
                          children: <Widget>[
                            settingItem(t5_notification, icon: t5_img_notification),
                            Switch(
                              value: notification,
                              onChanged: (value) {
                                setState(() {
                                  notification = value;
                                  _controller.expanded = notification;
                                  print(notification);
                                });
                              },
                              activeTrackColor: t5ColorPrimary,
                              activeColor: t5White,
                            )
                          ],
                        ),
                        controller: _controller,
                        expanded: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                settingItem(t5_discounts, pad: 10.0),
                                Switch(
                                  value: discounts,
                                  onChanged: (value) {
                                    setState(() {
                                      discounts = value;
                                    });
                                  },
                                  activeTrackColor: t5ColorPrimary,
                                  activeColor: t5White,
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                settingItem(t5_gift, pad: 10.0),
                                Switch(
                                  value: gift,
                                  onChanged: (value) {
                                    setState(() {
                                      gift = value;
                                    });
                                  },
                                  activeTrackColor: t5ColorPrimary,
                                  activeColor: t5White,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      divider(),
                      Row(
                        children: <Widget>[
                          settingItem(t5_fast_payment, icon: t5_payments),
                          Switch(
                            value: fastPayment,
                            onChanged: (value) {
                              setState(() {
                                fastPayment = value;
                              });
                            },
                            activeTrackColor: t5ColorPrimary,
                            activeColor: t5White,
                          )
                        ],
                      ),
                      divider(),
                      Row(
                        children: <Widget>[
                          settingItem(t5_fingerprint, icon: t5_img_fingerprint_2),
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: t5TextColorSecondary,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      divider(),
                      Row(
                        children: <Widget>[
                          settingItem(t5_language, icon: t5_translate),
                          CustomTheme(
                            child: DropdownButton<String>(
                              icon: Icon(Icons.keyboard_arrow_right, color: t5TextColorSecondary),
                              underline: SizedBox(),
                              value: _selectedLocation,
                              items: <String>['English', 'French', 'German'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: text(value, fontSize: textSizeLargeMedium, textColor: appStore.textPrimaryColor),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 16)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
