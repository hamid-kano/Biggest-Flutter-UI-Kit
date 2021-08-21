import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GrocerySearch extends StatefulWidget {
  static String tag = '/GrocerySearch';

  @override
  GrocerySearchState createState() => GrocerySearchState();
}

class GrocerySearchState extends State<GrocerySearch> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    changeStatusColor(grocery_colorPrimary);
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: AppBar(
        backgroundColor: grocery_colorPrimary,
        iconTheme: IconThemeData(color: grocery_color_white),
        actionsIconTheme: IconThemeData(color: grocery_color_white),
        title: TextFormField(
          controller: searchController,
          textInputAction: TextInputAction.search,
          style: TextStyle(fontSize: textSizeMedium, color: grocery_color_white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(fontSize: textSizeMedium, color: grocery_color_white),
          ),
          keyboardType: TextInputType.text,
          textAlign: TextAlign.start,
        ),
        actions: <Widget>[
          searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: grocery_color_white),
                  onPressed: () {},
                )
              : Container()
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                imageUrl: Grocery_ic_DeliveryBoy,
                width: width * 0.4,
                height: width * 0.4,
              ),
              text(grocery_lbl_no_search_found, fontFamily: fontMedium, fontSize: textSizeNormal),
            ],
          ),
        ),
      ),
    );
  }
}
