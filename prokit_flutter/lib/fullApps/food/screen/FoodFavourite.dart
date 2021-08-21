import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/food/model/FoodModel.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodColors.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodDataGenerator.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodString.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class FoodFavourite extends StatefulWidget {
  static String tag = '/FoodFavourite';

  @override
  FoodFavouriteState createState() => FoodFavouriteState();
}

class FoodFavouriteState extends State<FoodFavourite> {
  late List<FoodDish> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = addFoodDishData();
  }

  @override
  Widget build(BuildContext context) {
    //changeStatusColor(food_app_background);
    return Scaffold(
      backgroundColor: food_app_background,
      appBar: appBar(context, food_lbl_favourite),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.75),
                itemCount: mList1.length,
                itemBuilder: (context, index) {
                  return Favourite(mList1[index], index);
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}

// ignore: must_be_immutable
class Favourite extends StatelessWidget {
  late FoodDish model;

  Favourite(FoodDish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            child: CachedNetworkImage(
              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
              imageUrl: model.image,
              height: width * 0.3,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.name, style: primaryTextStyle(), maxLines: 1),
                Text(model.type, style: primaryTextStyle(color: food_textColorSecondary)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text(model.price), Quantitybtn()],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
