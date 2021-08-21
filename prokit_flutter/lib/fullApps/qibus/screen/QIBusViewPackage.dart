import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';
import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusDataGenerator.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

class QIBusViewPackage extends StatefulWidget {
  static String tag = '/QIBusViewPackage';

  @override
  QIBusViewPackageState createState() => QIBusViewPackageState();
}

class QIBusViewPackageState extends State<QIBusViewPackage> {
  late List<QIBusNewPackageModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = QIBusGetPackage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qIBus_app_background,
      body: Column(
        children: <Widget>[
          TopBar(QIBus_lbl_packages, icon: qibus_gif_bell, isVisible: true),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList1.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ViewPackage(mList1[index], index);
                  }),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ViewPackage extends StatelessWidget {
  late QIBusNewPackageModel model;

  ViewPackage(QIBusNewPackageModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: boxDecoration(radius: spacing_middle, bgColor: qIBus_white, showShadow: true),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(spacing_middle), topLeft: Radius.circular(spacing_middle)),
            child: Image.network(
              model.image,
              height: width * 0.32,
              width: width,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(spacing_middle),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[text(model.destination, fontFamily: fontMedium), text(model.newPrice, textColor: qIBus_colorPrimary)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(model.duration, textColor: qIBus_textChild),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          qibus_ic_home_package,
                          color: qIBus_icon_color,
                        ),
                        SizedBox(
                          width: spacing_control_half,
                        ),
                        SvgPicture.asset(
                          qibus_ic_bus,
                          color: qIBus_icon_color,
                        ),
                        SizedBox(
                          width: spacing_control_half,
                        ),
                        SvgPicture.asset(
                          qibus_ic_restaurant,
                          color: qIBus_icon_color,
                        ),
                        SizedBox(
                          width: spacing_control_half,
                        ),
                        SvgPicture.asset(
                          qibus_ic_wifi,
                          color: qIBus_icon_color,
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
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: qIBus_rating,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
