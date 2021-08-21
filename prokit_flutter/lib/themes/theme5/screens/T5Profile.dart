import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5BubbleBotoomBar.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Colors.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Constant.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Images.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Strings.dart';

class T5Profile extends StatefulWidget {
  static var tag = "/T5Profile";

  @override
  T5ProfileState createState() => T5ProfileState();
}

class T5ProfileState extends State<T5Profile> {
  double? width;

  @override
  void initState() {
    super.initState();
  }

  var currentIndex = 0;
  var iconList = <String>[t5_analysis, t5_wallet_2, t5_customer_service, t5_img_settings];
  var nameList = <String>[t5_statistics, t5_manage_wallet, t5_support, t5_settings];

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget gridItem(int pos) {
    return Container(
        width: (width! - (16 * 3)) / 2,
        height: (width! - (16 * 3)) / 2,
        decoration: boxDecoration(radius: 24, showShadow: true, bgColor: t5White),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              iconList[pos],
              width: width! / 7,
              height: width! / 7,
              color: black,
            ),
            text(nameList[pos], fontSize: textSizeNormal, textColor: t5TextColorPrimary, fontFamily: fontSemibold)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t5DarkNavy);
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: t5LayoutBackgroundWhite,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              height: width,
              color: t5DarkNavy,
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_left, size: 40, color: t5White),
                      onPressed: () {
                        finish(context);
                      },
                    ),
                    text("Account", textColor: t5White, fontSize: textSizeNormal, fontFamily: fontMedium),
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: SvgPicture.asset(t5_options, width: 25, height: 25, color: t5White),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 80),
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.only(top: 60),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(color: t5LayoutBackgroundWhite, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        text("Emily Jonas", textColor: t5TextColorPrimary, fontFamily: fontMedium, fontSize: textSizeNormal),
                        text(t5_txt_phone_number, fontSize: textSizeLargeMedium),
                        Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.5, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(t5SkyBlue),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Wallet Security", fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("50%", textColor: t5SkyBlue, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[gridItem(0), gridItem(1)],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[gridItem(2), gridItem(3)],
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                  CircleAvatar(backgroundImage: CachedNetworkImageProvider(t5_profile_8), radius: 50)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        elevation: 8,
        onTap: changePage,
        //new
        hasNotch: false,
        //new
        hasInk: true,
        //new, gives a cute ink effect
        inkColor: t5ColorPrimaryLight,
        //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          tab(t5_img_home, t5_home),
          tab(t5_list_check, t5_lbl_listing),
          tab(t5_notification_2, t5_notification),
          tab(t5_user, t5_lbl_profile),
        ],
      ),
    );
  }
}
