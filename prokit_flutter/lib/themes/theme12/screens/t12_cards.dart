import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme12/models/T12Models.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_colors.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_constant.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_data_generator.dart';

class T12Cards extends StatefulWidget {
  static String tag = '/T12Cards';

  @override
  T12CardsState createState() => T12CardsState();
}

class T12CardsState extends State<T12Cards> {
  List<T12Slider> mSliderList = [];

  @override
  void initState() {
    super.initState();
    mSliderList.addAll(getCards());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var cardHight = (width - 32) * (9 / 16);
    return Scaffold(
      appBar: appBar(context, "My Cards", actions: [
        Container(
          padding: EdgeInsets.only(right: spacing_standard_new),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.add_circle_outline,
                size: 16,
                color: t12_primary_color,
              ),
              text("Add Card", fontSize: textSizeMedium, textColor: t12_primary_color, fontFamily: fontMedium).paddingLeft(spacing_control_half)
            ],
          ),
        )
      ]),
      body: Container(
        height: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
            itemCount: mSliderList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: cardHight,
                margin: EdgeInsets.only(bottom: spacing_standard_new),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: t12_gradient_colors[index % t12_gradient_colors.length], begin: Alignment.topLeft, end: Alignment.bottomRight),
                          borderRadius: BorderRadius.all(Radius.circular(spacing_standard))),
                      width: double.infinity,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text("Shopping Card", textColor: Colors.white.withOpacity(0.7), fontSize: textSizeMedium),
                            Image.asset(
                              "images/theme12/mastercard.png",
                              width: 40,
                              height: 40,
                            )
                          ],
                        ),
                        Expanded(child: text("**** **** **** 3960", textColor: Colors.white, fontFamily: fontBold, fontSize: textSizeNormal).paddingTop(spacing_standard)),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text("CARD HOLDER", textColor: Colors.white.withOpacity(0.7), fontSize: textSizeMedium),
                                  text("JAMES DENNIS", textColor: Colors.white, fontSize: textSizeMedium, fontFamily: fontMedium),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text("EXPIRES", textColor: Colors.white.withOpacity(0.7), fontSize: textSizeMedium),
                                text("10/22", textColor: Colors.white, fontSize: textSizeMedium, fontFamily: fontMedium),
                              ],
                            ).paddingRight(spacing_standard_new),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text("CVV", textColor: Colors.white.withOpacity(0.7), fontSize: textSizeMedium),
                                text("***", textColor: Colors.white, fontSize: textSizeMedium, fontFamily: fontMedium),
                              ],
                            )
                          ],
                        )
                      ],
                    ).paddingAll(spacing_standard_new)
                  ],
                ),
              );
            }),
      ),
    );
  }
}
