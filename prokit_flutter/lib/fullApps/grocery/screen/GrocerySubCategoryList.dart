import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryProductDescription.dart';

class GrocerySubCategoryList extends StatefulWidget {
  static String tag = '/GrocerySubCategoryList';

  @override
  GrocerySubCategoryListState createState() => GrocerySubCategoryListState();
}

class GrocerySubCategoryListState extends State<GrocerySubCategoryList> {
  late List<ProductModel> mStoreDealList;

  @override
  void initState() {
    super.initState();
    mStoreDealList = storeMemberItems();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, width * 0.25),
        child: TopBar(Icons.arrow_back, "Coffee", Icons.search, () {}),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: spacing_middle, right: spacing_middle, top: spacing_middle),
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.55),
            itemCount: mStoreDealList.length,
            itemBuilder: (context, index) {
              return StoreDeal(mStoreDealList[index], index);
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class StoreDeal extends StatelessWidget {
  late ProductModel model;

  StoreDeal(ProductModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GroceryProductDescription().launch(context);
      },
      child: Container(
        decoration: boxDecoration(showShadow: true, radius: 10.0),
        padding: EdgeInsets.all(spacing_middle),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: spacing_control, right: spacing_control),
                  decoration: boxDecoration(
                    radius: spacing_control,
                    bgColor: grocery_light_gray_color,
                  ),
                  child: text(model.weight, fontSize: textSizeSmall, isCentered: true),
                ),
                Icon(
                  Icons.favorite_border,
                  color: grocery_icon_color,
                )
              ],
            ),
            SizedBox(
              height: 4,
            ),
            CachedNetworkImage(
              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
              imageUrl: model.img,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.width * 0.22,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  text(model.name, fontFamily: fontMedium, textColor: grocery_textColorSecondary),
                  text(
                    model.price,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
