import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShProduct.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShExtension.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';

class ShWishlistFragment extends StatefulWidget {
  static String tag = '/ShProfileFragment';

  @override
  ShWishlistFragmentState createState() => ShWishlistFragmentState();
}

class ShWishlistFragmentState extends State<ShWishlistFragment> {
  List<ShProduct> list = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var products = await loadProducts();
    setState(() {
      list.clear();
      list.addAll(products);
    });
  }

  Future<List<ShProduct>> loadProducts() async {
    String jsonString = await loadContentAsset('assets/shophop_data/wishlist_products.json');
    final jsonResponse = json.decode(jsonString);
    return (jsonResponse as List).map((i) => ShProduct.fromJson(i)).toList();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 70),
          itemBuilder: (context, index) {
            return Container(
              color: sh_itemText_background,
              margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset(
                      "images/shophop/img/products" + list[index].images![0].src!,
                      width: width * 0.25,
                      height: width * 0.3,
                      fit: BoxFit.fill,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: spacing_standard,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: text(list[index].name, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: text(list[index].regular_price.toString().toCurrencyFormat(), textColor: sh_colorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.add_shopping_cart,
                                          color: sh_textColorPrimary,
                                          size: 16,
                                        ),
                                        text(sh_lbl_move_to_cart, textColor: sh_textColorPrimary, fontSize: textSizeSMedium)
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.delete_outline,
                                          color: sh_textColorPrimary,
                                          size: 16,
                                        ),
                                        text(sh_lbl_remove, textColor: sh_textColorPrimary, fontSize: textSizeSMedium)
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.center,
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
            );
            // return Chats(mListings[index], index);
          }),
    );
  }
}
