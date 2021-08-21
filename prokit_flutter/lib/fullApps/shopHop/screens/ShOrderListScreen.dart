import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShOrder.dart';
import 'package:prokit_flutter/fullApps/shopHop/screens/ShOrderDetailScreen.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShExtension.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class ShOrderListScreen extends StatefulWidget {
  static String tag = '/ShOrderListScreen';

  @override
  ShOrderListScreenState createState() => ShOrderListScreenState();
}

class ShOrderListScreenState extends State<ShOrderListScreen> {
  List<ShOrder> list = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var orders = await loadOrders();
    setState(() {
      list.clear();
      list.addAll(orders);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var listView = ListView.builder(
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShOrderDetailScreen(order: list[index])));
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(border: Border.all(color: sh_view_color, width: 1)),
                    child: Image.asset("images/shophop/img/products" + list[index].item!.image!, fit: BoxFit.cover, height: width * 0.35, width: width * 0.29),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(list[index].item!.name, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                        SizedBox(height: 4),
                        text(list[index].item!.price.toString().toCurrencyFormat(), textColor: sh_colorPrimary, fontFamily: fontMedium, fontSize: textSizeNormal),
                        SizedBox(
                          height: spacing_standard,
                        ),
                        Expanded(
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      width: spacing_standard,
                                      height: spacing_standard,
                                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
                                    ),
                                    Expanded(
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      width: spacing_standard,
                                      height: spacing_standard,
                                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      text(list[index].order_date! + "\n Order Placed", maxLine: 2, fontSize: textSizeSmall, textColor: sh_textColorPrimary),
                                      text("Order Pending", fontSize: textSizeSmall, textColor: sh_textColorPrimary),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        title: text(sh_lbl_my_orders, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontBold),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
      ),
      body: Container(width: width, child: listView),
    );
  }
}
