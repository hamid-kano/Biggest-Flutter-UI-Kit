import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';
import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusDataGenerator.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

import 'QIBusSelectSeat.dart';

class QIBusSearchList extends StatefulWidget {
  static String tag = '/QIBusSearchList';

  @override
  QIBusSearchListState createState() => QIBusSearchListState();
}

class QIBusSearchListState extends State<QIBusSearchList> {
  String selectedValue = 'High';
  var now = new DateTime.now();
  var todayDate = DateTime.now();
  var formatter = new DateFormat('dd - MMM - yyyy');
  String? formatted;

  late List<QIBusModel> mList;

  @override
  void initState() {
    super.initState();
    mList = QIBusGetBusList();
    formatted = formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: qIBus_app_background,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(color: qIBus_colorPrimary, height: 70),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.width * 0.15,
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: qIBus_white,
                                  ),
                                  onPressed: () {
                                    finish(context);
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(spacing_standard, 0, 0, 0),
                                  child: text(QIBus_text_bus_list, textColor: qIBus_white, fontSize: textSizeNormal, fontFamily: fontBold),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => CustomDialog(),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: spacing_standard_new,
                                ),
                                child: Icon(
                                  Icons.filter_list,
                                  size: 25,
                                  color: qIBus_white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
                        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: qIBus_app_background),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
                        padding: EdgeInsets.all(spacing_standard_new),
                        decoration: boxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  formatted = formatter.format(todayDate.subtract(Duration(days: 1)));
                                  todayDate = todayDate.subtract(Duration(days: 1));
                                });
                              },
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                color: qIBus_icon_color,
                              ),
                            ),
                            text(formatted, fontFamily: fontMedium),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  formatted = formatter.format(todayDate.add(Duration(days: 1)));
                                  todayDate = todayDate.add(Duration(days: 1));
                                });
                              },
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: qIBus_icon_color,
                              ),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: mList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BusList(mList[index], index);
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class BusList extends StatelessWidget {
  late QIBusModel model;

  BusList(QIBusModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        QIBusSelectSeat().launch(context);
      },
      child: Container(
        decoration: boxDecoration(radius: spacing_middle, bgColor: qIBus_white, showShadow: true),
        margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
        padding: EdgeInsets.all(spacing_middle),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: boxDecoration(showShadow: false, bgColor: qIBus_colorPrimary, radius: spacing_standard),
                  padding: EdgeInsets.fromLTRB(spacing_standard_new, 1, spacing_standard_new, 1),
                  child: text(model.travelerName, textColor: qIBus_white, fontSize: textSizeSMedium),
                ),
                text(model.typeCoach, textColor: qIBus_textChild),
              ],
            ),
            SizedBox(
              height: spacing_standard,
            ),
            Padding(
              padding: EdgeInsets.only(right: spacing_standard_new, left: spacing_standard_new),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      text(
                        model.startTime,
                        fontFamily: fontMedium,
                      ),
                      text(model.mStartTimeAA, textColor: qIBus_textChild),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          child: Opacity(
                            opacity: 0.2,
                            child: CachedNetworkImage(
                              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                              imageUrl: qibus_ic_map,
                              fit: BoxFit.cover,
                              width: width * 0.4,
                              height: width * 0.2,
                            ),
                          )),
                      Row(
                        children: <Widget>[
                          Icon(Icons.keyboard_arrow_up),
                          Container(
                            width: width * 0.1,
                            height: 0.5,
                            color: qIBus_colorPrimary,
                          ),
                          Column(
                            children: <Widget>[
                              text(QIBus_text_duration, textColor: qIBus_textChild, fontSize: textSizeSMedium),
                              Container(
                                decoration: boxDecoration(showShadow: false, bgColor: qIBus_colorPrimary, radius: spacing_standard),
                                padding: EdgeInsets.fromLTRB(spacing_standard_new, 1, spacing_standard_new, 1),
                                child: text(model.totalDuration, textColor: qIBus_white, fontSize: textSizeSMedium),
                              ),
                              text(model.hold, textColor: qIBus_textChild, fontSize: textSizeSMedium),
                            ],
                          ),
                          Container(
                            width: width * 0.1,
                            height: 0.5,
                            color: qIBus_colorPrimary,
                          ),
                          Icon(Icons.keyboard_arrow_up),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      text(
                        model.endTime,
                        fontFamily: fontMedium,
                      ),
                      text(model.mEndTimeAA, textColor: qIBus_textChild),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                    text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Icon(
                          Icons.star,
                          color: qIBus_rating,
                          size: 16,
                        ),
                      ),
                    ),
                    TextSpan(text: model.rate.toString(), style: TextStyle(fontSize: textSizeMedium, color: qIBus_textChild)),
                  ],
                )),
                text(model.price, textColor: qIBus_colorPrimary, fontSize: textSizeLargeMedium)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  String selectedValue = QIBus_lbl_ac;
  var _value = 0.0;

  return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          GestureDetector(
            onTap: () {
              finish(context);
            },
            child: Container(alignment: Alignment.centerRight, child: Icon(Icons.close, color: qIBus_icon_color)),
          ),
          SizedBox(height: 16),
          text(
            QIBus_title_price,
            fontFamily: fontMedium,
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[100],
              trackShape: RoundedRectSliderTrackShape(),
              trackHeight: 4.0,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              thumbColor: Colors.redAccent,
              overlayColor: Colors.red.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
              tickMarkShape: RoundSliderTickMarkShape(),
              activeTickMarkColor: Colors.red[700],
              inactiveTickMarkColor: Colors.red[100],
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.redAccent,
              valueIndicatorTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            child: Slider(
              value: _value,
              min: 0,
              max: 100,
              divisions: 10,
              label: '$_value',
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: spacing_standard),
          view(),
          SizedBox(height: spacing_standard_new),
          text(
            QIBus_lbl_rating,
            fontFamily: fontMedium,
          ),
          SizedBox(height: spacing_standard),
          RatingBar(
            initialRating: 5,
            minRating: 1,
            direction: Axis.horizontal,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(height: spacing_standard_new),
          view(),
          SizedBox(height: spacing_standard_new),
          text(
            QIBus_lbl_bus_tpe,
            fontFamily: fontMedium,
          ),
          DropdownButton<String>(
            items: <String>[QIBus_lbl_ac, QIBus_lbl_non_ac, QIBus_lbl_normal].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: text(value, textColor: qIBus_textHeader, fontSize: textSizeMedium, fontFamily: fontRegular),
              );
            }).toList(),
            //hint:Text(selectedValue),
            value: selectedValue,
            onChanged: (newVal) {},
          ),
          SizedBox(height: spacing_standard_new),
          QIBusAppButton(
            textContent: QIBus_lbl_apply,
            onPressed: () {},
          ),
        ],
      ));
}
