import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/model/db1/Db1Model.dart';
import 'package:prokit_flutter/dashboard/utils/DbColors.dart';
import 'package:prokit_flutter/dashboard/utils/DbDataGenerator.dart';
import 'package:prokit_flutter/dashboard/utils/DbImages.dart';
import 'package:prokit_flutter/dashboard/utils/DbStrings.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';

class Dashboard1 extends StatefulWidget {
  static String tag = '/Dashboard1';

  @override
  Dashboard1State createState() => Dashboard1State();
}

class Dashboard1State extends State<Dashboard1> {
  late List<Db1CategoryModel> mListings;
  late List<Db1CategoryModel> mListings1;
  late List<DB1FoodModel> mListings2;
  late List<DB1FoodModel> mListings3;

  @override
  void initState() {
    super.initState();
    mListings = getCategories();
    mListings1 = getFilterFavourites();
    mListings2 = getPopular();
    mListings3 = getFoodItems();
    changeStatusColor(db1_colorPrimary);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: db1_colorPrimary,
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
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: white, width: 2)),
                            child: CircleAvatar(backgroundImage: AssetImage(db_profile), radius: 25),
                          ),
                          SizedBox(width: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[Text(db1_address, style: primaryTextStyle(color: white))],
                          )
                        ],
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  Icon(Icons.search, color: white)
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(color: white, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 16),
                      child: Text(db1_top_picks_for_you, style: primaryTextStyle(size: 20, fontFamily: fontMedium)),
                    ),
                    SizedBox(
                      height: width * 0.33,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mListings.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Category(mListings[index], index);
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 4),
                      child: Text(db1_lbl_recommended_dishes, style: primaryTextStyle(size: 20, fontFamily: fontMedium)),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: width * 0.6,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mListings3.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Recommended(mListings3[index], index);
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 16),
                      child: Text(db1_lbl_filter_your_favourite, style: primaryTextStyle(size: 20, fontFamily: fontMedium)),
                    ),
                    SizedBox(
                      height: width * 0.3,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mListings1.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Filter(mListings1[index], index);
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 16),
                      child: Text(db1_lbl_popular, style: primaryTextStyle(size: 20, fontFamily: fontMedium)),
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mListings2.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Popular(mListings2[index], index);
                        }),
                    SizedBox(height: 16)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Popular extends StatelessWidget {
  late DB1FoodModel model;

  Popular(DB1FoodModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(model.img, fit: BoxFit.fill, height: 80, width: 80),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(model.name, style: primaryTextStyle(fontFamily: fontMedium)),
              Text(model.info, style: primaryTextStyle(color: db1_textColorSecondary, size: 14), maxLines: 1),
              Row(
                children: <Widget>[
                  Text(model.duration, style: secondaryTextStyle(color: db1_textColorSecondary, size: 14), maxLines: 1),
                  VerticalDivider(color: db1_grey, width: 0.5),
                  RatingBar(
                    initialRating: 5,
                    minRating: 1,
                    itemSize: 16,
                    direction: Axis.horizontal,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: db1_yellow,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Category extends StatelessWidget {
  late Db1CategoryModel model;

  Category(Db1CategoryModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(model.img, fit: BoxFit.fill, height: width * 0.2, width: width * 0.2),
          ),
          SizedBox(height: 4),
          Text(model.name, style: primaryTextStyle(size: 14))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Recommended extends StatelessWidget {
  late DB1FoodModel model;

  Recommended(DB1FoodModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
        width: MediaQuery.of(context).size.width / 1.5,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Container(
                alignment: FractionalOffset.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(model.img, height: width * 0.38, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
                )),
            Container(
              transform: Matrix4.translationValues(0.0, -30.0, 0.0),
              margin: EdgeInsets.only(left: 20, right: 20, top: 0),
              decoration: BoxDecoration(
                color: white,
                shape: BoxShape.rectangle,
                boxShadow: <BoxShadow>[
                  BoxShadow(color: dbShadowColor, blurRadius: 0.5, spreadRadius: 1),
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(model.name, style: primaryTextStyle(fontFamily: fontMedium), maxLines: 2),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(model.info, style: primaryTextStyle(color: db1_textColorSecondary)),
                          Text(model.duration, style: primaryTextStyle(color: db1_textColorSecondary)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

// ignore: must_be_immutable
class Filter extends StatelessWidget {
  late Db1CategoryModel model;

  Filter(Db1CategoryModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: model.color, borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: SvgPicture.asset(model.img, height: width * 0.12, width: width * 0.12),
            ),
          ),
          Text(model.name, style: primaryTextStyle(color: db1_textColorSecondary))
        ],
      ),
    );
  }
}
