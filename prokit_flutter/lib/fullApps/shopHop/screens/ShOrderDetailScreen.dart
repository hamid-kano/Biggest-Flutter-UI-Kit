import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShOrder.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShExtension.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

// ignore: must_be_immutable
class ShOrderDetailScreen extends StatefulWidget {
  static String tag = '/ShOrderDetailScreen';
  ShOrder? order;

  ShOrderDetailScreen({this.order});

  @override
  ShOrderDetailScreenState createState() => ShOrderDetailScreenState();
}

class ShOrderDetailScreenState extends State<ShOrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var item = Container(
      color: sh_itemText_background,
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              "images/shophop/img/products" + widget.order!.item!.image!,
              width: width * 0.3,
              height: width * 0.35,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: spacing_standard,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: text(widget.order!.item!.name, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: spacing_control),
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                                padding: EdgeInsets.all(spacing_control_half),
                                child: Icon(
                                  Icons.done,
                                  color: sh_white,
                                  size: 16,
                                ),
                              ),
                              SizedBox(
                                width: spacing_standard_new,
                              ),
                              text("M", textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
                          child: text("Total item- 1"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              text(widget.order!.item!.price.toString().toCurrencyFormat(), textColor: sh_colorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
                              SizedBox(
                                width: spacing_control,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3.0),
                                child: Text(
                                  "0".toString().toCurrencyFormat()!,
                                  style: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeSMedium, decoration: TextDecoration.lineThrough),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    var orderStatus = Container(
      height: width * 0.32,
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(border: Border.all(color: sh_view_color, width: 1.0)),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 4.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
                ),
                Expanded(
                  child: VerticalDivider(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 4.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              width: spacing_standard_new,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  text(widget.order!.order_date! + "\n Order Placed", maxLine: 2, fontSize: textSizeMedium, textColor: sh_textColorPrimary),
                  text("Order Pending", fontSize: textSizeMedium, textColor: sh_textColorPrimary),
                ],
              ),
            )
          ],
        ),
      ),
    );
    var paymentDetail = Container(
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
      decoration: BoxDecoration(border: Border.all(color: sh_view_color, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new, spacing_middle, spacing_standard_new, spacing_middle),
            child: text(sh_lbl_payment_details, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
          ),
          Divider(
            height: 1,
            color: sh_view_color,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new, spacing_middle, spacing_standard_new, spacing_middle),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    text(sh_lbl_offer),
                    text(sh_text_offer_not_available, textColor: sh_textColorPrimary, fontFamily: fontMedium),
                  ],
                ),
                SizedBox(
                  height: spacing_standard,
                ),
                Row(
                  children: <Widget>[
                    text(sh_lbl_shipping_charge),
                    text(sh_lbl_free, textColor: Colors.green, fontFamily: fontMedium),
                  ],
                ),
                SizedBox(
                  height: spacing_standard,
                ),
                Row(
                  children: <Widget>[
                    text(sh_lbl_total_amount),
                    text("\$70", textColor: sh_colorPrimary, fontFamily: fontBold, fontSize: textSizeLargeMedium),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
    var shippingDetail = Container(
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
      decoration: BoxDecoration(border: Border.all(color: sh_view_color, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new, spacing_middle, spacing_standard_new, spacing_middle),
            child: text(sh_lbl_shipping_details, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
          ),
          Divider(
            height: 1,
            color: sh_view_color,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new, spacing_middle, spacing_standard_new, spacing_middle),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    text(sh_lbl_order_id),
                    text(widget.order!.order_number, textColor: sh_textColorPrimary, fontFamily: fontMedium),
                  ],
                ),
                SizedBox(
                  height: spacing_standard,
                ),
                Row(
                  children: <Widget>[
                    text(sh_lbl_order_date),
                    text(widget.order!.order_date, textColor: sh_textColorPrimary, fontFamily: fontMedium),
                  ],
                ),
                SizedBox(
                  height: spacing_standard,
                ),
                Row(
                  children: <Widget>[
                    text(sh_lbl_total_amount),
                    text("\$70", textColor: sh_colorPrimary, fontFamily: fontBold, fontSize: textSizeLargeMedium),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        title: text(sh_lbl_my_orders, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontBold),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            item,
            orderStatus,
            shippingDetail,
            paymentDetail,
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
