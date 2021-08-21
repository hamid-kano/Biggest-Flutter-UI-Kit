import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme7/models/T7Models.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7BottomNavigationBar.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Colors.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Constant.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7DataGenerator.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Images.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Strings.dart';

import '../../../main.dart';

class T7Dashboard extends StatefulWidget {
  static String tag = '/T7Dashboard';

  @override
  T7DashboardState createState() => T7DashboardState();
}

class T7DashboardState extends State<T7Dashboard> {
  late List<T7CategoryDataModel> mListings;
  late List<T7BestDestinationDataModel> mListings1;
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    mListings = generateCategories();
    mListings1 = generateBestDestination();
    _selectedIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: appStore.scaffoldBackground, boxShadow: [BoxShadow(color: shadowColorGlobal, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5)]),
        child: T7BottomNavigationBar(
          backgroundColor: appStore.scaffoldBackground,
          items: <T7BottomNavigationBarItem>[
            T7BottomNavigationBarItem(icon: t7_ic_home),
            T7BottomNavigationBarItem(icon: t7_ic_compass),
            T7BottomNavigationBarItem(icon: t7_ic_msg),
            T7BottomNavigationBarItem(icon: t7_ic_setting),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: t7textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: t7colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: T7BottomNavigationBarType.fixed,
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(t7_hi_juila, fontSize: textSizeNormal, textColor: appStore.textPrimaryColor),
                      Icon(Icons.search, color: appStore.iconColor),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      text(t7_you_are_in_54_king_ports, textColor: appStore.textSecondaryColor),
                    ],
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 16),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mListings.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return category(mListings[index], index);
                      }),
                ),
                SizedBox(height: 8),
                Divider(
                  height: 4,
                  color: t7view_color,
                  thickness: 2,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(
                        t7_best_destination,
                        textColor: appStore.textPrimaryColor,
                        fontSize: textSizeLarge,
                      ),
                      text(t7_see_all, textColor: appStore.textSecondaryColor, textAllCaps: true),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    primary: false,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
                    itemCount: mListings1.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) => Container(
                      margin: EdgeInsets.only(left: 4, bottom: 4, top: 4),
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(16.0),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            CachedNetworkImage(
                              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                              imageUrl: mListings1[index].image,
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  text(mListings1[index].name, textColor: t7white),
                                  Container(
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                                        child: RichText(
                                          text: TextSpan(
                                            style: Theme.of(context).textTheme.bodyText2,
                                            children: [
                                              WidgetSpan(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                                                  child: Icon(
                                                    Icons.star_border,
                                                    color: Colors.amber,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                              TextSpan(text: mListings1[index].rating, style: TextStyle(fontSize: textSizeMedium, color: t7white, fontFamily: fontMedium)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      decoration: boxDecoration(radius: 12, bgColor: t7_black_trans)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class category extends StatelessWidget {
  late T7CategoryDataModel model;

  category(T7CategoryDataModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          Container(
            decoration: boxDecoration(bgColor: t7light_blue, radius: 16),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                model.image,
                height: 40,
                width: 40,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          text(model.name, textColor: t7textColorSecondary)
        ],
      ),
    );
  }
}
