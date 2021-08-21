import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme2/models/models.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2DataGenerator.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Strings.dart';

class T2Listing extends StatefulWidget {
  static var tag = "/T2Listing";

  @override
  T2ListingState createState() => T2ListingState();
}

class T2ListingState extends State<T2Listing> {
  int selectedPos = 1;
  late List<T2ListModel> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getListData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
        appBar: appBar(context, t2_Listing),
        body: Observer(
          builder: (_) => Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 28, right: 28, top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPos = 1;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              "All",
                              style: primaryTextStyle(size: 16, color: selectedPos == 1 ? t2_colorPrimary : appStore.textPrimaryColor),
                            ),
                            Container(width: 5, height: 5, decoration: BoxDecoration(color: selectedPos == 1 ? t2_colorPrimary : Colors.transparent))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPos = 2;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Text("Popular", style: primaryTextStyle(size: 16, color: selectedPos == 2 ? t2_colorPrimary : appStore.textPrimaryColor)),
                            Container(width: 5, height: 5, decoration: BoxDecoration(color: selectedPos == 2 ? t2_colorPrimary : Colors.transparent))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPos = 3;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Text("New", style: primaryTextStyle(size: 16, color: selectedPos == 3 ? t2_colorPrimary : appStore.textPrimaryColor)),
                            Container(width: 5, height: 5, decoration: BoxDecoration(color: selectedPos == 3 ? t2_colorPrimary : Colors.transparent))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPos = 4;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Text("Trend", style: primaryTextStyle(size: 16, color: selectedPos == 4 ? t2_colorPrimary : appStore.textPrimaryColor)),
                            Container(width: 5, height: 5, decoration: BoxDecoration(color: selectedPos == 4 ? t2_colorPrimary : Colors.transparent))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Container(
                          decoration: BoxDecoration(color: appStore.scaffoldBackground, borderRadius: BorderRadius.circular(10), boxShadow: defaultBoxShadow()),
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: appStore.scaffoldBackground,
                            child: Row(
                              children: <Widget>[
                                CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: mListings[index].icon, width: width / 3, height: width / 2.8, fit: BoxFit.fill),
                                Container(
                                  width: width - (width / 3) - 35,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              color: index % 2 == 0 ? t2_red : t2_colorPrimary,
                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                                            ),
                                            padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                                            child: Text(index % 2 == 0 ? "New" : "Popular", style: primaryTextStyle(color: white, size: 12)),
                                          ),
                                          GestureDetector(onTap: () {}, child: Icon(Icons.more_vert))
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(mListings[index].name, style: primaryTextStyle(color: appStore.textPrimaryColor, size: 18)),
                                            SizedBox(height: 4),
                                            Text(mListings[index].duration, style: primaryTextStyle(size: 14)),
                                            SizedBox(height: 4),
                                            Text(mListings[index].description, style: primaryTextStyle(size: 14), maxLines: 1),
                                            SizedBox(height: 4),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            margin: EdgeInsets.all(0),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
