import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/food/model/FoodModel.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodColors.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodDataGenerator.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodString.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodWidget.dart';
import 'package:prokit_flutter/fullApps/food/utils/dotted_border.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'FoodAddressConfirmation.dart';
import 'FoodCoupon.dart';
import 'FoodPayment.dart';

class FoodBookCart extends StatefulWidget {
  static String tag = '/BookCart';

  @override
  FoodBookCartState createState() => FoodBookCartState();
}

class FoodBookCartState extends State<FoodBookCart> {
  late List<FoodDish> mList2;

  @override
  void initState() {
    super.initState();
    mList2 = orderData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_white);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: food_white,
      bottomNavigationBar: Container(
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: food_app_background,
              padding: EdgeInsets.all(14),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(Icons.location_on, size: 30),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(food_lbl_Sweet_home, style: primaryTextStyle()),
                            GestureDetector(
                              onTap: () {
                                FoodAddressConfirmation().launch(context);
                              },
                              child: Text(food_lbl_change, style: primaryTextStyle(color: food_colorPrimary)),
                            ),
                          ],
                        ),
                        Text(food_lbl_address_dashboard, style: primaryTextStyle()),
                        Text(food_lbl_delivery_time_36_min, style: primaryTextStyle(size: 14, color: food_textColorSecondary)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            bottomBillDetail(context, food_color_blue_gradient1, food_color_blue_gradient2, food_lbl_make_payment, onTap: () {
              FoodPayment().launch(context);
            })
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.arrow_back, color: food_textColorPrimary),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(food_lbl_your_cart, style: boldTextStyle(size: 24)),
                    SizedBox(height: 16),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mList2.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Cart(mList2[index], index);
                        }),
                    Divider(color: food_view_color, height: 0.5),
                    SizedBox(height: 8),
                    Text(food_lbl_restaurants_bill.toUpperCase(), style: boldTextStyle()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(food_lbl_sub_total, style: primaryTextStyle()),
                        Text(food_lbl_1799, style: primaryTextStyle()),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(food_lbl_coupon_discount, style: primaryTextStyle()),
                        Text(food_lbl_70, style: primaryTextStyle(color: food_colorAccent)),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(food_lbl_gst, style: primaryTextStyle()),
                        Text(food_lbl_70, style: primaryTextStyle()),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DottedBorder(
                      color: food_colorAccent,
                      strokeWidth: 1,
                      padding: EdgeInsets.all(16),
                      radius: Radius.circular(16),
                      child: ClipRRect(
                        child: Container(
                            width: width,
                            padding: EdgeInsets.all(4),
                            color: food_color_light_primary,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Text(food_lbl_you_have_saved_30_on_the_bill, style: primaryTextStyle()).center(),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        FoodCoupon().launch(context);
                                      },
                                      child: Text(food_lbl_edit, style: primaryTextStyle()).center(),
                                    ))
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  late FoodDish model;

  Cart(FoodDish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(
                    model.image,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(model.name, style: primaryTextStyle()),
                      Text(model.price, style: primaryTextStyle()),
                      //text("sd",textColor: food_textColorSecondary),
                    ],
                  ),
                )
              ],
            ),
          ),
          Quantitybtn()
        ],
      ),
    );
  }
}
