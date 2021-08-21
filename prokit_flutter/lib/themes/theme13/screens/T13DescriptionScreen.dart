import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Constant.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Images.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Widget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class T13DescriptionScreen extends StatefulWidget {
  static String tag = '/T13DescriptionScreen';

  @override
  T13DescriptionScreenState createState() => T13DescriptionScreenState();
}

class T13DescriptionScreenState extends State<T13DescriptionScreen> {
  var p = PageController();

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: p,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                commonCacheImageWidget(t13_ic_description, height, width: width, fit: BoxFit.cover),
                Container(
                  alignment: Alignment.bottomLeft,
                  height: height * 0.45,
                  margin: EdgeInsets.all(spacing_standard_new),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: boxDecoration(bgColor: appStore.appBarColor!.withOpacity(0.7), radius: 10.0),
                        padding: EdgeInsets.all(spacing_standard_new),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            text(t13_lbl_green_house_nw_pool, maxLine: 2, fontSize: textSizeNormal),
                            text(t13_2_440, fontSize: textSizeNormal),
                            Row(
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: spacing_control),
                                          child: SvgPicture.asset(t13_ic_map, color: t13_textColorSecondary, width: 18, height: 18),
                                        ),
                                      ),
                                      TextSpan(text: "Location", style: TextStyle(fontSize: textSizeMedium, color: t13_textColorSecondary)),
                                    ],
                                  ),
                                ),
                                SizedBox(width: spacing_standard_new),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: spacing_control),
                                          child: SvgPicture.asset(t13_ic_home, color: t13_textColorSecondary, width: 18, height: 18),
                                        ),
                                      ),
                                      TextSpan(text: "20 sqm", style: TextStyle(fontSize: textSizeMedium, color: t13_textColorSecondary)),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: spacing_middle),
                      T13Button(
                        textContent: t13_lbl_call,
                        onPressed: () {
                          finish(context);
                        },
                      ),
                      SizedBox(height: spacing_middle),
                      InkWell(
                        onTap: () {
                          p.animateToPage(2, duration: Duration(seconds: 1), curve: Curves.linear);
                        },
                        child: Container(
                          decoration: boxDecoration(bgColor: appStore.appBarColor),
                          padding: EdgeInsets.all(10),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: t13_lbl_details, style: TextStyle(fontSize: textSizeMedium, color: appStore.textPrimaryColor)),
                                WidgetSpan(child: 8.width),
                                WidgetSpan(child: Icon(Icons.keyboard_arrow_down, size: 18, color: appStore.backgroundColor)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(8),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
                    onPressed: () {
                      finish(context);
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50),
                  Container(
                    decoration: boxDecoration(showShadow: true),
                    padding: EdgeInsets.all(spacing_standard),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(backgroundImage: AssetImage(t13_ic_profile), radius: 20),
                            SizedBox(width: spacing_standard),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text(t13_username, textColor: appStore.textPrimaryColor, fontFamily: fontBold),
                                text(t13_lbl_owner, textColor: appStore.textSecondaryColor),
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: width * 0.3,
                          child: T13Button(textContent: t13_lbl_call, onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: spacing_large),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: spacing_control),
                                child: SvgPicture.asset(t13_ic_home, color: t13_textColorSecondary, width: 18, height: 18),
                              ),
                            ),
                            TextSpan(text: t13_lbl__3_beds, style: TextStyle(fontSize: textSizeMedium, color: t13_textColorSecondary)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: spacing_control),
                                child: SvgPicture.asset(t13_ic_bath, color: t13_textColorSecondary, width: 18, height: 18),
                              ),
                            ),
                            TextSpan(text: t13_lbl_1_baths, style: TextStyle(fontSize: textSizeMedium, color: t13_textColorSecondary)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: spacing_control),
                                child: SvgPicture.asset(t13_ic_bed, color: t13_textColorSecondary, width: 18, height: 18),
                              ),
                            ),
                            TextSpan(text: t13_20_sqm, style: TextStyle(fontSize: textSizeMedium, color: t13_textColorSecondary)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
                    color: t13_view_color,
                    height: 0.5,
                  ),
                  text(t13_lbl_address.toUpperCase(), textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                  text(t13_lbl_simple_text, textColor: appStore.textSecondaryColor, isLongText: true),
                  SizedBox(height: spacing_middle),
                  text(t13_lbl_description.toUpperCase(), textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                  text(t13_lbl_simple_text, textColor: appStore.textSecondaryColor, isLongText: true),
                  SizedBox(height: spacing_middle),
                  text(t13_lbl_types_of_properties.toUpperCase(), textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                  text(t13_lbl_house, textColor: appStore.textSecondaryColor),
                  SizedBox(height: spacing_middle),
                  text(t13_lbl_storeys.toUpperCase(), textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                  text(t13_lbl_2, textColor: appStore.textSecondaryColor),
                  SizedBox(height: spacing_middle),
                  text(t13_lbl_photos.toUpperCase(), textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                  text(t13_lbl_2, textColor: appStore.textSecondaryColor),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
