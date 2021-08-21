import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme4/models/T4Models.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Colors.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Constant.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4DataGenerator.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Images.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Widgets.dart';
import 'package:prokit_flutter/themes/theme4/utils/widgets/T4BottomNavigationBar.dart';

class T4Dashboard extends StatefulWidget {
  static var tag = "/T4Dashboard";

  @override
  T4DashboardState createState() => T4DashboardState();
}

class T4DashboardState extends State<T4Dashboard> {
  int selectedPos = 1;
  late List<T4NewsModel> mCategories;
  late List<T4NewsModel> mHorizontalListings;
  late List<T4NewsModel> mListings;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getDashboardData();
    mCategories = getCategoryData();
    mHorizontalListings = getList2Data();

    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: Observer(
        builder: (_) => Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TopBar("Dashboard"),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: width,
                        height: width * 0.1,
                        margin: EdgeInsets.only(top: 10),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: mCategories.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                margin: index == mCategories.length - 1 ? EdgeInsets.only(left: 16, right: 16) : EdgeInsets.only(left: 16),
                                alignment: Alignment.center,
                                decoration: boxDecoration(radius: 4, bgColor: mCategories[index].color),
                                child: text(mCategories[index].category, textColor: t4_white, fontFamily: fontMedium),
                              );
                            }),
                      ),
                      Container(
                        width: width,
                        height: width * 0.67,
                        margin: EdgeInsets.only(top: 22),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: mHorizontalListings.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: index == mHorizontalListings.length - 1 ? EdgeInsets.only(left: 16, right: 16) : EdgeInsets.only(left: 16),
                                alignment: Alignment.topLeft,
                                width: width * 0.8,
                                child: Column(
                                  children: <Widget>[
                                    ClipRRect(
                                      child: CachedNetworkImage(
                                        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                        imageUrl: mHorizontalListings[index].image,
                                        height: width * 0.5,
                                        width: width * 0.8,
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                text(mHorizontalListings[index].name, textColor: appStore.textPrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontBold),
                                                text(mHorizontalListings[index].info, fontSize: textSizeMedium, textColor: appStore.textSecondaryColor),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              SvgPicture.asset(t4_heart, width: 24, height: 24, color: appStore.iconColor),
                                              SizedBox(width: 16),
                                              SvgPicture.asset(t4_share, width: 24, height: 24, color: appStore.iconSecondaryColor),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          primary: false,
                          padding: EdgeInsets.only(bottom: 30),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          shrinkWrap: true,
                          staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
                          itemCount: mListings.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) => Container(
                            margin: EdgeInsets.only(left: 4, bottom: 4, right: 4, top: 4),
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ClipRRect(
                                  child: CachedNetworkImage(
                                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                    imageUrl: mListings[index].image,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                text(mListings[index].name, textColor: appStore.textPrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontBold),
                                text(mListings[index].info, fontSize: textSizeMedium, textColor: appStore.textSecondaryColor),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: appStore.appBarColor,
          boxShadow: [
            BoxShadow(
              color: shadowColorGlobal,
              offset: Offset.fromDirection(3, 1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: T4BottomNavigationBar(
          items: <T4BottomNavigationBarItem>[
            T4BottomNavigationBarItem(icon: t4_home),
            T4BottomNavigationBarItem(icon: t4_playbutton),
            T4BottomNavigationBarItem(icon: t4_heart),
            T4BottomNavigationBarItem(icon: t4_user),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: appStore.scaffoldBackground,
          unselectedIconTheme: IconThemeData(color: appStore.iconSecondaryColor, size: 24),
          selectedIconTheme: IconThemeData(color: t4_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: T4BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
