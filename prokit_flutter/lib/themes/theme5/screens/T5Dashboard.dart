import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme5/model/T5Models.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Colors.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Constant.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5DataGenerator.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Images.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Strings.dart';
import 'package:prokit_flutter/themes/theme5/utils/widgets/T5BottomBar.dart';
import 'package:prokit_flutter/themes/theme5/utils/widgets/T5GridListing.dart';
import 'package:prokit_flutter/themes/theme5/utils/widgets/T5Slider.dart';

import '../../../main.dart';

class T5Dashboard extends StatefulWidget {
  static var tag = "/T5Dashboard";

  @override
  T5DashboardState createState() => T5DashboardState();
}

class T5DashboardState extends State<T5Dashboard> {
  bool passwordVisible = false;
  bool isRemember = false;
  var currentIndexPage = 0;
  List<T5Category>? mFavouriteList;
  List<T5Slider>? mSliderList;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
    mFavouriteList = getCategoryItems();
    mSliderList = getSliders();
  }

  void changeSldier(int index) {
    setState(() {
      currentIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t5DarkNavy);
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: t5DarkNavy,
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 70,
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(t5_profile_8),
                        radius: 25,
                      ),
                      SizedBox(width: 16),
                      text(t5_username, textColor: t5White, fontSize: textSizeNormal, fontFamily: fontMedium)
                    ],
                  ),
                  SvgPicture.asset(t5_options, width: 25, height: 25, color: t5White)
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                padding: EdgeInsets.only(top: 28),
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height - 100,
                decoration: BoxDecoration(color: appStore.scaffoldBackground, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                child: Column(
                  children: <Widget>[
                    T5SliderWidget(mSliderList),
                    SizedBox(height: 20),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: T5GridListing(mFavouriteList, false),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: T5BottomBar(),
    );
  }
}
