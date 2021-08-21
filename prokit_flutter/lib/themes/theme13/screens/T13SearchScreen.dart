import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme13/model/T13Model.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Constant.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13DataGenerator.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Images.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Widget.dart';

import '../../../main.dart';

class T13SearchScreen extends StatefulWidget {
  static String tag = '/T13SearchScreen';

  @override
  T13SearchScreenState createState() => T13SearchScreenState();
}

class T13SearchScreenState extends State<T13SearchScreen> {
  late List<Filter> mList;

  @override
  void initState() {
    super.initState();
    mList = generateFilter();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, t13_lbl_search),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    mSearch,
                    SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(right: spacing_control),
                              child: SvgPicture.asset(t13_ic_send, color: t13_colorPrimary, width: 18, height: 18),
                            ),
                          ),
                          TextSpan(text: t13_lbl_search_nearest_properties, style: TextStyle(fontSize: textSizeMedium, color: t13_colorPrimary)),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    text(t13_lbl_last_search.toUpperCase(), textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                    SizedBox(height: spacing_standard),
                    Row(
                      children: <Widget>[
                        Icon(Icons.search, color: t13_colorPrimary, size: 20),
                        SizedBox(width: spacing_standard_new),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            text(t13_lbl_bali),
                            text(t13_lbl_3_bedroom, textColor: t13_textColorSecondary, fontSize: 14.0),
                            text(t13_lbl_3_bathroom, textColor: t13_textColorSecondary, fontSize: 14.0),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: spacing_standard_new),
                    text(t13_lbl_popular_cities.toUpperCase(), textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                    SizedBox(height: spacing_standard),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PopularCity(mList[index], index);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PopularCity extends StatelessWidget {
  late Filter model;

  PopularCity(Filter model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.star_border, color: t13_colorPrimary, size: 20),
            SizedBox(width: spacing_standard_new),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(model.name.toString().toUpperCase()),
                text(model.property, textColor: t13_textColorSecondary, fontSize: 14.0),
              ],
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
          child: Divider(height: 1, color: t13_view_color),
        )
      ],
    );
  }
}
