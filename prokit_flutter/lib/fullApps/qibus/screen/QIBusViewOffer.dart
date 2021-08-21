import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusDataGenerator.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

class QIBusViewOffer extends StatefulWidget {
  static String tag = '/QIBusViewOffer';

  @override
  QIBusViewOfferState createState() => QIBusViewOfferState();
}

class QIBusViewOfferState extends State<QIBusViewOffer> {
  late List<QIBusNewOfferModel> mOfferList;

  @override
  void initState() {
    super.initState();
    mOfferList = QIBusGetOffer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: qIBus_app_background,
        body: Column(
          children: <Widget>[
            TopBar(
              QIBus_text_offers,
              icon: qibus_gif_bell,
              isVisible: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mOfferList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewOffer(mOfferList[index], index);
                    }),
              ),
            )
          ],
        ));
  }
}

// ignore: must_be_immutable
class NewOffer extends StatelessWidget {
  late QIBusNewOfferModel model;

  NewOffer(QIBusNewOfferModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.7,
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
      decoration: boxDecoration(showShadow: true, bgColor: qIBus_white, radius: spacing_middle),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(spacing_middle),
                topLeft: Radius.circular(spacing_middle),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    color: model.color,
                    child: CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                      imageUrl: model.img,
                      height: width * 0.3,
                      fit: BoxFit.none,
                      width: width,
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              text(QIBus_lbl_use_code, fontFamily: fontMedium),
              SizedBox(
                width: spacing_control_half,
              ),
              text(model.useCode, textAllCaps: true, fontFamily: fontMedium),
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
