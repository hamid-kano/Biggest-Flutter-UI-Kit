import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Constant.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Images.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Strings.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Widget.dart';

class T1Profile extends StatelessWidget {
  static var tag = "/T1Profile";

  Widget counter(String counter, String counterName) {
    return Column(
      children: <Widget>[
        profile(counter),
        text(counterName, textColor: appStore.textPrimaryColor, fontSize: textSizeMedium, fontFamily: fontMedium),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    final profileImg = Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: FractionalOffset.center,
      child: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(t1_ic_user1),
        radius: 50,
      ),
    );
    final profileContent = Container(
      margin: EdgeInsets.only(top: 55.0),
      decoration: boxDecoration(bgColor: appStore.scaffoldBackground, radius: 10, showShadow: true),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            text(t1_user_name, textColor: appStore.textPrimaryColor, fontSize: textSizeNormal, fontFamily: fontMedium),
            text(t1_user_email, textColor: t1_colorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium),
            Padding(
              padding: EdgeInsets.all(16),
              child: Divider(color: t1_view_color, height: 0.5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                counter("100", t1_lbl_document),
                counter("50", "Photos"),
                counter("60", "Videos"),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: appBar(context, t1_profile_title),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          padding: EdgeInsets.only(top: 90, left: 2, right: 2),
          physics: ScrollPhysics(),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Stack(
                    children: <Widget>[profileContent, profileImg],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  decoration: boxDecoration(bgColor: appStore.scaffoldBackground, radius: 10, showShadow: true),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 8),
                        rowHeading(t1_lbl_personal),
                        SizedBox(height: 16),
                        profileText(t1_user_name),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                          child: view(),
                        ),
                        SizedBox(height: 8),
                        profileText("Male"),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                          child: view(),
                        ),
                        SizedBox(height: 8),
                        profileText(t1_profile_address, maxline: 2),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  decoration: boxDecoration(bgColor: appStore.scaffoldBackground, radius: 10, showShadow: true),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 8),
                        rowHeading(t1_lbl_contacts),
                        SizedBox(height: 16),
                        profileText("+91 36982145"),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                          child: view(),
                        ),
                        SizedBox(height: 8),
                        profileText("Astoncina@gmail.com"),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
