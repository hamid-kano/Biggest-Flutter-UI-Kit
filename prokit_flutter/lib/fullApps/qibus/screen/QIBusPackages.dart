import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';
import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusDataGenerator.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusSlider.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

import 'QIBusViewPackage.dart';
import 'package:nb_utils/nb_utils.dart';

class QIBusPackages extends StatefulWidget {
  static String tag = '/QIBusPackages';

  @override
  QIBusPackagesState createState() => QIBusPackagesState();
}

class QIBusPackagesState extends State<QIBusPackages> {
  var currentIndexPage = 0;

  late List<QIBusNewPackageModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = QIBusGetPackage();
  }

  Widget mHeading(var label, var subLabel) {
    return Container(
      margin: EdgeInsets.fromLTRB(spacing_standard_new, 0, spacing_standard_new, spacing_standard_new),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          text(label, fontFamily: fontMedium),
          GestureDetector(
            onTap: () {
              QIBusViewPackage().launch(context);
            },
            child: text(subLabel, textColor: qIBus_textChild),
          )
        ],
      ),
    );
  }

  Widget mPackages(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 30;
    final Size cardSize = Size(width, width * 0.71);

    return QiBusCarouselSlider(
      viewportFraction: 0.8,
      height: cardSize.height,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mList1.map((list) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: cardSize.height,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: boxDecoration(radius: spacing_middle, bgColor: qIBus_white, showShadow: true),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(spacing_middle), topLeft: Radius.circular(spacing_middle)),
                    child: CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                      imageUrl: list.image,
                      height: width * 0.32,
                      width: width,
                      fit: BoxFit.fill,
                    ),
                  ).expand(),
                  Padding(
                    padding: EdgeInsets.all(spacing_middle),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(list.destination, fontFamily: fontMedium),
                            text(list.newPrice, textColor: qIBus_colorPrimary),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(list.duration, textColor: qIBus_textChild),
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  qibus_ic_home_package,
                                  color: qIBus_icon_color,
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: spacing_control_half),
                                SvgPicture.asset(
                                  qibus_ic_bus,
                                  color: qIBus_icon_color,
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: spacing_control_half),
                                SvgPicture.asset(
                                  qibus_ic_restaurant,
                                  color: qIBus_icon_color,
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: spacing_control_half),
                                SvgPicture.asset(
                                  qibus_ic_wifi,
                                  color: qIBus_icon_color,
                                  width: 20,
                                  height: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                        RatingBar(
                          initialRating: 5,
                          minRating: 1,
                          itemSize: 16,
                          direction: Axis.horizontal,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(Icons.star, color: qIBus_rating),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ),
                  )
                ],
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qIBus_app_background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBar(QIBus_lbl_packages, icon: qibus_gif_bell, isVisible: false),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    mHeading(QIBus_txt_new_package, QIBus_txt_view_all),
                    mPackages(context),
                    SizedBox(height: spacing_standard_new),
                    mHeading(QIBus_txt_popular_package, QIBus_txt_view_all),
                    mPackages(context),
                    SizedBox(height: spacing_standard_new),
                    mHeading(QIBus_text_trending_packages, QIBus_txt_view_all),
                    mPackages(context),
                    SizedBox(height: spacing_standard_new),
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
