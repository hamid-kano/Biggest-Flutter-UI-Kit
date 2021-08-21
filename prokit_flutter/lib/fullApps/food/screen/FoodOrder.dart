import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/food/model/FoodModel.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodDataGenerator.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodString.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../utils/FoodColors.dart';

class FoodOrder extends StatefulWidget {
  static String tag = '/FoodOrder';

  @override
  FoodOrderState createState() => FoodOrderState();
}

class FoodOrderState extends State<FoodOrder> {
  late List<FoodDish> mList2;

  @override
  void initState() {
    super.initState();
    mList2 = orderData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_white);

    return Scaffold(
      backgroundColor: food_white,
      appBar: appBar(context, food_lbl_orders),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            16.height,
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList2.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Order(mList2[index], index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Order extends StatelessWidget {
  late FoodDish model;

  Order(FoodDish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(model.image),
                ),
                SizedBox(width: 10),
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
        ],
      ),
    );
  }
}
