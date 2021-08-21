import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

import 'QIBusPayment.dart';
import 'package:nb_utils/nb_utils.dart';

class QIBusAddPassenger extends StatefulWidget {
  static String tag = '/QIBusAddPassenger';

  @override
  QIBusAddPassengerState createState() => QIBusAddPassengerState();
}

class QIBusAddPassengerState extends State<QIBusAddPassenger> {
  Widget mLabel(var label) {
    return Row(
      children: <Widget>[
        Padding(padding: const EdgeInsets.fromLTRB(10, 0, 10, 0), child: text(label, fontFamily: fontMedium)),
      ],
    );
  }

  Widget mInput(var label, var subLabel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: text(label, textColor: qIBus_textChild),
          ),
          Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                isDense: true,
                hintText: subLabel,
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }

  bool visibility = false;

  void changed() {
    setState(() {
      visibility = !visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? _selectedLocation = 'Female';

    return Scaffold(
        backgroundColor: qIBus_app_background,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              title(QIBus_title_passenger_detail, context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: spacing_standard_new, bottom: spacing_standard_new, right: spacing_standard_new),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: boxDecoration(
                            showShadow: true,
                            bgColor: qIBus_white,
                            radius: spacing_middle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(spacing_standard, spacing_standard, spacing_standard, spacing_standard_new),
                            child: Column(
                              children: <Widget>[
                                mLabel(QIBus_text_contact_information),
                                SizedBox(height: spacing_standard),
                                mInput(QIBus_lbl_email, QIBus_hint_enter_your_emailId),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                  child: view(),
                                ),
                                SizedBox(height: 8),
                                mInput(QIBus_text_phone, QIBus_hint_mobile),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: spacing_standard_new),
                          decoration: boxDecoration(
                            showShadow: true,
                            bgColor: qIBus_white,
                            radius: spacing_middle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(spacing_standard, spacing_standard, spacing_standard, spacing_standard_new),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[mLabel(QIBus_txt_passenger), text(QIBus_text_seat + " L1", textColor: qIBus_colorPrimary)],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: spacing_middle,
                                ),
                                editTextStyle(QIBus_hint_enter_name),
                                SizedBox(
                                  height: spacing_middle,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: editTextStyle(QIBus_hint_enter_age),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: qIBus_view_color,
                                                  width: 0.5,
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(spacing_middle))),
                                            child: DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                              value: _selectedLocation,
                                              items: <String>['Female', 'Male'].map((String value) {
                                                return new DropdownMenuItem<String>(
                                                  value: value,
                                                  child: text(value, fontSize: textSizeLargeMedium, textColor: qIBus_textChild),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedLocation = newValue;
                                                });
                                              },
                                            )))),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: spacing_standard_new,
                        ),
                        QIBusAppButton(
                          textContent: QIBus_text_done,
                          onPressed: () {
                            QIBusPayment().launch(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
