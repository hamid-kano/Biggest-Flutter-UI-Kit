import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Constant.dart';
import 'package:prokit_flutter/themes/theme13/model/T13Model.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13DataGenerator.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class T13ListingScreen extends StatefulWidget {
  static String tag = '/T13ListingScreen';

  @override
  T13ListingScreenState createState() => T13ListingScreenState();
}

class T13ListingScreenState extends State<T13ListingScreen> {
  late List<Currency> mList;

  @override
  void initState() {
    super.initState();
    mList = generateCurrency();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      appBar: appBar(context, t13_lbl_list),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 16),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListInfo(mList[index], index);
                }),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListInfo extends StatelessWidget {
  late Currency model;

  ListInfo(Currency model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SvgPicture.asset(model.image, width: width * 0.08, height: width * 0.08),
              SizedBox(width: spacing_standard_new),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.name.toString().toUpperCase(), textColor: appStore.textPrimaryColor),
                  text(model.cur, textColor: appStore.textSecondaryColor, fontSize: 14.0),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 14, bottom: 14),
            child: Divider(height: 1, color: t13_view_color),
          )
        ],
      ),
    );
  }
}
