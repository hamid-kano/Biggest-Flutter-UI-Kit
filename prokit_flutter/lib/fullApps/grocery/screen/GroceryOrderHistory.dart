import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/grocery_compleated_model.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryTrackOrder.dart';

class GroceryOrderHistoryScreen extends StatefulWidget {
  static String tag = '/GroceryOrderHistoryScreen';

  @override
  _GroceryOrderHistoryScreenState createState() => _GroceryOrderHistoryScreenState();
}

class _GroceryOrderHistoryScreenState extends State<GroceryOrderHistoryScreen> {
  List<Compleated> listCompleated = compleated;

  @override
  Widget build(BuildContext context) {
    final compleated = ListView.builder(
        itemCount: listCompleated.length,
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
                      color: grocery_colorPrimary,
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
                            listCompleated[index].orderDate,
                            fontSize: textSizeNormal,
                            fontFamily: fontMedium,
                          ).paddingOnly(bottom: 16),
                          text(
                            grocery_subtotal + ' ' + grocery_currency + ' ' + listCompleated[index].orderAmount,
                            fontSize: textSizeMedium,
                            fontFamily: fontMedium,
                          ),
                          text(grocery_totalItems + ': ' + listCompleated[index].totelItem, fontSize: textSizeMedium, fontFamily: fontMedium, textColor: textSecondaryColor)
                        ],
                      ).paddingOnly(left: 16, right: 16),
                    ),
                    Icon(
                      Icons.delete_outline,
                      color: grocery_textColorSecondary,
                    ),
                  ],
                ),
                Divider().paddingOnly(top: 8),
                Row(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    button(context, grocery_viewCart, backgroundColor: grocery_textColorSecondary, height: 40, width: 150),
                  ],
                ).paddingOnly(top: 16)
              ],
            ).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
          ).paddingOnly(left: 16, right: 16, top: 16).onTap(() {
            GroceryTrackOrderScreen().launch(context);
          });
        });

    return Scaffold(
      backgroundColor: grocery_app_background,
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(125),
              child: Container(
                  color: grocery_colorPrimary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.clear,
                            size: 30,
                            color: grocery_color_white,
                          ).paddingOnly(right: 24).onTap(() {
                            finish(context);
                          }),
                          Expanded(child: text(grocery_orderHistory, fontSize: textSizeNormal, textColor: grocery_color_white, fontFamily: fontBold)),
                          Icon(
                            Icons.search,
                            size: 30,
                            color: grocery_color_white,
                          ),
                        ],
                      ).paddingOnly(left: 12, right: 16),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: TabBar(
                            indicatorWeight: 4.0,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: grocery_color_white,
                            labelColor: grocery_color_white,
                            isScrollable: true,
                            unselectedLabelColor: grocery_color_white.withOpacity(0.5),
                            tabs: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Text(
                                  grocery_completed,
                                  style: TextStyle(fontSize: textSizeMedium),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Text(
                                  grocery_upComming,
                                  style: TextStyle(fontSize: textSizeMedium),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Text(
                                  grocery_cancelled,
                                  style: TextStyle(fontSize: textSizeMedium),
                                ),
                              )
                            ],
                          ),
                        ),
                      ).paddingOnly(top: 22),
                    ],
                  )),
            ),
            body: TabBarView(
              children: <Widget>[compleated, compleated, compleated],
            ),
          ),
        ),
      ),
    );
  }
}
