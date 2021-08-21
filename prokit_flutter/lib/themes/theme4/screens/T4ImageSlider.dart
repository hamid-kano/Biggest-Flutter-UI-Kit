import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme4/models/T4Models.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Constant.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4DataGenerator.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Images.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Widgets.dart';

import '../../../main.dart';

class T4ImageSlider extends StatefulWidget {
  static var tag = "/T4ImageSlider";

  @override
  T4ImageSliderState createState() => T4ImageSliderState();
}

class T4ImageSliderState extends State<T4ImageSlider> {
  late List<T4NewsModel> mHorizontalListings;

  @override
  void initState() {
    super.initState();
    mHorizontalListings = getList2Data();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: Container(
        child: Column(
          children: <Widget>[
            TopBar("ImageSlider"),
            Container(
              width: width,
              height: height * 0.37,
              margin: EdgeInsets.only(top: 22),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mHorizontalListings.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: index == mHorizontalListings.length - 1 ? EdgeInsets.only(left: 16, right: 16) : EdgeInsets.only(left: 16),
                      alignment: Alignment.topLeft,
                      width: width * 0.8,
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            child: CachedNetworkImage(
                              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                              imageUrl: mHorizontalListings[index].image,
                              height: height * 0.28,
                              width: width * 0.8,
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    text(mHorizontalListings[index].name, textColor: appStore.textPrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontBold),
                                    text(mHorizontalListings[index].info, fontSize: textSizeMedium, textColor: appStore.textPrimaryColor),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.asset(t4_heart, width: 24, height: 24, color: appStore.iconColor),
                                  SizedBox(width: 16),
                                  SvgPicture.asset(t4_share, width: 24, height: 24, color: appStore.iconSecondaryColor),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
