import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/model/DTAddressListModel.dart';
import 'package:prokit_flutter/defaultTheme/model/DTProductModel.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTCartScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTReviewScreen.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTDataProvider.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTWidgets.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';
import 'DTAddressScreen.dart';
import 'DTDrawerWidget.dart';
import 'ReviewWidget.dart';

// ignore: must_be_immutable
class DTProductDetailScreen extends StatefulWidget {
  static String tag = '/DTProductDetailScreen';
  DTProductModel? productModel;

  DTProductDetailScreen({this.productModel});

  @override
  DTProductDetailScreenState createState() => DTProductDetailScreenState();
}

class DTProductDetailScreenState extends State<DTProductDetailScreen> {
  var discount = 0.0;

  DTAddressListModel? mSelectedAddress;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    if (widget.productModel != null) {
      if (widget.productModel!.price.validate() > widget.productModel!.discountPrice.validate()) {
        double mrp = widget.productModel!.price.validate().toDouble();
        double discountPrice = widget.productModel!.discountPrice.validate().toDouble();
        discount = (((mrp - discountPrice) / mrp) * 100);

        setState(() {});
      }
    } else {
      widget.productModel = getProducts()[2];
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget addToCartBtn() {
      return Container(
        height: 50,
        width: context.width() / 2,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: appStore.scaffoldBackground, boxShadow: defaultBoxShadow(spreadRadius: 3.0)),
        child: Text('Add to Cart', style: boldTextStyle()),
      ).onTap(() {
        toast('Added to cart');
        // Do your logic
      });
    }

    Widget buyNowBtn() {
      return Container(
        height: 50,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        alignment: Alignment.center,
        width: context.width() / 2,
        decoration: BoxDecoration(color: appColorPrimary, boxShadow: defaultBoxShadow()),
        child: Text('Buy Now', style: boldTextStyle(color: white)),
      ).onTap(() {
        // Do your logic
        DTCartScreen().launch(context);
      });
    }

    Widget buttonWidget() {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          addToCartBtn(),
          buyNowBtn(),
        ],
      );
    }

    Widget productDetail() {
      return Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.productModel!.name!, style: boldTextStyle(size: 18)),
              10.height,
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  priceWidget(widget.productModel!.discountPrice, fontSize: 28, textColor: appColorPrimary),
                  8.width,
                  priceWidget(widget.productModel!.price, applyStrike: true, fontSize: 18),
                  16.width,
                  Text('${discount.toInt()}% off', style: boldTextStyle(color: appColorPrimary)).visible(discount != 0.0),
                ],
              ),
              10.height,
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(color: appColorPrimary, borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                    child: Row(
                      children: [
                        Icon(Icons.star_border, color: Colors.white, size: 14),
                        8.width,
                        Text(widget.productModel!.rating.toString(), style: primaryTextStyle(color: white)),
                      ],
                    ),
                  ).onTap(() {
                    DTReviewScreen().launch(context);
                  }),
                  8.width,
                  Text('${Random.secure().nextInt(100).toString()} ratings', style: secondaryTextStyle(size: 16)).onTap(() {
                    DTReviewScreen().launch(context);
                  }),
                ],
              ),
            ],
          ).paddingAll(16),
          Divider(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Deliver to', style: primaryTextStyle()),
                      10.width,
                      Text(mSelectedAddress != null ? mSelectedAddress!.name.validate() : 'John Doe', style: boldTextStyle()).expand(),
                    ],
                  ).expand(),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(border: Border.all(color: appColorPrimary), borderRadius: BorderRadius.circular(3)),
                    child: Text('Change', style: primaryTextStyle()),
                  ).onTap(() async {
                    var res = await DTAddressScreen().launch(context);
                    if (res is DTAddressListModel) {
                      mSelectedAddress = res;

                      toast('Address Updated');
                    }

                    setState(() {});
                  }),
                ],
              ),
              4.height,
              Text(mSelectedAddress != null ? mSelectedAddress!.addressLine1.validate() : '4683 Stadium Drive, Cambridge, MA', style: secondaryTextStyle()),
              16.height,
              Divider(height: 0),
            ],
          ).paddingAll(16),
          settingItem(context, '\$10 Delivery in 2 days, Monday', leading: Icon(MaterialCommunityIcons.truck_delivery, color: appColorPrimary), textSize: 15, padding: 0.0, onTap: () {
            mMoreOfferBottomSheet(context);
          }),
          settingItem(context, '7 Days return policy', leading: Icon(FontAwesome.exchange, color: appColorPrimary, size: 18), textSize: 15, padding: 0.0, onTap: () {
            mMoreOfferBottomSheet(context);
          }),
          settingItem(context, 'Cash on Delivery', leading: Icon(MaterialIcons.attach_money, color: appColorPrimary), textSize: 15, padding: 0.0, onTap: () {
            mMoreOfferBottomSheet(context);
          }),
        ],
      );
    }

    Widget mobileWidget() {
      return Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: context.height() * 0.45,
                  child: Image.network(
                    widget.productModel!.image!,
                    width: context.width(),
                    height: context.height() * 0.45,
                    fit: BoxFit.cover,
                  ),
                ),
                10.height,
                productDetail(),
              ],
            ),
          ),
          Positioned(bottom: 0, child: buttonWidget()),
        ],
      );
    }

    Widget webWidget() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    16.height,
                    Container(
                      height: context.height() * 0.45,
                      margin: EdgeInsets.all(8),
                      child: Image.network(
                        widget.productModel!.image!,
                        width: context.width(),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    20.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        addToCartBtn().expand(flex: 20),
                        buyNowBtn().expand(flex: 20),
                      ],
                    ),
                  ],
                ),
              ).expand(flex: 40),
              VerticalDivider(width: 0),
              Container(
                decoration: boxDecoration(bgColor: appStore.scaffoldBackground),
                child: SingleChildScrollView(
                  child: productDetail(),
                ),
              ).expand(flex: 60),
            ],
          ),
          16.height,
          widget.productModel != null ? Text('${widget.productModel!.name.validate()} Reviews', style: boldTextStyle()).paddingAll(16) : SizedBox(),
          ReviewWidget(list: getReviewList()),
        ],
      );
    }

    return Scaffold(
      appBar: appBar(context, 'Detail'),
      drawer: DTDrawerWidget(),
      body: ContainerX(
        mobile: mobileWidget(),
        web: SingleChildScrollView(child: webWidget()),
        useFullWidth: true,
      ),
    );
  }
}

void mMoreOfferBottomSheet(BuildContext aContext) {
  showModalBottomSheet(
    context: aContext,
    backgroundColor: appStore.scaffoldBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (builder) {
      return SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(MaterialCommunityIcons.truck_delivery, color: appColorPrimary),
                  10.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\$10 Delivery in 2 days, Monday", style: boldTextStyle()),
                      4.height,
                      Text(
                        LoremText,
                        style: secondaryTextStyle(size: 14),
                        maxLines: 2,
                      ),
                    ],
                  ).expand()
                ],
              ),
              16.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(FontAwesome.exchange, color: appColorPrimary),
                  10.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("7 Days return policy", style: boldTextStyle()),
                      4.height,
                      Text(
                        LoremText,
                        style: secondaryTextStyle(size: 14),
                        maxLines: 2,
                      ),
                    ],
                  ).expand()
                ],
              ),
              16.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(MaterialIcons.attach_money, color: appColorPrimary),
                  10.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cash on Delivery", style: boldTextStyle()),
                      4.height,
                      Text(
                        LoremText,
                        style: secondaryTextStyle(size: 14),
                        maxLines: 2,
                      ),
                    ],
                  ).expand()
                ],
              ),
              16.height,
            ],
          ),
        ),
      );
    },
  );
}
