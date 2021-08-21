import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme2/models/models.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2DataGenerator.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Strings.dart';

import '../../../main.dart';

class T2Cards extends StatefulWidget {
  static var tag = "/T2Cards";

  @override
  T2CardsState createState() => T2CardsState();
}

class T2CardsState extends State<T2Cards> {
  late List<T2Favourite> mFavouriteList;

  @override
  void initState() {
    super.initState();
    mFavouriteList = getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      appBar: appBar(context, t2_Cards),
      body: Observer(
        builder: (_) => Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(top: 16, bottom: 16),
                itemCount: mFavouriteList.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    key: ValueKey(index),
                    actionPane: SlidableDrawerActionPane(),
                    actions: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            IconSlideAction(
                              caption: '',
                              color: Colors.transparent,
                              icon: Icons.edit,
                              closeOnTap: true,
                              foregroundColor: Colors.transparent,
                              onTap: () {},
                            ),
                            RotatedBox(
                              quarterTurns: -1,
                              child: Text("Edit", style: boldTextStyle(color: white, letterSpacing: 5.0)).center(),
                            )
                          ],
                          alignment: Alignment.center,
                        ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: t2_green),
                        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        alignment: Alignment.center,
                      )
                    ],
                    secondaryActions: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            IconSlideAction(
                              caption: '',
                              color: Colors.transparent,
                              icon: Icons.edit,
                              closeOnTap: true,
                              foregroundColor: Colors.transparent,
                              onTap: () {},
                            ),
                            RotatedBox(
                              quarterTurns: -1,
                              child: Text("Remove", style: boldTextStyle(color: white, letterSpacing: 5.0)).center(),
                            )
                          ],
                          alignment: Alignment.center,
                        ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: t2_red),
                        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        alignment: Alignment.center,
                      ),
                    ],
                    dismissal: SlidableDismissal(
                      child: SlidableDrawerDismissal(),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      decoration: BoxDecoration(boxShadow: defaultBoxShadow(), borderRadius: BorderRadius.circular(12)),
                      child: IntrinsicHeight(
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: appStore.scaffoldBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(color: t2_colorPrimary, width: 10),
                              SizedBox(width: 10),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          CachedNetworkImage(
                                            placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                            imageUrl: mFavouriteList[index].image,
                                            width: width / 5,
                                            height: 100,
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.only(left: 16),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(mFavouriteList[index].name, style: boldTextStyle(color: appStore.textPrimaryColor), maxLines: 2),
                                                  Text(mFavouriteList[index].duration, style: primaryTextStyle(size: 16, color: appStore.textSecondaryColor)),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      Text(t2_samplelong_text, style: primaryTextStyle(size: 16, color: appStore.textSecondaryColor), maxLines: 2),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
