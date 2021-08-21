import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme5/model/T5Models.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Colors.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Constant.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5DataGenerator.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Strings.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Widget.dart';

import '../../../main.dart';

class T5Cards extends StatefulWidget {
  static var tag = "/T5Cards";

  @override
  T5CardsState createState() => T5CardsState();
}

class T5CardsState extends State<T5Cards> {
  int selectedPos = 1;
  late List<T5Bill> mCards;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mCards = getListData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20),
              child: text(t5_bills, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeXLarge),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemCount: mCards.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: boxDecoration(radius: 16, showShadow: true, bgColor: appStore.scaffoldBackground),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SvgPicture.asset(mCards[index].icon, width: width / 13, height: width / 13),
                            SizedBox(height: 10),
                            text(mCards[index].name, textColor: appStore.textPrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontSemibold),
                            text(mCards[index].date, fontSize: textSizeMedium),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              decoration: mCards[index].isPaid ? boxDecoration(bgColor: t5DarkRed, radius: 16) : boxDecoration(bgColor: t5SkyBlue, radius: 16),
                              child: text(mCards[index].isPaid ? "Paid" : "Unpaid", fontSize: textSizeMedium, textColor: t5White),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
