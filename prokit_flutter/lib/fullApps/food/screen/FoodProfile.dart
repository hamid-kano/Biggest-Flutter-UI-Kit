import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodColors.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodImages.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodString.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class FoodProfile extends StatefulWidget {
  static String tag = '/FoodProfile';

  @override
  FoodProfileState createState() => FoodProfileState();
}

class FoodProfileState extends State<FoodProfile> {
  @override
  Widget build(BuildContext context) {
    //changeStatusColor(food_app_background);
    String? _selectedLocation = 'Female';
    return Scaffold(
      backgroundColor: food_white,
      appBar: appBar(context, food_lbl_profile),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    16.height,
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        CircleAvatar(backgroundImage: CachedNetworkImageProvider(food_ic_user1), radius: 50),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: food_white),
                          width: 30,
                          height: 30,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(4),
                            child: Icon(Icons.edit, size: 20),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[Expanded(child: foodEditTextStyle(food_hint_first_name)), SizedBox(width: 16), Expanded(child: foodEditTextStyle(food_hint_last_name))],
                          ),
                          SizedBox(height: 16),
                          Container(
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
                              items: <String>['Female', 'Male'].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value, style: primaryTextStyle(size: 12)),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue;
                                });
                              },
                            )),
                          ),
                          SizedBox(height: 16),
                          foodEditTextStyle(food_hint_mobile_no),
                          SizedBox(height: 16),
                          foodEditTextStyle(food_hint_email),
                          SizedBox(height: 16),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: food_colorPrimary, borderRadius: BorderRadius.circular(50), boxShadow: defaultBoxShadow()),
                            child: Text(
                              food_lbl_save_profile.toUpperCase(),
                              style: primaryTextStyle(color: white),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
