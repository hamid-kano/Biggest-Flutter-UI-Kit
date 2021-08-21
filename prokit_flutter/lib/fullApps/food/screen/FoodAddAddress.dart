import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodColors.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodString.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class FoodAddAddress extends StatefulWidget {
  static String tag = '/FoodAddAddress';

  @override
  FoodAddAddressState createState() => FoodAddAddressState();
}

class FoodAddAddressState extends State<FoodAddAddress> {
  String? _selectedLocation = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: food_white,
      appBar: appBar(context, food_lbl_add_address),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      foodEditTextStyle(food_hint_full_name),
                      SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          Expanded(child: foodEditTextStyle(food_hint_pin_code)),
                          SizedBox(width: 16),
                          Expanded(child: foodEditTextStyle(food_hint_city)),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          Expanded(child: foodEditTextStyle(food_hint_state)),
                          SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: food_view_color,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(40))),
                              width: MediaQuery.of(context).size.width,
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                value: _selectedLocation,
                                items: <String>['Home', 'Work'].map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style: primaryTextStyle(size: 16, color: food_textColorSecondary)),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedLocation = newValue;
                                  });
                                },
                              )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      foodEditTextStyle(food_hint_address),
                      SizedBox(height: 16),
                      foodEditTextStyle(food_hint_mobile_no),
                      SizedBox(height: 16),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(color: food_colorPrimary, borderRadius: BorderRadius.circular(50), boxShadow: defaultBoxShadow()),
                        child: Text(food_lbl_add_address, style: primaryTextStyle(color: food_white)).center(),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
