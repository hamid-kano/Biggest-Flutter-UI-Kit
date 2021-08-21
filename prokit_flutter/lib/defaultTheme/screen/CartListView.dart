import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/model/DTProductModel.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTDataProvider.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTWidgets.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';
import 'DTOrderSummaryScreen.dart';
import 'DTProductDetailScreen.dart';

// ignore: must_be_immutable
class CartListView extends StatefulWidget {
  static String tag = '/CartListView';

  bool? mIsEditable;
  bool? isOrderSummary;

  CartListView({this.mIsEditable, this.isOrderSummary});

  @override
  CartListViewState createState() => CartListViewState();
}

class CartListViewState extends State<CartListView> {
  List<DTProductModel> data = getCartProducts();

  int subTotal = 0;
  int totalAmount = 0;
  int shippingCharges = 0;
  int mainCount = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    calculate();
  }

  calculate() async {
    subTotal = 0;
    shippingCharges = 0;
    totalAmount = 0;

    data.forEach((element) {
      subTotal += (element.discountPrice ?? element.price)! * element.qty!;
    });

    shippingCharges = (subTotal * 10).toInt() ~/ 100;
    totalAmount = subTotal + shippingCharges;

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget itemCart(DTProductModel data, int index) {
      return Container(
        decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor!),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.network(
                data.image!,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ).cornerRadiusWithClipRRect(8),
            ),
            12.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.name!, style: primaryTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
                4.height,
                Row(
                  children: [
                    priceWidget(data.discountPrice),
                    8.width,
                    priceWidget(data.price, applyStrike: true),
                  ],
                ),
                8.height,
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(4),
                    backgroundColor: appColorPrimaryDark,
                  ),
                  padding: EdgeInsets.all(4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.remove, color: whiteColor).onTap(() {
                        var qty = data.qty!;
                        if (qty <= 1) return;
                        var q = qty - 1;
                        data.qty = q;

                        calculate();
                      }),
                      6.width,
                      Text(data.qty.toString(), style: boldTextStyle(color: whiteColor)),
                      6.width,
                      Icon(Icons.add, color: whiteColor).onTap(() {
                        mainCount = data.qty! + 1;
                        data.qty = mainCount;

                        calculate();
                      }),
                    ],
                  ),
                ).visible(widget.mIsEditable.validate(value: true)),
              ],
            ).expand(),
          ],
        ),
      );
    }

    Widget cartItemList() {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, index) {
          DTProductModel data1 = data[index];

          return itemCart(data1, index).onTap(() {
            DTProductDetailScreen(productModel: data1).launch(context);
          });
        },
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      );
    }

    return ContainerX(
      mobile: Column(
        children: [
          totalItemCountWidget(data.length),
          SingleChildScrollView(child: cartItemList()),
          20.height,
          totalAmountWidget(subTotal, shippingCharges, totalAmount),
        ],
      ),
      web: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: SingleChildScrollView(child: cartItemList()),
          ).expand(flex: 60),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(8),
            decoration: boxDecoration(showShadow: true, bgColor: appStore.scaffoldBackground),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                totalAmountWidget(subTotal, shippingCharges, totalAmount).visible(widget.mIsEditable!),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appColorPrimary),
                  child: Text('Checkout', style: boldTextStyle(color: white)),
                ).onTap(() {
                  DTOrderSummaryScreen(data).launch(context);
                }).visible(widget.mIsEditable!),
              ],
            ),
          ).expand(flex: 40).visible(!widget.isOrderSummary!),
        ],
      ),
    );
  }
}
