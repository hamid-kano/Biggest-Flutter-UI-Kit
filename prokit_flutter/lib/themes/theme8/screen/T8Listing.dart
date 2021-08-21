import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme8/model/T8Models.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Colors.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Constant.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8DataGenerator.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Strings.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Widget.dart';

import '../../../main.dart';

class T8Listing extends StatefulWidget {
  static String tag = '/T8Listing';

  @override
  T8ListingState createState() => T8ListingState();
}

class T8ListingState extends State<T8Listing> {
  late List<T8TestModel> mList;

  @override
  void initState() {
    super.initState();
    mList = t8GetData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      appBar: appBar(context, t8_lbl_biology_basics),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  text(t8_lbl_biology_amp_scientific_method, textColor: appStore.textPrimaryColor, isLongText: true, fontFamily: fontBold, fontSize: textSizeXLarge),
                  text(t8_text_4_to_8_lesson, textColor: appStore.textSecondaryColor),
                  SizedBox(height: 10),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return T8List(mList[index], index);
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class T8List extends StatelessWidget {
  late var width;
  late T8TestModel model;

  T8List(T8TestModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16, bottom: 16, right: 16),
      decoration: boxDecoration(radius: 10, showShadow: true, bgColor: appStore.scaffoldBackground),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: t8_color_setting),
                width: width / 6.5,
                height: width / 6.5,
                padding: EdgeInsets.all(10),
                child: Image.asset(model.image),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.type, textColor: appStore.textPrimaryColor, fontSize: textSizeSMedium),
                  text(model.heading, fontFamily: fontMedium),
                ],
              )
            ],
          ),
          SizedBox(height: 16),
          Text(model.description, style: secondaryTextStyle()),
          SizedBox(height: 16),
          T8Button(textContent: t8_lbl_begin, onPressed: () {})
        ],
      ),
    );
  }
}
