import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme5/model/T5Models.dart';

import '../../../../main.dart';
import '../T5Colors.dart';
import '../T5Constant.dart';

// ignore: must_be_immutable
class T5GridListing extends StatelessWidget {
  List<T5Category>? mFavouriteList;
  var isScrollable = false;

  T5GridListing(this.mFavouriteList, this.isScrollable);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GridView.builder(
        scrollDirection: Axis.vertical,
        physics: isScrollable ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        itemCount: mFavouriteList!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 16, mainAxisSpacing: 16),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: boxDecoration(radius: 10, showShadow: true, bgColor: appStore.scaffoldBackground),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: width / 7.5,
                    width: width / 7.5,
                    margin: EdgeInsets.only(bottom: 4, top: 8),
                    padding: EdgeInsets.all(width / 30),
                    decoration: boxDecoration(bgColor: mFavouriteList![index].color, radius: 10),
                    child: SvgPicture.asset(
                      mFavouriteList![index].icon,
                      color: t5White,
                    ),
                  ),
                  text(mFavouriteList![index].name, textColor: appStore.textSecondaryColor, fontSize: textSizeMedium)
                ],
              ),
            ),
          );
        });
  }
}
