import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme6/models/T6Models.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Colors.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Constant.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6DataGenerator.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Strings.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Widget.dart';

import '../../../main.dart';

class T6List extends StatefulWidget {
  static String tag = '/T6List';

  @override
  T6ListState createState() => T6ListState();
}

class T6ListState extends State<T6List> {
  int selectedPos = 1;
  late List<T6LogModel> mListings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mListings = getList();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: Column(
        children: <Widget>[
          TopBar(titleName: t6_lbl_listing),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        width: width,
                        decoration: boxDecoration(radius: 16, showShadow: true, bgColor: appStore.scaffoldBackground),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.topRight,
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                                    child: CachedNetworkImage(
                                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                      imageUrl: mListings[index].Image,
                                      height: 200,
                                      width: width,
                                      fit: BoxFit.cover,
                                    )),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  decoration: boxDecoration(radius: 10, showShadow: false, bgColor: t6white),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: text(mListings[index].type),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(mListings[index].name, textColor: appStore.textPrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                                  text(
                                    mListings[index].type,
                                    textColor: appStore.textSecondaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
