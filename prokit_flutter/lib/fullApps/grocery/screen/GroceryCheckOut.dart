import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/panel.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryPaymentMethod.dart';
import 'GroceryRecipient.dart';
import 'GrocerySaveCart.dart';
import 'GrocerySelectDeliveryType.dart';

class GroceryCheckOut extends StatefulWidget {
  static String tag = '/GroceryCheckOut';

  @override
  GroceryCheckOutState createState() => GroceryCheckOutState();
}

class GroceryCheckOutState extends State<GroceryCheckOut> {
  final double _initFabHeight = 90.0;
  double? fabHeight;
  double? _panelHeightOpen;

  @override
  void initState() {
    super.initState();
    fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(grocery_color_white);
    _panelHeightOpen = MediaQuery.of(context).size.height * .55;
    double _panelHeightClosed = MediaQuery.of(context).size.width * 0.2;
    var width = MediaQuery.of(context).size.width;

    Widget mIcon() {
      return Row(
        children: <Widget>[
          Container(width: 0.5, height: width * 0.1, color: grocery_view_color, margin: EdgeInsets.only(left: width * 0.06)),
          Container(height: 0.5, color: grocery_view_color, margin: EdgeInsets.only(left: width * 0.1, top: spacing_control, bottom: spacing_control)),
        ],
      );
    }

    Widget mTitle(var icon, var value, Widget tag, var subValue, var bgColors) {
      return GestureDetector(
        onTap: () {
          tag.launch(context);
        },
        child: Container(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: spacing_standard_new),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: bgColors),
                    width: width * 0.12,
                    height: width * 0.12,
                    padding: EdgeInsets.all(width * 0.03),
                    child: Image.asset(icon, color: grocery_color_white),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(value, fontFamily: fontMedium),
                      text(subValue, textColor: grocery_textColorSecondary),
                    ],
                  )
                ],
              ),
              Icon(Icons.keyboard_arrow_right, color: grocery_textColorSecondary)
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: Container(
          height: 100,
          color: grocery_color_white,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back, size: 30, color: grocery_icon_color).paddingOnly(top: spacing_standard_new),
                onPressed: () {
                  finish(context);
                },
              ),
              text("Checkout", fontSize: textSizeNormal, fontFamily: fontBold, isCentered: true).paddingOnly(left: spacing_standard, top: 26)
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: width,
                  color: Colors.white,
                  child: CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: grocery_ic_carts,
                    height: width * 0.38,
                    fit: BoxFit.contain,
                  ),
                ),
                text(grocery_title_checkout_details).paddingAll(spacing_standard_new),
                Container(
                  decoration: boxDecoration(showShadow: true, radius: 10.0),
                  padding: EdgeInsets.all(spacing_middle),
                  margin: EdgeInsets.only(right: spacing_standard_new, left: spacing_standard_new, bottom: spacing_standard_new),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      mTitle(Grocery_ic_User, grocery_lbl_recipient_details, GroceryRecipient(), grocery_username, grocery_purpleLightColor),
                      mIcon(),
                      mTitle(Grocery_ic_DeliveryTruck, grocery_lbl_delivery_pickup_info, GrocerySelectDeliveryType(), grocery_lbl_pickup_info, grocery_orangeLight_Color),
                      mIcon(),
                      mTitle(Grocery_ic_Dollar, grocery_lbl_payment_method, GroceryPaymentMethods(), grocery_lbl_payment_info, grocery_orangeColor),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SlidingUpPanel(
                maxHeight: _panelHeightOpen,
                minHeight: _panelHeightClosed,
                parallaxEnabled: true,
                parallaxOffset: .5,
                panelBuilder: (sc) => Container(
                  width: width,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: grocery_ShadowColor, blurRadius: 10, spreadRadius: 3)],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_standard_new), topRight: Radius.circular(spacing_standard_new)),
                    color: grocery_app_background,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(spacing_standard_new),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: spacing_standard_new),
                              decoration: BoxDecoration(shape: BoxShape.circle, color: grocery_colorPrimary),
                              padding: EdgeInsets.all(width * 0.02),
                              child: Icon(Icons.shopping_cart, color: grocery_color_white),
                            ),
                            Expanded(child: text(grocery_lbl_cart_summary, fontFamily: fontMedium, fontSize: textSizeNormal)),
                            Icon(Icons.keyboard_arrow_up),
                          ],
                        ),
                        SizedBox(height: spacing_standard_new),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(grocery_lbl_subtotal),
                            text(grocery_lbl_price, fontFamily: fontMedium),
                          ],
                        ),
                        SizedBox(height: spacing_control),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(grocery_lbl_promotion_discount, textColor: grocery_textColorSecondary),
                            text(grocery_lbl_promotion_discount_price, textColor: grocery_textColorSecondary),
                          ],
                        ),
                        Container(width: width, height: 0.5, color: grocery_view_color, margin: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(grocery_lbl_delivery_charges, textColor: grocery_textColorSecondary),
                            text(grocery_lbl_delivery_charges_value, textColor: grocery_textColorSecondary),
                          ],
                        ),
                        SizedBox(height: spacing_control),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(grocery_lbl_total),
                            text(grocery_lbl_price, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                          ],
                        ),
                        SizedBox(height: spacing_standard_new),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(bottom: spacing_standard_new),
                            width: width * 0.3,
                            child: groceryButton(
                              textContent: grocery_lbl_pay_now,
                              onPressed: (() {
                                GrocerySaveCart().launch(context);
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
                onPanelSlide: (double pos) => setState(() {
                  fabHeight = pos * (_panelHeightOpen! - _panelHeightClosed) + _initFabHeight;
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
