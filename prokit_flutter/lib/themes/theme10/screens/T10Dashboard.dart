import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme10/models/T10Models.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10Constant.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10DataGenerator.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10SliderWidget.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10Strings.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10Widget.dart';

import '../../../main.dart';

class T10Dashboard extends StatefulWidget {
  static String tag = '/T10Dashboard';

  @override
  T10DashboardState createState() => T10DashboardState();
}

class T10DashboardState extends State<T10Dashboard> {
  var currentIndexPage = 0;
  late List<T10Images> mSliderList;
  late List<T10Product> mDashboardList;

  @override
  void initState() {
    super.initState();
    mSliderList = getDashboard();
    mDashboardList = getDashboardProducts();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            T10TopBar(theme10_title_dashboard),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: spacing_standard_new),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: T10CarouselSlider(
                        viewportFraction: 0.9,
                        height: MediaQuery.of(context).size.height,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        items: mSliderList.map((slider) {
                          return Builder(
                            builder: (BuildContext context) {
                              return ClipRRect(
                                borderRadius: new BorderRadius.circular(12.0),
                                child: CachedNetworkImage(
                                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                  imageUrl: slider.img,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height* 0.9,
                                ),
                              );
                            },
                          );
                        }).toList(),
                        onPageChanged: (index) {
                          setState(() {
                            currentIndexPage = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: spacing_large),
                    Container(
                      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                      color: appStore.scaffoldBackground,
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mDashboardList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
                                child: CachedNetworkImage(
                                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                  imageUrl: mDashboardList[index].img,
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              text(mDashboardList[index].name, textColor: appStore.textPrimaryColor, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                              Row(
                                children: <Widget>[
                                  text(
                                    mDashboardList[index].price,
                                    textColor: appStore.textSecondaryColor,
                                  ),
                                  SizedBox(
                                    width: spacing_control,
                                  ),
                                  text(mDashboardList[index].subPrice, textColor: appStore.textSecondaryColor, lineThrough: true)
                                ],
                              )
                            ],
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
