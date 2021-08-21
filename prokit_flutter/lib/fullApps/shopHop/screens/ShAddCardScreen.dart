import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShPaymentCard.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShWidget.dart';

// ignore: must_be_immutable
class ShAddCardScreen extends StatefulWidget {
  static String tag = '/ShAddCardScreen';
  ShPaymentCard? paymentCard;

  ShAddCardScreen({this.paymentCard});

  @override
  ShAddCardScreenState createState() => ShAddCardScreenState();
}

class ShAddCardScreenState extends State<ShAddCardScreen> {
  var cvvCont = TextEditingController();
  var nameCont = TextEditingController();
  var cardNumberCont = TextEditingController();
  var months = ["", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
  var years = ["", "2020", "2021", "2022", "2023", "2024", "2025", "2026", "2027", "2028", "2029", "2030", "2031"];
  String? selectedMonth = "";
  String? selectedYear = "";

  @override
  void initState() {
    super.initState();
    if (widget.paymentCard != null) {
      setState(() {
        cvvCont.text = widget.paymentCard!.cvv;
        nameCont.text = widget.paymentCard!.holderName;
        cardNumberCont.text = widget.paymentCard!.cardNo;
        selectedMonth = widget.paymentCard!.month;
        selectedYear = widget.paymentCard!.year;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        title: text(sh_lbl_add_card, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontBold),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(spacing_standard_new),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              headingText(sh_hint_card_number),
              SizedBox(
                height: spacing_standard_new,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                maxLength: 16,
                controller: cardNumberCont,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                decoration: InputDecoration(
                    filled: false,
                    counterText: "",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(spacing_control)), borderSide: BorderSide(color: Colors.grey, width: 1)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(spacing_control)), borderSide: BorderSide(color: Colors.grey, width: 0))),
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        headingText("Month"),
                        SizedBox(
                          height: spacing_standard_new,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1), borderRadius: BorderRadius.all(Radius.circular(spacing_control))),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            value: selectedMonth,
                            isExpanded: true,
                            items: months.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: text(value, fontSize: textSizeMedium, textColor: sh_textColorPrimary),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedMonth = newValue;
                              });
                            },
                          ),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  SizedBox(
                    width: spacing_standard_new,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        headingText("Year"),
                        SizedBox(
                          height: spacing_standard_new,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1), borderRadius: BorderRadius.all(Radius.circular(spacing_control))),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            value: selectedYear,
                            isExpanded: true,
                            items: years.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: text(value, fontSize: textSizeMedium, textColor: sh_textColorPrimary),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedYear = newValue;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              headingText(sh_lbl_cvv),
              SizedBox(
                height: spacing_standard_new,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                controller: cvvCont,
                maxLength: 3,
                obscureText: true,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                decoration: InputDecoration(
                    filled: false,
                    counterText: "",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(spacing_control)), borderSide: BorderSide(color: Colors.grey, width: 1)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(spacing_control)), borderSide: BorderSide(color: Colors.grey, width: 0))),
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              headingText(sh_hint_card_holder_name),
              SizedBox(
                height: spacing_standard_new,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: false,
                controller: nameCont,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                decoration: InputDecoration(
                    filled: false,
                    counterText: "",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(spacing_control)), borderSide: BorderSide(color: Colors.grey, width: 1)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(spacing_control)), borderSide: BorderSide(color: Colors.grey, width: 0))),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                // height: double.infinity,
                child: MaterialButton(
                  padding: EdgeInsets.all(spacing_standard),
                  child: text(sh_lbl_add_card, fontSize: textSizeNormal, fontFamily: fontMedium, textColor: sh_white),
                  textColor: sh_white,
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                  color: sh_colorPrimary,
                  onPressed: () => {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
