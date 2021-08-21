import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryAddPayment.dart';
import 'GroceryChangePassword.dart';
import 'GroceryDeliveryAddress.dart';
import 'GroceryRecipientDetail.dart';

class GroceryProfile extends StatefulWidget {
  static String tag = '/GroceryProfile';

  @override
  _GroceryProfileState createState() => _GroceryProfileState();
}

class _GroceryProfileState extends State<GroceryProfile> {
  late List<GroceryProfileModel> profileList;

  @override
  // ignore: must_call_super
  void initState() {
    profileList = groceryProfileList();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: grocery_app_background,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              padding: EdgeInsets.all(spacing_standard_new),
              color: grocery_color_white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(radius: width * 0.11, backgroundImage: CachedNetworkImageProvider(grocery_ic_user1)),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text("Ishan", fontSize: textSizeNormal, fontFamily: fontMedium).paddingOnly(left: spacing_standard, right: spacing_standard),
                      text("ish.maduskha@gmail.com", textColor: grocery_textColorSecondary).paddingOnly(left: spacing_standard, right: spacing_standard),
                      text("0718786729", textColor: grocery_textColorSecondary).paddingOnly(left: spacing_standard, right: spacing_standard)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_standard_new),
            Container(
              decoration: boxDecoration(radius: 10.0, bgColor: grocery_color_white),
              padding: EdgeInsets.only(left: spacing_standard, right: spacing_standard, top: spacing_standard),
              child: ListView.builder(
                itemCount: profileList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        GroceryRecipientDetail().launch(context);
                      } else if (index == 1) {
                        GroceryDeliveryAddress().launch(context);
                      } else if (index == 2) {
                        GroceryAddPaymentScreen().launch(context);
                      } else if (index == 3) {
                        GroceryChangePassword().launch(context);
                      } else if (index == 4) {
                        showLogoutBottomSheetDialog(context);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 45,
                              width: 45,
                              decoration: boxDecoration(radius: 25.0, bgColor: profileList[index].color),
                              child: Image.asset(
                                profileList[index].icon,
                                height: 10,
                                width: 10,
                                color: grocery_color_white,
                              ).paddingAll(12),
                            ).paddingOnly(top: spacing_control, left: spacing_standard, bottom: spacing_control),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text(profileList[index].title, fontFamily: fontMedium).paddingOnly(left: spacing_standard, right: spacing_standard),
                                  Icon(Icons.keyboard_arrow_right, size: index == 4 ? 0 : 25, color: grocery_textColorSecondary).paddingOnly(right: spacing_standard)
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider().paddingOnly(bottom: spacing_control).visible(index != 4),
                      ],
                    ),
                  );
                },
              ).paddingOnly(bottom: spacing_standard_new),
            ).paddingAll(spacing_standard_new)
          ],
        ),
      ),
    );
  }

  showLogoutBottomSheetDialog(context) async {
    var w = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          width: w,
          height: 200,
          decoration: BoxDecoration(
            color: grocery_color_white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: const Radius.circular(20.0)),
            boxShadow: <BoxShadow>[BoxShadow(color: grocery_ShadowColor, blurRadius: 20.0, offset: Offset(0.0, 0.9))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    decoration: boxDecoration(radius: 20.0, bgColor: grocery_Red_Color),
                    child: Image.asset(Grocery_ic_Logout, height: 10, width: 10, color: grocery_color_white).paddingAll(10),
                  ).paddingOnly(top: spacing_standard_new, left: spacing_standard_new),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(grocery_lbl_Logout, fontSize: textSizeLarge, fontFamily: fontMedium).paddingOnly(top: spacing_standard_new, left: spacing_standard, right: spacing_standard),
                        text(grocery_lbl_confirmation_for_logout, textColor: grocery_textColorSecondary, fontSize: textSizeMedium).paddingOnly(left: spacing_standard, right: spacing_standard)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: spacing_large),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: w * 0.15,
                    child: text("No", textColor: grocery_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium).onTap(() {
                      finish(context);
                    }),
                  ),
                  FittedBox(
                    child: groceryButton(
                      textContent: grocery_lbl_Logout,
                      bgColors: grocery_Red_Color,
                      onPressed: (() {
//                          GrocerySignUp(isSignIn: true,isSignUp: false,).launch(context);
                      }),
                    ),
                  ).paddingOnly(right: spacing_standard),
                ],
              ).paddingOnly(bottom: spacing_standard_new, right: spacing_standard),
              SizedBox(height: spacing_standard_new),
            ],
          ),
        );
      },
    );
  }
}
