import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusDataGenerator.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

class QIBusBooking extends StatefulWidget {
  @override
  QIBusBookingState createState() => QIBusBookingState();
}

class QIBusBookingState extends State<QIBusBooking> {
  int selectedPos = 1;
  late List<QIBusBookingModel> mList;
  late List<QIBusBookingModel> mList1;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mList = QIBusGetBook();
    mList1 = QIBusGetCancelBook();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: qIBus_app_background,
        body: Column(
          children: <Widget>[
            TopBar(
              QIBus_lbl_booking,
              icon: qibus_gif_bell,
              isVisible: false,
            ),
            Container(
              width: width,
              decoration: boxDecoration(radius: spacing_middle, bgColor: qIBus_view_color, showShadow: false),
              margin: EdgeInsets.only(right: spacing_standard_new, left: spacing_standard_new),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPos = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_middle), bottomLeft: Radius.circular(spacing_middle)),
                          color: selectedPos == 1 ? qIBus_colorPrimary : Colors.transparent,
                          border: Border.all(color: selectedPos == 1 ? qIBus_colorPrimary : Colors.transparent),
                        ),
                        child: text(
                          QIBus_text_booked,
                          isCentered: true,
                          textColor: selectedPos == 1 ? qIBus_white : qIBus_textHeader,
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Flexible(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPos = 2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(spacing_middle), bottomRight: Radius.circular(spacing_middle)),
                            color: selectedPos == 2 ? qIBus_colorPrimary : Colors.transparent,
                            border: Border.all(color: selectedPos == 2 ? qIBus_colorPrimary : Colors.transparent),
                          ),
                          child: text(
                            QIBus_txt_cancelled,
                            isCentered: true,
                            textColor: selectedPos == 2 ? qIBus_white : qIBus_textHeader,
                          ),
                        )),
                    flex: 1,
                  ),
                ],
              ),
            ),
            if (selectedPos == 1)
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Booking(mList[index], index);
                    }),
              ),
            if (selectedPos == 2)
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mList1.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CancelBooking(mList1[index], index);
                    }),
              ),
          ],
        ));
  }
}

class Booking extends StatefulWidget {
  final QIBusBookingModel model;

  Booking(this.model, int index);

  @override
  BookingState createState() => new BookingState(model);
}

class BookingState extends State<Booking> {
  bool visibility = false;
  late QIBusBookingModel model;

  void _changed() {
    setState(() {
      visibility = !visibility;
    });
  }

  BookingState(QIBusBookingModel model) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
      decoration: boxDecoration(showShadow: true, bgColor: qIBus_white, radius: spacing_middle),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(spacing_middle),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(model.destination, fontFamily: fontMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(model.duration, textColor: qIBus_textChild),
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(text: model.totalFare, style: TextStyle(fontSize: textSizeMedium, color: qIBus_color_check)),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Icon(
                              Icons.check_circle_outline,
                              color: qIBus_color_check,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: visibility,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
                      color: qIBus_view_color,
                      child: Padding(
                        padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(model.startTime),
                            Container(
                              height: 0.5,
                              width: width * 0.2,
                              color: qIBus_dark_gray,
                            ),
                            Column(
                              children: <Widget>[
                                SvgPicture.asset(
                                  qibus_ic_bus,
                                  width: 20,
                                  height: 20,
                                  color: qIBus_colorPrimary,
                                ),
                                text(model.totalTime)
                              ],
                            ),
                            Container(
                              height: 0.5,
                              width: width * 0.2,
                              color: qIBus_dark_gray,
                            ),
                            text(model.endTime),
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(spacing_middle),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ticketInfo(QIBus_text_seat_no, model.seatNo),
                                  ticketInfo(QIBus_txt_ticket_no, model.ticketNo),
                                  ticketInfo(QIBus_lbl_pnr_no, model.pnrNo),
                                  ticketInfo(QIBus_lbl_total_fare, model.status),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: CachedNetworkImage(
                                placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                imageUrl: model.img,
                                height: width * 0.25,
                                width: width * 0.25,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            _changed();
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.keyboard_arrow_up,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            replacement: GestureDetector(
              onTap: () {
                _changed();
              },
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: qIBus_icon_color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CancelBooking extends StatefulWidget {
  final QIBusBookingModel model;

  CancelBooking(this.model, int index);

  @override
  CancelBookingState createState() => new CancelBookingState(model);
}

class CancelBookingState extends State<CancelBooking> {
  bool visibility = false;
  late QIBusBookingModel model;

  void _changed() {
    setState(() {
      visibility = !visibility;
    });
  }

  CancelBookingState(QIBusBookingModel model) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
      decoration: boxDecoration(showShadow: true, bgColor: qIBus_white, radius: spacing_middle),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(spacing_middle),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(model.destination, fontFamily: fontMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(model.duration, textColor: qIBus_textChild),
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(text: model.totalFare, style: TextStyle(fontSize: textSizeMedium, color: qIBus_red)),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Icon(
                              Icons.cancel,
                              color: qIBus_red,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: visibility,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
                      color: qIBus_view_color,
                      child: Padding(
                        padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(model.startTime),
                            Column(
                              children: <Widget>[
                                SvgPicture.asset(
                                  qibus_ic_bus,
                                  width: 20,
                                  height: 20,
                                  color: qIBus_colorPrimary,
                                ),
                                text(model.totalTime)
                              ],
                            ),
                            text(model.endTime),
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(spacing_middle),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ticketInfo(QIBus_text_seat_no, model.seatNo),
                                  ticketInfo(QIBus_txt_ticket_no, model.ticketNo),
                                  ticketInfo(QIBus_lbl_pnr_no, model.pnrNo),
                                  ticketInfo(QIBus_lbl_total_fare, model.status),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: CachedNetworkImage(
                                placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                imageUrl: model.img,
                                height: width * 0.25,
                                width: width * 0.25,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            _changed();
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.keyboard_arrow_up,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            replacement: GestureDetector(
              onTap: () {
                _changed();
              },
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: qIBus_icon_color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget ticketInfo(var label, var value) {
  return Row(
    children: <Widget>[
      Expanded(
        child: text(label),
        flex: 2,
      ),
      Expanded(
        child: text(value, textColor: qIBus_colorPrimary),
        flex: 3,
      ),
    ],
  );
}
