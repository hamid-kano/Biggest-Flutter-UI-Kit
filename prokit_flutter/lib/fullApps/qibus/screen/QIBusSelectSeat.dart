import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/screen/QIBusPickDrop.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusDataGenerator.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class QIBusSelectSeat extends StatefulWidget {
  static String tag = '/QIBusSelectSeat';

  @override
  QIBusSelectSeatState createState() => QIBusSelectSeatState();
}

class QIBusSelectSeatState extends State<QIBusSelectSeat> {
  late List<QIBusSeatModel> mlist;

  @override
  void initState() {
    super.initState();
    mlist = QIBusSeat();
  }

  Widget seat(var seatColor, var label) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(spacing_middle), topLeft: Radius.circular(spacing_middle)), color: seatColor),
          height: MediaQuery.of(context).size.width * 0.08,
          width: MediaQuery.of(context).size.width * 0.08,
        ),
        text(label, textColor: seatColor, fontSize: textSizeSMedium)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qIBus_app_background,
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              title(QIBus_text_select_bus, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  seat(qIBus_view_color, QIBus_text_available),
                  seat(qIBus_textChild, QIBus_text_booked),
                  seat(qIBus_colorPrimary, QIBus_text_selected),
                  seat(qIBus_pink, QIBus_text_ladies),
                ],
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              Container(
                margin: EdgeInsets.only(right: spacing_large),
                alignment: Alignment.topRight,
                child: SvgPicture.asset(qibus_ic_icon),
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(spacing_standard_new),
                          bottomRight: Radius.circular(spacing_standard_new),
                        ),
                        color: qIBus_view_color,
                      ),
                      padding: EdgeInsets.all(spacing_standard),
                      child: (Column(
                        children: <Widget>[
                          text("Hold"),
                          SizedBox(
                            height: spacing_standard_new,
                          ),
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
                          )
                        ],
                      )),
                    ),
                    SizedBox(
                      width: spacing_large,
                    ),
                    Expanded(
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                        ),
                        itemCount: mlist.length,
                        itemBuilder: (context, index) {
                          if (index % 5 == 0 || index % 5 == 1 || index % 5 == 3 || index % 5 == 4) {
                            //for even row
                            return QIBusSeatSelection(mlist[index], index);
                          } else {
                            //for odd row
                            return Container(
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(spacing_middle), topLeft: Radius.circular(spacing_middle)), color: qIBus_app_background),
                              padding: EdgeInsets.all(0.0),
                              height: 35,
                              width: 35,
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: mBookNow(context),
          )
        ],
      )),
    );
  }
}

class QIBusSeatSelection extends StatefulWidget {
  final QIBusSeatModel model;
  final int index;

  QIBusSeatSelection(this.model, this.index);

  @override
  QIBusSeatSelectionState createState() => new QIBusSeatSelectionState(model, index);
}

class QIBusSeatSelectionState extends State<QIBusSeatSelection> {
  bool visibility = false;
  late QIBusSeatModel model;

  Widget mSeat(var color) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(spacing_middle), topLeft: Radius.circular(spacing_middle)), color: color),
      padding: EdgeInsets.all(0.0),
      height: 30,
      width: 30,
    );
  }

  void _changed() {
    setState(() {
      visibility = !visibility;
    });
  }

  int? index;

  QIBusSeatSelectionState(QIBusSeatModel model, int index) {
    this.model = model;
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: visibility,
          child: GestureDetector(
            onTap: () {
              _changed();
            },
            child: Column(
              children: <Widget>[
                if (model.flag == 1 || model.flag == 3)
                  Column(
                    children: <Widget>[
                      mSeat(qIBus_colorPrimary),
                      text("L" + index.toString(), fontSize: textSizeSMedium),
                    ],
                  ),
                if (model.flag == 2)
                  Column(
                    children: <Widget>[
                      mSeat(qIBus_dark_gray),
                    ],
                  )
              ],
            ),
          ),
          replacement: GestureDetector(
            onTap: () {
              _changed();
            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                if (model.flag == 1) mSeat(qIBus_view_color),
                if (model.flag == 2) mSeat(qIBus_dark_gray),
                if (model.flag == 3) mSeat(qIBus_pink),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

Widget mBookNow(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.23,
    decoration: boxDecoration(showShadow: true, radius: 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(spacing_large, spacing_standard, spacing_large, spacing_standard),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  text(QIBus_text_ticket_price, fontFamily: fontMedium),
                  text(QIBus_text_500, fontFamily: fontMedium),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  text(QIBus_text_tax, fontFamily: fontMedium),
                  text(QIBus_text_5txt, fontFamily: fontMedium),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  text(QIBus_text_total_price, fontFamily: fontMedium, textColor: qIBus_colorPrimary),
                  text("\$445", fontFamily: fontMedium, textColor: qIBus_colorPrimary),
                ],
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            QIBusPickDrop().launch(context);
          },
          child: Container(
            decoration: BoxDecoration(color: qIBus_colorPrimary),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle),
            child: text(QIBus_text_close, textColor: qIBus_white, fontFamily: fontMedium, isCentered: true),
          ),
        ).expand()
      ],
    ),
  );
}
