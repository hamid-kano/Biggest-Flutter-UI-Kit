import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme7/models/T7Models.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Colors.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Constant.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7DataGenerator.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Images.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Strings.dart';

class T7Search extends StatefulWidget {
  static String tag = '/T7Search';

  @override
  T7SearchState createState() => T7SearchState();
}

class T7SearchState extends State<T7Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: DefaultTabController(
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(150),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: boxDecoration(showShadow: true, bgColor: appStore.appBarColor),
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(bottom: 25, top: 10),
                          child: Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(26, 8, 8, 26),
                                      hintText: t7_search_nearby_destination,
                                      filled: true,
                                      prefixIcon: Icon(Icons.search),
                                      fillColor: t7view_color,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(color: t7view_color, width: 0.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(color: t7view_color, width: 0.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.close)
                              ],
                            ),
                          ),
                        ),
                        TabBar(
                          unselectedLabelColor: appStore.textSecondaryColor,
                          indicatorColor: appStore.textPrimaryColor,
                          labelColor: appStore.textPrimaryColor,
                          tabs: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                              child: text(t7_place),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                              child: text(t7_hotels),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                              child: text(t7_food),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                              child: text(t7_events),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  Search(),
                  Search(),
                  Search(),
                  Search(),
                ],
              ),
            ),
            length: 4,
          ),
        ),
      ),
    );
  }
}

class Search extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  late List<T7RecentSearchDataModel> mListings;
  late List<T7RecentSearchDataModel> mListings1;

  @override
  void initState() {
    super.initState();
    mListings = generatePopularDestination();
    mListings1 = generateRecentSearch();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyText2,
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: SvgPicture.asset(t7_ic_send, color: t7icon_color),
                    ),
                  ),
                  TextSpan(text: t7_search_nearby_destination, style: TextStyle(fontSize: textSizeMedium, color: appStore.textPrimaryColor)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text(t7_recent_search, textColor: appStore.textPrimaryColor),
                text(t7_clear_all, textColor: t7textColorSecondary),
              ],
            ),
            SizedBox(height: 16),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mListings1.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText2,
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.access_time,
                                color: t7textColorSecondary,
                                size: 16,
                              ),
                            ),
                          ),
                          TextSpan(text: mListings1[index].name, style: TextStyle(fontSize: textSizeMedium, color: t7textColorSecondary)),
                        ],
                      ),
                    ),
                  ));
                }),
            SizedBox(height: 20),
            text(t7_popular_destination, textColor: appStore.textPrimaryColor),
            SizedBox(height: 16),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mListings.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(child: text(mListings[index].name, textColor: t7textColorSecondary)),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
