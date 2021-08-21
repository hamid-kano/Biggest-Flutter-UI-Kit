import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/grocery_trackOrder_model.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryTrackOrderScreen extends StatefulWidget {
  static String tag = '/GroceryTrackOrderScreen';

  @override
  _GroceryTrackOrderScreenState createState() => _GroceryTrackOrderScreenState();
}

class _GroceryTrackOrderScreenState extends State<GroceryTrackOrderScreen> {
  List<TrackOrder> listTrackOrder = trackOrder;

  @override
  Widget build(BuildContext context) {
    final trackOrder = ListView.builder(
        itemCount: listTrackOrder.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            decoration: boxDecoration(showShadow: true, radius: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      color: grocery_purpleLightColor,
                      child: Icon(
                        Icons.shopping_cart,
                        color: grocery_color_white,
                      ),
                    ).cornerRadiusWithClipRRect(25),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(
                            listTrackOrder[index].orderName,
                            fontSize: textSizeNormal,
                            fontFamily: fontMedium,
                          ).paddingOnly(bottom: 16),
                          text(
                            grocery_subtotal + ' ' + grocery_currency + ' ' + listTrackOrder[index].orderAmount,
                            fontSize: textSizeMedium,
                            fontFamily: fontMedium,
                          ),
                          text(grocery_totalItems + ': ' + listTrackOrder[index].totelItem, fontSize: textSizeMedium, fontFamily: fontMedium, textColor: textSecondaryColor)
                        ],
                      ).paddingOnly(left: 16, right: 16),
                    ),
                  ],
                ),
                Divider().paddingOnly(top: 8),
                Row(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    groceryButton(
                      textContent: grocery_trackOrders,
                      color: grocery_colorPrimary,
                      onPressed: (() {}),
                    ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
                  ],
                ).paddingOnly(top: 16)
              ],
            ).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
          ).paddingOnly(left: 16, right: 16, top: 16).onTap(() {});
        });

    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: AppBar(
        backgroundColor: grocery_colorPrimary,
        leading: Icon(
          Icons.clear,
          size: 30,
          color: grocery_color_white,
        ).onTap(() {
          finish(context);
        }),
        title: text(grocery_trackOrders, fontSize: textSizeNormal, textColor: grocery_color_white, fontFamily: fontBold),
      ),
      body: trackOrder,
    );
  }
}
