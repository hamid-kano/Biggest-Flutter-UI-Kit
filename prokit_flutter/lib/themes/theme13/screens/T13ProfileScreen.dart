import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme13/model/T13Model.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Constant.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13DataGenerator.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Images.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Widget.dart';

import '../../../main.dart';

class T13ProfileScreen extends StatefulWidget {
  static String tag = '/T13ProfileScreen';

  @override
  T13ProfileScreenState createState() => T13ProfileScreenState();
}

class T13ProfileScreenState extends State<T13ProfileScreen> {
  late List<Home> mList;

  @override
  void initState() {
    super.initState();
    mList = generatePopular();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    var width = MediaQuery.of(context).size.width;

    var mProfileHeader = Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: commonCacheImageWidget(t13_ic_profile1, width * 0.28, fit: BoxFit.cover, width: width * 0.28),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(t13_username, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: 18.0),
                      text(t13_user_email, textColor: t13_textColorSecondary),
                    ],
                  ),
                ],
              ),
              FittedBox(
                child: Container(
                  margin: EdgeInsets.only(bottom: 16, top: 4),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 2, 16, 2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[t13_colorPrimary, t13_color_gradient1]),
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    ),
                    child: text(t13_lbl_for_sale, textColor: t13_white, fontSize: 12.0),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );

    var mUserInformation = Container(
      margin: EdgeInsets.only(top: 16, right: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              text(t13_lbl_followers.toUpperCase(), textColor: t13_textColorSecondary),
              text(t13_150, textColor: t13_colorPrimary),
            ],
          ),
          Column(
            children: <Widget>[
              text(t13_lbl_properties.toUpperCase(), textColor: t13_textColorSecondary),
              text(t13_20, textColor: t13_colorPrimary),
            ],
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appBar(context, t13_lbl_profile),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                mProfileHeader,
                SizedBox(height: 24),
                Divider(height: 0.5, color: t13_view_color),
                mUserInformation,
                Divider(height: 0.5, color: t13_view_color),
                SizedBox(height: 16),
                Container(
                  child: text(t13_lbl_properties.toUpperCase(), textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                  margin: EdgeInsets.only(left: 16, bottom: 16),
                ),
                ListView.builder(
                  itemCount: mList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Properties(mList[index], index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Properties extends StatelessWidget {
  late Home model;

  Properties(Home model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.7,
      decoration: boxDecoration(showShadow: true, bgColor: appStore.appBarColor, radius: 10.0),
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_middle), topRight: Radius.circular(spacing_middle)),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                commonCacheImageWidget(model.image, 180, fit: BoxFit.cover, width: width),
                mSale(context),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(model.name, textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                    text(model.price, textColor: appStore.textSecondaryColor),
                  ],
                ),
                SizedBox(height: 4),
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
                          TextSpan(text: model.place, style: TextStyle(fontSize: textSizeMedium, color: t13_textColorSecondary)),
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
                          TextSpan(text: model.sqm, style: TextStyle(fontSize: textSizeMedium, color: t13_textColorSecondary)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
