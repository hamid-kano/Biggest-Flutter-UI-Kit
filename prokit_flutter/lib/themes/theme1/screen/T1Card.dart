import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1Listing.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Constant.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1DataGenerator.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Images.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Strings.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Widget.dart';

class T1Card extends StatelessWidget {
  static var tag = "/T1Cards";

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
    return Scaffold(
      appBar: appBar(context, t1_card_title),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          padding: EdgeInsets.only(top: 90),
          physics: ScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Stack(
                  children: <Widget>[
                    Container(
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
                              child: view(),
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
                    ),
                    Container(
                        margin: new EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: FractionalOffset.center,
                        child: new CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(t1_ic_user1),
                          radius: 50,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 16),
              T1ListItem(getListings()[0], 1)
            ],
          ),
        ),
      ),
    );
  }
}
