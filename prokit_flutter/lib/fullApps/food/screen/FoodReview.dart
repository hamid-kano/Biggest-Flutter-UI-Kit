import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/food/model/FoodModel.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodDataGenerator.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodString.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../utils/FoodColors.dart';
import 'FoodRestaurantsDescription.dart';

class FoodReview extends StatefulWidget {
  static String tag = '/FoodReview';

  @override
  FoodReviewState createState() => FoodReviewState();
}

class FoodReviewState extends State<FoodReview> {
  late List<ReviewModel> mReviewList;

  @override
  void initState() {
    super.initState();
    mReviewList = addReviewData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_white);
    return Scaffold(
      backgroundColor: food_white,
      appBar: appBar(context, food_lbl_reviews),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            16.height,
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mReviewList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Review(mReviewList[index], index);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
