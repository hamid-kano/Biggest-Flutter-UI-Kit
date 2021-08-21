import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryGotQuestionScreen extends StatefulWidget {
  static String tag = '/GroceryGotQuestionScreen';

  @override
  _GroceryGotQuestionScreenState createState() => _GroceryGotQuestionScreenState();
}

class _GroceryGotQuestionScreenState extends State<GroceryGotQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grocery_color_white,
        elevation: 0.0,
        leading: Icon(
          Icons.clear,
          size: 30,
          color: grocery_lightGrey,
        ).onTap(() {
          finish(context);
        }),
        title: text(grocery_gotQuestion, fontSize: textSizeNormal, fontFamily: fontBold),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: boxDecorationDefault(),
          color: grocery_color_white,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: Grocery_ic_Profile,
                    height: 70,
                    width: 70,
                  ).cornerRadiusWithClipRRect(35),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(grocery_yourQuestion, fontSize: textSizeNormal, textColor: grocery_textColorPrimary),
                        text(grocery_questionAnswer, fontSize: textSizeMedium, textColor: grocery_textColorSecondary),
                      ],
                    ).paddingOnly(left: 8),
                  ),
                ],
              ).paddingOnly(left: 16, top: 8),
              EditText(
                text: grocery_typeQuestion,
                isPassword: false,
                keyboardType: TextInputType.text,
              ).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: text('0 of 50 ' + grocery_words, textColor: grocery_textColorSecondary),
                  ),
                  button(context, grocery_send)
                ],
              ).paddingOnly(left: 16, right: 16)
            ],
          ).paddingOnly(bottom: 16),
        ).cornerRadiusWithClipRRect(15).paddingOnly(bottom: 16),
      ),
    );
  }
}
