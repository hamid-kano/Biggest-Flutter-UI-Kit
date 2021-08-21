import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShProduct.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShExtension.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShWidget.dart';

import 'ShProductDetail.dart';

class ShOffersScreen extends StatefulWidget {
  static String tag = '/ShOffersScreen';

  @override
  ShOffersScreenState createState() => ShOffersScreenState();
}

class ShOffersScreenState extends State<ShOffersScreen> {
  List<ShProduct> mProductModel = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var products = await loadProducts();
    List<ShProduct> offers = [];
    products.forEach((product) {
      if (product.on_sale!) {
        offers.add(product);
      }
    });
    setState(() {
      mProductModel.clear();
      mProductModel.addAll(offers);
    });
  }

  @override
  Widget build(BuildContext context) {
    final gridView = Container(
      child: GridView.builder(
          itemCount: mProductModel.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(spacing_middle),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 9 / 13, crossAxisSpacing: spacing_middle, mainAxisSpacing: spacing_standard_new),
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                ShProductDetail(product: mProductModel[index]).launch(context);
              },
              child: Container(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 9 / 11,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(border: Border.all(color: sh_view_color, width: 0.5)),
                            child: Image.asset(
                              "images/shophop/img/products" + mProductModel[index].images![0].src!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(spacing_control),
                            margin: EdgeInsets.all(spacing_standard),
                            decoration: BoxDecoration(shape: BoxShape.circle, color: sh_white),
                            child: Icon(
                              Icons.favorite_border,
                              color: sh_textColorPrimary,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: <Widget>[
                        text(mProductModel[index].on_sale! ? mProductModel[index].sale_price.toString().toCurrencyFormat() : mProductModel[index].price.toString().toCurrencyFormat(),
                            textColor: sh_colorPrimary, fontFamily: fontMedium, fontSize: textSizeNormal),
                        SizedBox(
                          width: spacing_control,
                        ),
                        Text(
                          mProductModel[index].regular_price.toString().toCurrencyFormat()!,
                          style: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeSMedium, decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        title: text(sh_lbl_my_offers, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
        actionsIconTheme: IconThemeData(color: sh_colorPrimary),
        actions: <Widget>[cartIcon(context, 3)],
      ),
      body: gridView,
    );
  }
}
