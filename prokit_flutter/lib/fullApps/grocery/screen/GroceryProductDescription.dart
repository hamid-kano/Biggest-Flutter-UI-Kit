import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';

import 'GroceryReviews.dart';

class GroceryProductDescription extends StatefulWidget {
  static String tag = '/ProductDescription';

  @override
  GroceryProductDescriptionState createState() => GroceryProductDescriptionState();
}

class GroceryProductDescriptionState extends State<GroceryProductDescription> {
  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(grocery_app_background);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: grocery_app_background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              width: width,
              margin: EdgeInsets.only(right: spacing_standard_new),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: grocery_icon_color),
                        onPressed: () {
                          finish(context);
                        },
                      ),
                      text(grocery_title_grocery_deals, textColor: grocery_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontBold),
                    ],
                  ),
                  Icon(Icons.favorite_border, color: grocery_icon_color)
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: width,
                  padding: EdgeInsets.only(bottom: spacing_standard_new),
                  margin: EdgeInsets.only(
                    top: width * 0.2,
                    left: spacing_standard_new,
                    right: spacing_standard_new,
                  ),
                  decoration: boxDecoration(showShadow: true, radius: 10.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: width * 0.17),
                      text(grocery_lbl_product_name, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                      SizedBox(height: spacing_standard),
                      Container(
                        padding: EdgeInsets.only(left: spacing_control, right: spacing_control),
                        decoration: boxDecoration(radius: spacing_control, bgColor: grocery_light_gray_color),
                        child: text("1KG", fontSize: textSizeSmall, isCentered: true),
                      ),
                      SizedBox(height: spacing_middle),
                      text(grocery_lbl_price, fontFamily: fontMedium, fontSize: textSizeNormal),
                      SizedBox(height: spacing_large),
                      RatingBar(
                        initialRating: 5,
                        minRating: 1,
                        itemSize: 25,
                        direction: Axis.horizontal,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(Icons.star, color: grocery_color_yellow),
                        onRatingUpdate: (rating) {},
                      ),
                      SizedBox(height: spacing_standard),
                      GestureDetector(
                        onTap: () {
                          GroceryReviews().launch(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: spacing_standard, right: spacing_standard),
                          decoration: boxDecoration(radius: spacing_large, bgColor: grocery_orangeColor_light),
                          child: text(grocery_lbl_product_rating, textColor: grocery_color_yellow),
                        ),
                      ),
                      SizedBox(height: spacing_standard_new),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.remove_circle_outline, size: 35, color: grocery_icon_color),
                          SizedBox(width: spacing_standard_new),
                          text(grocery_lbl_product_weight, fontFamily: fontMedium, fontSize: textSizeLarge, isCentered: true),
                          SizedBox(width: spacing_standard_new),
                          Icon(Icons.add_circle_outline, size: 35, color: grocery_icon_color),
                        ],
                      ),
                      SizedBox(height: spacing_standard_new),
                      FittedBox(
                        child: groceryButton(onPressed: () {}, textContent: grocery_lbl_add_to_cart),
                      ),
                      SizedBox(height: spacing_standard_new),
                      GestureDetector(
                        onTap: () {},
                        child: text(grocery_lbl_buy_now, textColor: grocery_colorPrimary, textAllCaps: true),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.all(spacing_standard_new),
                    decoration: boxDecoration(showShadow: true, radius: 10.0),
                    height: width * 0.35,
                    width: width * 0.6,
                    child: CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                      imageUrl: grocery_ic_carrot,
                      fit: BoxFit.fill,
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
