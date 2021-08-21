import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme3/model/T3_Model.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3DataGenerator.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3Images.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3widgets.dart';
import 'package:prokit_flutter/themes/theme3/utils/colors.dart';
import 'package:prokit_flutter/themes/theme3/utils/strings.dart';

import '../../../main.dart';

class T3Listing extends StatefulWidget {
  static var tag = "/T3Listing";

  @override
  T3ListingState createState() => T3ListingState();
}

class T3ListingState extends State<T3Listing> {
  late List<Theme3Dish> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getList();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Container(
        color: appStore.scaffoldBackground,
        child: Stack(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height) / 3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark]),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)),
              ),
            ),
            Column(
              children: <Widget>[
                T3AppBar(t3_lbl_listing),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mListings.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return T3List(mListings[index], index);
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class T3List extends StatelessWidget {
  late Theme3Dish model;

  T3List(Theme3Dish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: defaultBoxShadow(), color: appStore.scaffoldBackground),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      child: CachedNetworkImage(
                        placeholder: (_, s) => placeholderWidget(),
                        imageUrl: model.dishImage,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text(model.dishName, style: boldTextStyle(size: 18),maxLines: 2,).expand(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(t3_lbl_share_to, style: boldTextStyle(size: 14)),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(t3_ic_wp, height: 20, width: 20),
                        Container(margin: EdgeInsets.only(left: 10, right: 10), child: Image.asset(t3_ic_facebook, height: 20, width: 20)),
                        SvgPicture.asset(t3_ic_instagram, height: 20, width: 20),
                        Container(margin: EdgeInsets.only(left: 10, right: 10), child: Image.asset(t3_ic_linkedin, height: 20, width: 20)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(model.description, style: secondaryTextStyle(size: 16), maxLines: 2),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: t3_white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))),
                  padding: EdgeInsets.all(0.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark]),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        t3_lbl_view_more_recipe,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
