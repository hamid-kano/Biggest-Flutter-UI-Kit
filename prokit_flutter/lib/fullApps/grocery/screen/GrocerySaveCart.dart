import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryCheckOut.dart';

class GrocerySaveCart extends StatefulWidget {
  static String tag = '/GrocerySaveCart';

  @override
  GrocerySaveCartState createState() => GrocerySaveCartState();
}

class GrocerySaveCartState extends State<GrocerySaveCart> {
  late List<CartModel> mList;

  @override
  void initState() {
    super.initState();
    mList = saveCartItem();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(grocery_colorPrimary);
    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: title(grocery_lbl_save_cart, grocery_colorPrimary, grocery_color_white, context),
      ),
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: mList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SaveCart(mList[index], index);
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SaveCart extends StatelessWidget {
  late CartModel model;

  SaveCart(CartModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget? mRemoveItem() {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: IntrinsicHeight(
                  child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_large), topRight: Radius.circular(spacing_large)), color: grocery_color_white),
                height: MediaQuery.of(context).size.height / 2.8,
                padding: EdgeInsets.all(spacing_standard_new),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: spacing_standard_new, top: spacing_middle),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: grocery_color_red),
                          padding: EdgeInsets.all(width * 0.02),
                          child: Icon(
                            Icons.delete,
                            color: grocery_color_white,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(grocery_lbl_remove_saved_item, fontFamily: fontMedium, fontSize: textSizeNormal),
                              text(grocery_lbl_remove_confirmation, textColor: grocery_textColorSecondary, isLongText: true),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: spacing_large,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        text("$grocery_lbl_no", textColor: grocery_textColorSecondary, textAllCaps: true, fontFamily: fontMedium),
                        SizedBox(
                          width: spacing_standard_new,
                        ),
                        Container(
                            width: width * 0.35,
                            child: groceryButton(
                              textContent: grocery_lbl_remove,
                              onPressed: (() {}),
                              bgColors: grocery_color_red,
                            ))
                      ],
                    )
                  ],
                ),
              )),
            );
          });
    }

    return Container(
      decoration: boxDecoration(showShadow: true, radius: 10.0),
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
      padding: EdgeInsets.all(spacing_middle),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: spacing_standard_new, top: spacing_middle),
                decoration: BoxDecoration(shape: BoxShape.circle, color: grocery_colorPrimary),
                padding: EdgeInsets.all(width * 0.02),
                child: Icon(
                  Icons.shopping_cart,
                  color: grocery_color_white,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(
                          model.name,
                          fontSize: textSizeLargeMedium,
                          fontFamily: fontMedium,
                        ),
                        IconButton(
                          onPressed: () {
                            mRemoveItem();
                          },
                          icon: Icon(
                            Icons.delete_outline,
                            color: grocery_icon_color,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        text(
                          grocery_msg_subtotal,
                          fontFamily: fontMedium,
                        ),
                        SizedBox(
                          width: spacing_control_half,
                        ),
                        text(
                          grocery_lbl_rs + " " + model.price,
                          fontFamily: fontMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        text(
                          grocery_lbl_total_items,
                          fontFamily: fontMedium,
                        ),
                        SizedBox(
                          width: spacing_control_half,
                        ),
                        text(
                          model.totalItem,
                          fontFamily: fontMedium,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            width: width,
            height: 0.5,
            color: grocery_view_color,
            margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              text("$grocery_lbl_view_cart", textColor: grocery_textColorSecondary, textAllCaps: true, fontFamily: fontMedium),
              SizedBox(width: spacing_standard_new),
              FittedBox(
                child: groceryButton(
                  textContent: grocery_lbl_checkout,
                  onPressed: (() {
                    GroceryCheckOut().launch(context);
                  }),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
