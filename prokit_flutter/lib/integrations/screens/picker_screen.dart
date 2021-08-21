import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/integrations/utils/common.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/integrations/utils/constants.dart';
import 'package:prokit_flutter/integrations/utils/styles.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart' as aw;

class PickerScreen extends StatefulWidget {
  static String tag = '/PickerScreen';

  @override
  PickerScreenState createState() => PickerScreenState();
}

class PickerScreenState extends State<PickerScreen> {
  var mSelectedDate = '';
  DateTime selectedDate = DateTime.now();
  Color? pickerColor = appStore.textPrimaryColor;
  var mSelectedColor = '';

  var mSelectedAddress = '';

  Future<Null> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget? child) {
          return aw.CustomTheme(child: child);
        });
    setState(() {
      if (picked != null && picked != selectedDate) selectedDate = picked;
      mSelectedDate = DateFormat.yMMMd().format(selectedDate.toLocal());
    });
  }

  Future pickColor(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor!,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: text("Pick"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
      mSelectedColor = intToHex(pickerColor!.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);
//TODO Without NullSafety Geo coder
/*    getLocation() async {
      var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      var coordinates = Coordinates(position.latitude, position.longitude);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      print("$addresses : ${first.addressLine}");
      setState(() {
        mSelectedAddress = first.addressLine;
      });
    }*/

    return Scaffold(
      appBar: appBar(context, "Pickers"),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: text("Date Selection Picker:", textColor: appColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: text(mSelectedDate.isEmpty ? "Select your date" : mSelectedDate, textColor: mSelectedDate.isEmpty ? appStore.textSecondaryColor : appStore.textPrimaryColor)),
                    GestureDetector(
                      onTap: () {
                        selectDate(context);
                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          decoration: BoxDecoration(color: appColorPrimary, borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                          child: textPrimary('Pick Date', aFontFamily: fontMedium)),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(
                height: 0.5,
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: text("Your Location Picker:", textColor: appColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: text(mSelectedAddress.isEmpty ? "Your Address" : mSelectedAddress, textColor: mSelectedAddress.isEmpty ? appStore.textSecondaryColor : appStore.textPrimaryColor, maxLine: 5),
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  //getLocation();
                },
                child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    decoration: BoxDecoration(
                        color: appColorPrimary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    child: textPrimary('Pick Your Current Location', aFontFamily: fontMedium)),
              ),
              SizedBox(height: 20),
              Divider(
                height: 0.5,
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: text("Color Picker:", textColor: appColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: pickerColor, border: Border.all(color: thirdColor, width: 3)),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          text("Color Code :", textColor: pickerColor, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                          SizedBox(
                            width: 4,
                          ),
                          Text(mSelectedColor, style: primaryTextStyle(color: pickerColor))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          pickColor(context);
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 16, right: 16),
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                            decoration: BoxDecoration(
                                color: appColorPrimary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            child: textPrimary('Pick Color', aFontFamily: fontMedium)),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Divider(
                height: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
