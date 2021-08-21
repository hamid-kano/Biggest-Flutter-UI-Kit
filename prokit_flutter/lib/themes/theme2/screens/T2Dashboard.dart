import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme2/models/models.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2BubbleBotoomBar.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2DataGenerator.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Images.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Slider.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Strings.dart';

import '../../../main.dart';

class T2Dashboard extends StatefulWidget {
  static var tag = "/T2Dashboard";

  @override
  T2DashboardState createState() => T2DashboardState();
}

class T2DashboardState extends State<T2Dashboard> {
  bool passwordVisible = false;
  bool isRemember = false;
  var currentIndexPage = 0;
  late List<T2Favourite> mFavouriteList;
  List<T2Slider>? mSliderList;
  var currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
    mFavouriteList = getFavourites();
    mSliderList = getSliders();
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    var width = MediaQuery.of(context).size.width;
    return Observer(
      builder: (_) => Scaffold(
        key: _scaffoldKey,
        appBar: appBar(context, t2_lbl_dashboard),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 40),
              physics: ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  T2SliderWidget(),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(t2_lbl_see_your_favourite, style: boldTextStyle(color: appStore.textPrimaryColor, size: 20)),
                        GestureDetector(
                          child: Text(t2_lbl_view_all, style: boldTextStyle(size: 16, color: appStore.textPrimaryColor)),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  10.height,
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, position) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: <Widget>[
                              CachedNetworkImage(
                                placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                imageUrl: mFavouriteList[position].image,
                                width: width / 3,
                                height: width / 2.4,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  width: width - (width / 3) - 16,
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(mFavouriteList[position].name, style: boldTextStyle(color: appStore.textPrimaryColor, size: 16), maxLines: 2),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Icon(Icons.timelapse, size: 16, color: appStore.textSecondaryColor),
                                              SizedBox(width: 2),
                                              Text(mFavouriteList[position].duration, style: secondaryTextStyle()),
                                            ],
                                          ),
                                          GestureDetector(
                                            child: Row(
                                              children: <Widget>[
                                                Text(t2_read, style: secondaryTextStyle()),
                                                Icon(Icons.keyboard_arrow_right, size: 16, color: appStore.textSecondaryColor),
                                              ],
                                            ),
                                            onTap: () {},
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: mFavouriteList.length,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BubbleBottomBar(
          backgroundColor: appStore.appBarColor,
          opacity: .2,
          currentIndex: currentIndex,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          onTap: changePage,
          hasNotch: false,
          hasInk: true,
          inkColor: t2_colorPrimary.withOpacity(0.5),
          items: <BubbleBottomBarItem>[
            tab(Icons.home, t2_lbl_home),
            tab(Icons.favorite_border, t2_lbl_favourite),
            tab(Icons.notifications_none, t2_lbl_notification),
            tab(Icons.person_outline, t2_lbl_profile),
          ],
        ),
      ),
    );
  }
}

class T2Drawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return T2DrawerState();
  }
}

class T2DrawerState extends State<T2Drawer> {
  var selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height,
      child: Observer(
        builder: (_) => Drawer(
          elevation: 8,
          child: Container(
            color: appStore.scaffoldBackground,
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: appStore.scaffoldBackground,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 70, right: 20),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                        decoration: BoxDecoration(color: t2_colorPrimary, borderRadius: BorderRadius.only(bottomRight: Radius.circular(24.0), topRight: Radius.circular(24.0))),
                        /*User Profile*/
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(backgroundImage: NetworkImage(t2_profile), radius: 40),
                            SizedBox(width: 16),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(t2_user_name, style: boldTextStyle(color: white, size: 20)),
                                    SizedBox(height: 8),
                                    Text(t2_user_email, style: primaryTextStyle(color: white)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    getDrawerItem(t2_user, t2_lbl_profile, 1),
                    getDrawerItem(t2_chat, t2_lbl_message, 2),
                    getDrawerItem(t2_report, t2_lbl_report, 3),
                    getDrawerItem(t2_settings, t2_lbl_settings, 4),
                    getDrawerItem(t2_logout, t2_lbl_sign_out, 5),
                    SizedBox(height: 30),
                    Divider(color: t2_view_color, height: 1),
                    SizedBox(height: 30),
                    getDrawerItem(t2_share, t2_lbl_share_and_invite, 6),
                    getDrawerItem(t2_help, t2_lbl_help_and_feedback, 7),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerItem(String icon, String name, int pos) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = pos;
        });
      },
      child: Container(
        color: selectedItem == pos ? t2_colorPrimaryLight : appStore.scaffoldBackground,
        padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(icon, width: 20, height: 20, color: appStore.iconColor),
            SizedBox(width: 20),
            Text(name, style: primaryTextStyle(color: selectedItem == pos ? t2_colorPrimary : appStore.textPrimaryColor, size: 18))
          ],
        ),
      ),
    );
  }
}
