import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/grocery_question_model.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryGotQuestion.dart';

class GroceryQuestionScreen extends StatefulWidget {
  static String tag = '/GroceryQuestionScreen';

  @override
  _GroceryQuestionScreenState createState() => _GroceryQuestionScreenState();
}

class _GroceryQuestionScreenState extends State<GroceryQuestionScreen> {
  List<Question> listQuestion = question;

  @override
  Widget build(BuildContext context) {
    final trackOrder = ListView.builder(
        itemCount: listQuestion.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            decoration: boxDecoration(showShadow: true, radius: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  listQuestion[index].question,
                  style: TextStyle(
                    fontSize: textSizeLargeMedium,
                    fontFamily: fontMedium,
                    color: grocery_textColorPrimary,
                  ),
                ).paddingOnly(bottom: 8),
                Text(
                  listQuestion[index].answer,
                  style: TextStyle(
                    fontSize: textSizeMedium,
                    color: grocery_textColorSecondary,
                  ),
                ),
              ],
            ).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
          ).paddingOnly(left: 16, right: 16, top: 16).onTap(() {});
        });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: grocery_colorPrimary,
        leading: Icon(
          Icons.clear,
          size: 30,
          color: grocery_color_white,
        ).onTap(() {
          finish(context);
        }),
        title: text(grocery_question, fontSize: textSizeNormal, textColor: grocery_color_white, fontFamily: fontBold),
        actions: <Widget>[
          Icon(
            Icons.add,
            size: 30,
            color: grocery_color_white,
          ).paddingOnly(right: 16).onTap(() {
            GroceryGotQuestionScreen().launch(context);
          }),
        ],
      ),
      body: trackOrder,
    );
  }
}
