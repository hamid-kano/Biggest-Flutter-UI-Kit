import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme3/model/T3_Model.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3DataGenerator.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3Images.dart';
import 'package:prokit_flutter/themes/theme3/utils/colors.dart';
import 'package:prokit_flutter/themes/theme3/utils/strings.dart';

class T3Search extends StatefulWidget {
  static var tag = "/T3Search";

  @override
  T3SearchState createState() => T3SearchState();
}

class T3SearchState extends State<T3Search> {
  late List<Theme3Dish> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getSearchData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      body: Container(
        color: appStore.scaffoldBackground,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: appStore.iconColor,
                    onPressed: () {
                      finish(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.menu),
                    color: appStore.iconColor,
                    onPressed: () {
                      finish(context);
                    },
                  ),
                ],
              ),
              Container(margin: EdgeInsets.only(left: 16), child: Text(t3_lbl_search_product, style: boldTextStyle(size: 22))),
              Padding(
                padding: EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: t3_white,
                        hintText: t3_lbl_search,
                        contentPadding: EdgeInsets.only(left: 26.0, bottom: 8.0, right: 50.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: t3_white, width: 0.5),
                          borderRadius: BorderRadius.circular(26),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: t3_view_color, width: 0.5),
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: SvgPicture.asset(
                          t3_ic_search,
                          color: t3_colorPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(top: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: mListings.length,
                  itemBuilder: (context, index) {
                    return T3SearchList(mListings[index], index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class T3SearchList extends StatelessWidget {
  late Theme3Dish model;

  T3SearchList(Theme3Dish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(model.dishImage) /*AssetImage(model.dishImage)*/,
            radius: 50,
          ),
          SizedBox(height: 6),
          Text(model.dishName, style: boldTextStyle(size: 16)),
          Text(model.description, style: primaryTextStyle(size: 14)),
        ],
      ),
    );
  }
}
