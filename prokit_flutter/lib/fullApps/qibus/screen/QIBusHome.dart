import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/screen/QIBusNotification.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusDataGenerator.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

import 'QIBusSearhList.dart';
import 'QIBusViewOffer.dart';

class QIBusHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QIBusHomeState();
  }
}

class QIBusHomeState extends State<QIBusHome> {
  var isSelected = 0;
  late List<QIBusBookingModel> mRecentList;
  late List<QIBusNewOfferModel> mOfferList;
  var now = new DateTime.now();
  var count = 1;
  var formatter = new DateFormat('dd - MMM - yyyy');
  String? formatted;

  @override
  void initState() {
    super.initState();
    mRecentList = QIBusGetData();
    mOfferList = QIBusGetOffer();
    formatted = formatter.format(now);
  }

  Widget mToolbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        text(QIBus_home, textColor: qIBus_white, fontFamily: fontBold, fontSize: textSizeLargeMedium),
        GestureDetector(
          onTap: () {
            QIBusNotification().launch(context);
          },
          child: Image(
            image: AssetImage(qibus_gif_bell),
            height: 25,
            width: 25,
            color: qIBus_white,
          ),
        )
      ],
    );
  }

  var mTopSearch = Row(
    children: <Widget>[
      Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: qIBus_colorPrimary, border: Border.all(width: 0, color: qIBus_colorPrimary)),
            width: 20,
            height: 20,
          ),
          Container(
            height: 30,
            width: 0.5,
            color: qIBus_colorPrimary,
          ),
          SvgPicture.asset(
            qibus_ic_pin,
            color: qIBus_colorPrimary,
          ),
        ],
      ),
      SizedBox(width: spacing_standard_new),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            homeEditTextStyle(QIBus_hint_from_city),
            view(),
            homeEditTextStyle(QIBus_hint_to_city),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: qIBus_colorPrimary, border: Border.all(width: 0, color: qIBus_colorPrimary)),
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Image.asset(
            qibus_ic_wrap,
            color: qIBus_white,
            width: 20,
            height: 20,
          ),
        ),
      )
    ],
  );

  Widget mOption(var icon, var name, var pos) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = pos;
        });
      },
      child: Column(
        children: <Widget>[
          SizedBox(height: spacing_standard),
          SvgPicture.asset(icon, color: isSelected == pos ? qIBus_colorPrimary : qIBus_icon_color, height: 18, width: 18),
          SizedBox(height: 4),
          text(name, fontSize: textSizeSmall, textColor: isSelected == pos ? qIBus_colorPrimary : qIBus_textChild)
        ],
      ),
    );
  }

  Widget mSelection(var date) {
    return Stack(
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.width * 0.25,
            margin: EdgeInsets.only(left: 16, right: 16),
            decoration: boxDecoration(radius: 8, bgColor: qIBus_white, showShadow: true),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      text(QIBus_text_when_you_want_to_go, textColor: qIBus_textChild),
                      SizedBox(height: spacing_standard),
                      GestureDetector(
                        onTap: () {},
                        child: RichText(
                            text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SvgPicture.asset(
                                  qibus_ic_calender,
                                  color: qIBus_icon_color,
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                            TextSpan(text: date, style: TextStyle(fontFamily: fontMedium, fontSize: textSizeMedium, color: qIBus_colorPrimary)),
                          ],
                        )),
                      )
                    ],
                  ),
                ).expand(),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 6, 8, 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_drop_up,
                        color: qIBus_icon_color,
                      ).onTap(() {
                        setState(() {
                          count = count + 1;
                        });
                      }),
                      text("$count", textColor: qIBus_colorPrimary),
                      count == 1
                          ? Icon(Icons.arrow_drop_down, color: qIBus_white)
                          : Icon(
                              Icons.arrow_drop_down,
                              color: qIBus_icon_color,
                            ).onTap(() {
                              setState(() {
                                if (count == 1 || count < 1) {
                                  count = 1;
                                } else {
                                  count = count - 1;
                                }
                              });
                            }),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    QIBusSearchList().launch(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.25,
                    decoration: boxDecoration(bgColor: qIBus_colorPrimary, radius: 10.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.search,
                        color: qIBus_white,
                      ),
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }

  var mRecentSearchLbl = Container(
    margin: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
    child: text(QIBus_text_recent_search, fontFamily: fontMedium),
  );

  Widget mNewOfferLbl() {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          text(QIBus_txt_new_offers, fontFamily: fontMedium),
          GestureDetector(
            onTap: () {
              QIBusViewOffer().launch(context);
            },
            child: text(QIBus_txt_view_all, textColor: qIBus_textChild),
          )
        ],
      ),
    );
  }

  Widget mRecentSearch(BuildContext context) {
    return SizedBox(
//      height: width * 0.4,
      height: 155,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mRecentList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return RecentSearch(mRecentList[index], index);
          }),
    );
  }

  Widget mOffer(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mOfferList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return NewOffer(mOfferList[index], index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(qIBus_colorPrimary);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: qIBus_app_background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              color: qIBus_colorPrimary,
              height: width * 0.3,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: mToolbar(),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      decoration: boxDecoration(radius: 8, bgColor: qIBus_white, showShadow: false),
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          mTopSearch,
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: spacing_standard_new, top: spacing_standard_new),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                mOption(qibus_ic_ac, QIBus_lbl_ac, 1),
                                mOption(qibus_ic_non_ac, QIBus_lbl_non_ac, 2),
                                mOption(qibus_ic_sleeper_icon, QIBus_lbl_sleeper, 3),
                                mOption(qibus_ic_seater, QIBus_lbl_seater, 4),
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  mSelection(formatted),
                  mRecentSearchLbl,
                  mRecentSearch(context),
                  mNewOfferLbl(),
                  mOffer(context),
                  SizedBox(height: 16),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

// ignore: must_be_immutable
class RecentSearch extends StatelessWidget {
  late QIBusBookingModel model;

  RecentSearch(QIBusBookingModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.7,
      decoration: boxDecoration(showShadow: true, bgColor: qIBus_white, radius: spacing_middle),
      margin: EdgeInsets.only(left: spacing_standard_new),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(spacing_middle, spacing_standard_new, spacing_standard_new, spacing_standard),
            child: RichText(
                text: TextSpan(
              children: [
                WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.only(right: spacing_middle),
                    child: SvgPicture.asset(
                      qibus_ic_bus,
                      color: qIBus_colorPrimary,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
                TextSpan(text: model.destination, style: TextStyle(fontSize: textSizeMedium, color: qIBus_textHeader, fontFamily: fontMedium)),
              ],
            )),
          ),
          SizedBox(
            height: spacing_control,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(spacing_middle, 0, spacing_standard_new, 14),
            child: text(model.duration, textColor: qIBus_textChild),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                padding: const EdgeInsets.all(0.0),
                textStyle: TextStyle(color: qIBus_white),
              ),
              onPressed: () {
                QIBusSearchList().launch(context);
              },
              child: Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: qIBus_colorPrimary),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      QIBus_text_book_now,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
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
      margin: EdgeInsets.only(left: spacing_standard_new),
      decoration: boxDecoration(showShadow: true, bgColor: qIBus_white, radius: spacing_middle),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(spacing_middle), topLeft: Radius.circular(spacing_middle)),
            child: Stack(
              children: <Widget>[
                Container(
                  color: model.color,
                  child: CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: model.img,
                    height: 130,
                    fit: BoxFit.none,
                    width: width,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
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
