import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusDataGenerator.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

import 'QIBusAddPassenger.dart';

class QIBusPickDrop extends StatefulWidget {
  static String tag = '/QIBusPickDrop';

  @override
  QIBusPickDropState createState() => QIBusPickDropState();
}

class QIBusPickDropState extends State<QIBusPickDrop> {
  int selectedPos = 1;
  late List<QIBusDroppingModel> mList;
  late List<QIBusDroppingModel> mList1;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mList = QIBusGetPickUp();
    mList1 = QIBusGetDroppingPoint();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: qIBus_app_background,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            title(QIBus_title_dropping, context),
            Container(
              width: width,
              decoration: boxDecoration(radius: spacing_middle, bgColor: qIBus_view_color, showShadow: false),
              margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                          QIBus_text_pickup_point,
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
                            QIBus_text_dropping_points,
                            isCentered: true,
                            textColor: selectedPos == 2 ? qIBus_white : qIBus_textHeader,
                          ),
                        )),
                    flex: 1,
                  ),
                ],
              ),
            ),
            selectedPos == 1
                ? Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPos = 2;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
                                decoration: boxDecoration(radius: spacing_middle, showShadow: true),
                                padding: EdgeInsets.all(spacing_middle),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        text(mList[index].travelName, fontFamily: fontMedium),
                                        text(mList[index].duration, fontFamily: fontMedium),
                                      ],
                                    ),
                                    text(mList[index].location, textColor: qIBus_textChild)
                                  ],
                                ),
                              ),
                            )))
                : Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mList1.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  QIBusAddPassenger().launch(context);
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
                                decoration: boxDecoration(radius: spacing_middle, showShadow: true),
                                padding: EdgeInsets.all(spacing_middle),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        text(mList1[index].travelName, fontFamily: fontMedium),
                                        text(mList1[index].duration, fontFamily: fontMedium),
                                      ],
                                    ),
                                    text(mList1[index].location, textColor: qIBus_textChild)
                                  ],
                                ),
                              ),
                            )),
                  ),
          ],
        )));
  }
}
