import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/model/DTAddressListModel.dart';
import 'package:prokit_flutter/defaultTheme/model/DTProductModel.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTAddressScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTPaymentScreen.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTDataProvider.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTWidgets.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import 'CartListView.dart';
import 'DTDrawerWidget.dart';

// ignore: must_be_immutable
class DTOrderSummaryScreen extends StatefulWidget {
  static String tag = '/DTOrderSummaryScreen';
  List<DTProductModel> data;

  DTOrderSummaryScreen(this.data);

  @override
  DTOrderSummaryScreenState createState() => DTOrderSummaryScreenState();
}

class DTOrderSummaryScreenState extends State<DTOrderSummaryScreen> {
  var expectedDelivery = '';

  //List<DTProductModel> data = getCartProducts();

  int subTotal = 0;
  int totalAmount = 0;
  int shippingCharges = 0;
  int mainCount = 0;

  String? name = 'Austin';
  String? address = '381, Shirley St. Munster, New York';
  String? address2 = 'United States - 10005';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    DateTime dateTime = DateTime.now();
    expectedDelivery = '${dateTime.day + 2} ${getMonth(dateTime.month)}, ${dateTime.year}';

    calculate();
  }

  calculate() async {
    subTotal = 0;
    shippingCharges = 0;
    totalAmount = 0;

    widget.data.forEach((element) {
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
    Widget addressView() {
      return Container(
        padding: EdgeInsets.all(8),
        decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(name!, style: boldTextStyle(size: 18)),
                    10.width,
                    Container(
                      child: Text('Home', style: secondaryTextStyle()),
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(color: Theme.of(context).dividerColor.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
                    ),
                  ],
                ),
                Icon(Icons.phone, color: appColorPrimary).onTap(() {
                  launch('tel:+913972847376');
                }),
              ],
            ),
            Text(address!, style: primaryTextStyle()),
            Text(address2!, style: primaryTextStyle()),
            6.height,
            Text('Change', style: secondaryTextStyle()).onTap(() async {
              DTAddressListModel? data = await DTAddressScreen().launch(context);

              if (data != null) {
                name = data.name;
                address = data.addressLine1;
                address2 = data.addressLine2;

                setState(() {});
              }
            }),
          ],
        ),
      );
    }

    Widget itemTitle() {
      return Row(
        children: [
          Divider().expand(),
          10.width,
          Text('Items', style: boldTextStyle(), maxLines: 1).center(),
          10.width,
          Divider().expand(),
        ],
      );
    }

    Widget deliveryDateAndPayBtn() {
      return Column(
        children: [
          Row(
            children: [
              Icon(Feather.truck, size: 26, color: appColorPrimary),
              10.width,
              Text('Expected Delivery - $expectedDelivery', style: boldTextStyle(), maxLines: 1).expand(),
            ],
          ),
          20.height,
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appColorPrimary),
            child: Text('Continue to Pay', style: boldTextStyle(color: white)),
          ).onTap(() {
            DTPaymentScreen().launch(context);
          }),
        ],
      ).paddingAll(8);
    }

    Widget mobileWidget() {
      return SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addressView(),
                20.height,
                itemTitle(),
                8.height,
              ],
            ).paddingAll(8),
            CartListView(mIsEditable: false, isOrderSummary: true),
            Divider(height: 20),
            deliveryDateAndPayBtn(),
          ],
        ),
      );
    }

    Widget webWidget() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  16.height,
                  addressView(),
                  16.height,
                  itemTitle(),
                  16.height,
                  CartListView(mIsEditable: false, isOrderSummary: true),
                ],
              ),
            ),
          ).expand(flex: 60),
          VerticalDivider(width: 0),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                20.height,
                totalAmountWidget(subTotal, shippingCharges, totalAmount),
                Divider(height: 20),
                deliveryDateAndPayBtn(),
              ],
            ),
          ).expand(flex: 40),
        ],
      );
    }

    return Scaffold(
      appBar: appBar(context, 'Order Summary'),
      drawer: DTDrawerWidget(),
      body: ContainerX(
        mobile: mobileWidget(),
        web: webWidget(),
      ),
    );
  }
}
