import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';
import 'package:prokit_flutter/themes/theme7/models/T7Models.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Colors.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Constant.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7DataGenerator.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Strings.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Widget.dart';

import '../../../main.dart';

class T7HotelList extends StatefulWidget {
  static String tag = '/T7HotelList';

  @override
  T7HotelListState createState() => T7HotelListState();
}

class T7HotelListState extends State<T7HotelList> {
  late List<T7HotelDataModel> mListings;

  @override
  void initState() {
    super.initState();
    mListings = generateHotels();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            color: appStore.appBarColor,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  backIcon(context, appStore.appBarColor, Icons.keyboard_arrow_left, appStore.iconColor),
                  text(t7_hotels, textColor: appStore.textPrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                  backIcon(context, t7colorPrimary, Icons.menu, appStore.iconColor)
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mListings.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: width * 0.32,
                          width: width * 0.32,
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: new BorderRadius.circular(12.0),
                                child: CachedNetworkImage(
                                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                  imageUrl: mListings[index].image,
                                  fit: BoxFit.fill,
                                  height: width * 0.32,
                                  width: width * 0.32,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.only(right: 10, top: 10),
                                  child: Icon(Icons.favorite_border, color: appStore.iconColor, size: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(mListings[index].name, textColor: appStore.textPrimaryColor),
                              text(mListings[index].address, maxLine: 1, textColor: appStore.textSecondaryColor, fontSize: textSizeSMedium),
                              SizedBox(height: 2),
                              Row(
                                children: <Widget>[
                                  RatingBar(
                                    initialRating: 5,
                                    minRating: 1,
                                    itemSize: 16,
                                    direction: Axis.horizontal,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: t7colorPrimary,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                  text(mListings[index].hotel_review, textColor: t7textColorSecondary, fontSize: textSizeSMedium),
                                ],
                              ),
                              text(mListings[index].price, textColor: t7textColorSecondary, fontSize: textSizeSMedium),
                              text(mListings[index].room_detail, maxLine: 1, isLongText: true, textColor: t7textColorSecondary, fontSize: textSizeSMedium),
                              SizedBox(height: 8),
                              Divider(height: 0.5, color: t7view_color, thickness: 1)
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
