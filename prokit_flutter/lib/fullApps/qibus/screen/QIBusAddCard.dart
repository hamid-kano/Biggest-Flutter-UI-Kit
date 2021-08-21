import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

class QIBusAddCard extends StatefulWidget {
  static String tag = '/QIBusAddCard';

  @override
  QIBusAddCardState createState() => QIBusAddCardState();
}

class QIBusAddCardState extends State<QIBusAddCard> {
  Widget mLabel(var label) {
    return text(label, fontFamily: fontMedium);
  }

  bool passwordVisible = true;
  String _selectedLocation = '4';
  String _selectedLocation1 = '2020';
  List<String> month = <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
  List<String> year = <String>['2020', '2021', '2022', '2023', '2024', '2025', '2026', '2027', '2028'];

  Widget mSelection(var heading, List<String> list, String? value) {
    return Container(
        padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
        decoration: BoxDecoration(
            border: Border.all(
              color: qIBus_view_color,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
            color: qIBus_white),
        child: Row(
          children: <Widget>[
            text(heading, textColor: qIBus_textChild),
            SizedBox(
              width: spacing_standard_new,
            ),
            DropdownButtonHideUnderline(
                child: DropdownButton<String>(
              value: value,
              items: list.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: text(value, fontSize: textSizeMedium, textColor: qIBus_textChild),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ))
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qIBus_app_background,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          title(QIBus_text_add_card, context),
          Expanded(
            child: SingleChildScrollView(
                child: Container(
              margin: EdgeInsets.all(spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  mLabel(QIBus_hint_card_number),
                  SizedBox(
                    height: spacing_control,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: pinEditTextStyle("4324"),
                      ),
                      Expanded(
                        child: pinEditTextStyle("4324"),
                      ),
                      Expanded(
                        child: pinEditTextStyle("4324"),
                      ),
                      Expanded(
                        child: pinEditTextStyle("4324"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: spacing_standard_new,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      mSelection("Month", month, _selectedLocation),
                      SizedBox(
                        width: spacing_standard_new,
                      ),
                      mSelection("Year", year, _selectedLocation1),
                    ],
                  ),
                  SizedBox(
                    height: spacing_standard_new,
                  ),
                  mLabel(QIBus_text_card_holder_name),
                  SizedBox(
                    height: spacing_standard,
                  ),
                  editTextStyle(QIBus_text_card_holder_name),
                  SizedBox(
                    height: spacing_standard_new,
                  ),
                  mLabel(QIBus_text_cvv),
                  SizedBox(
                    height: spacing_control,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: TextFormField(
                        maxLines: 1,
                        inputFormatters: [new LengthLimitingTextInputFormatter(3), FilteringTextInputFormatter.digitsOnly],
                        obscureText: true,
                        style: TextStyle(
                          fontSize: textSizeMedium,
                          fontFamily: fontRegular,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(spacing_standard_new, 16, 4, 16),
                          hintText: QIBus_text_cvv,
                          filled: true,
                          fillColor: qIBus_white,
                          suffixIcon: new GestureDetector(
                            onTap: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            child: new Icon(
                              passwordVisible ? Icons.visibility : Icons.visibility_off,
                              color: qIBus_icon_color,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(spacing_middle),
                            borderSide: const BorderSide(color: qIBus_view_color, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(spacing_middle),
                            borderSide: const BorderSide(color: qIBus_view_color, width: 0.0),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: spacing_standard_new,
                  ),
                  mLabel(QIBus_text_offer_code),
                  SizedBox(
                    height: spacing_control,
                  ),
                  editTextStyle(QIBus_text_offer_code),
                  SizedBox(
                    height: spacing_standard_new,
                  ),
                  Container(
                    padding: EdgeInsets.all(spacing_standard_new),
                    decoration: boxDecoration(showShadow: true),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: text(QIBus_text_pickup_point, fontFamily: fontMedium),
                              flex: 2,
                            ),
                            Expanded(
                              child: text(QIBus_lbl_pickup1, textColor: qIBus_textChild),
                              flex: 2,
                            )
                          ],
                        ),
                        SizedBox(
                          height: spacing_standard,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: text(QIBus_text_dropping_points, fontFamily: fontMedium),
                              flex: 2,
                            ),
                            Expanded(
                              child: text(QIBus_lbl_dropping1, textColor: qIBus_textChild),
                              flex: 2,
                            )
                          ],
                        ),
                        SizedBox(
                          height: spacing_standard,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: text(QIBus_text_total_amount, fontFamily: fontMedium, textColor: qIBus_colorPrimary),
                              flex: 2,
                            ),
                            Expanded(
                              child: text(QIBus_lbl_price1, textColor: qIBus_colorPrimary),
                              flex: 2,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: spacing_standard_new,
                  ),
                  QIBusAppButton(
                    textContent: QIBus_text_ticket_book,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(),
                      );
                    },
                  ),
                ],
              ),
            )),
          )
        ],
      )),
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

Container pinEditTextStyle(var hintText, {var line = 1}) {
  return Container(
      margin: EdgeInsets.only(right: 8),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextFormField(
        maxLines: line,
        inputFormatters: [new LengthLimitingTextInputFormatter(4), FilteringTextInputFormatter.digitsOnly],
        style: TextStyle(
          fontSize: textSizeMedium,
          fontFamily: fontRegular,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(spacing_standard_new, 16, 4, 16),
          hintText: hintText,
          filled: true,
          fillColor: qIBus_white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(spacing_middle),
            borderSide: const BorderSide(color: qIBus_view_color, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(spacing_middle),
            borderSide: const BorderSide(color: qIBus_view_color, width: 0.0),
          ),
        ),
      ));
}

dialogContent(BuildContext context) {
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
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          SizedBox(height: spacing_large),
          Icon(
            Icons.check_circle,
            color: qIBus_color_check,
            size: 50,
          ),
          SizedBox(height: spacing_standard_new),
          text(QIBus_text_payment_success, fontFamily: fontMedium),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(QIBus_msg_success, style: secondaryTextStyle(color: qIBus_textChild, size: 16), textAlign: TextAlign.center),
          ),
          SizedBox(height: spacing_standard_new),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(spacing_standard_new), bottomRight: Radius.circular(spacing_standard_new)), color: qIBus_color_check),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle),
            child: text(QIBus_text_close, textColor: qIBus_white, fontFamily: fontMedium, isCentered: true),
          )
        ],
      ));
}
