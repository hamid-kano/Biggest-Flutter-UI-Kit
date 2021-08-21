import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GrocerySubCategoryList.dart';

class GroceryCategoryList extends StatefulWidget {
  static String tag = '/GroceryCategoryList';

  @override
  GroceryCategoryListState createState() => GroceryCategoryListState();
}

class GroceryCategoryListState extends State<GroceryCategoryList> {
  late List<CategoryOptionModel> mOptionList;

  @override
  void initState() {
    super.initState();
    mOptionList = categoryOptionItem();
  }

  @override
  Widget build(BuildContext context) {
    double expandHeight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: grocery_app_background,
        body: Stack(
          children: <Widget>[
            Container(
              width: width,
              height: expandHeight * 0.32,
              child: commonCacheImageWidget(grocery_ic_bg_drinks, context.width() * 0.7),
            ),
            SafeArea(
              child: Container(
                color: Colors.transparent,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: grocery_color_white,
                          onPressed: () {
                            finish(context);
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Center(
                            child: text("Cold Drinks", fontFamily: fontBold, textColor: grocery_color_white, fontSize: textSizeLargeMedium),
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      color: grocery_color_white,
                      onPressed: () {
                        finish(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_large, top: expandHeight * 0.23),
              padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
              decoration: boxDecoration(radius: 10.0),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mOptionList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CategoryList(mOptionList[index], index);
                  }),
            ),
//
          ],
        )
//      NestedScrollView(
//        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//          return <Widget>[
//            SliverAppBar(
//              expandedHeight: expandHeight,
//              floating: true,
//              forceElevated: innerBoxIsScrolled,
//              pinned: true,
//              titleSpacing: 0,
//              backgroundColor: innerBoxIsScrolled
//                  ? grocery_color_white
//                  : grocery_color_white,
//              actionsIconTheme: IconThemeData(opacity: 0.0),
//              title: Container(
//                height: 60,
//                child: Container(
//                  width: MediaQuery.of(context).size.width,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                          text("dfg",
//                              textColor: grocery_textColorPrimary,
//                              fontSize: textSizeMedium,
//                              fontFamily: fontBold),
//                        ],
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              flexibleSpace: FlexibleSpaceBar(
//                  background: Container(
//                height: expandHeight,
//                child: Stack(
//                  children: <Widget>[
//
//                    Container(
//                      width: width,
//                      color: Colors.deepOrangeAccent,
//child:  Image.asset(Grocery_ic_DeliveryBoy,fit: BoxFit.contain,),
//                    ),
//
//                  ],
//                ),
//              )),
//            ),
//          ];
//        },
//        body:Container(
//          margin: EdgeInsets.only(left: spacing_standard_new,right: spacing_standard_new,bottom: spacing_large),
//          padding: EdgeInsets.only(left: spacing_standard_new,right: spacing_standard_new),
//          decoration: boxDecoration(showShadow: true),
//          child:  ListView.builder(
//              scrollDirection: Axis.vertical,
//              itemCount: mOptionList.length,
//              shrinkWrap: true,
//              itemBuilder: (context, index) {
//                return CategoryList(mOptionList[index], index);
//              }),
//        ),
//      ),
        );
  }
}

// ignore: must_be_immutable
class CategoryList extends StatelessWidget {
  late CategoryOptionModel model;

  CategoryList(CategoryOptionModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GrocerySubCategoryList().launch(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text(model.name, fontFamily: fontMedium),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: grocery_textColorSecondary,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
              color: grocery_textColorSecondary,
              height: 0.5,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
