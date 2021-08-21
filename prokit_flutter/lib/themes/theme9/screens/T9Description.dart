import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme9/models/T9Models.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Colors.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Constant.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9DataGenerator.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Images.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Strings.dart';

class T9Description extends StatefulWidget {
  static String tag = '/T9Description';

  @override
  T9DescriptionState createState() => T9DescriptionState();
}

class T9DescriptionState extends State<T9Description> {
  late List<T9ContentModel> mList;

  @override
  void initState() {
    super.initState();
    mList = t9GetContents();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.scaffoldBackground!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  margin: EdgeInsets.fromLTRB(16, 30, 16, 16),
                  decoration: boxDecoration(showShadow: true, radius: 16, bgColor: appStore.scaffoldBackground),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                        child: CachedNetworkImage(
                          placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                          imageUrl: t9_climb,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(height: 16),
                      text(t9_lbl_project_management, textColor: appStore.textPrimaryColor, fontSize: textSizeNormal, fontFamily: fontBold),
                      SizedBox(height: 8),
                      Container(
                        decoration: boxDecoration(bgColor: t9_green, radius: 8, showShadow: false),
                        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                        child: text(t9_lbl_30_80, textColor: t9_white),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          T9OptionDescription(t9_lbl_1_6k, t9_lbl_students),
                          T9OptionDescription(t9_lbl_5_0, t9_lbl_rating),
                          T9OptionDescription(t9_lbl_37, t9_lbl_lectures),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: t9_textColorSecondary,
                      ),
                      text(t9_lbl_swipe_up_to_show_course_contents, textColor: t9_textColorSecondary)
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.close,
                      color: appStore.iconColor,
                      size: 20,
                    )),
                text(t9_lbl_project_management, textColor: appStore.textPrimaryColor, fontSize: textSizeNormal, fontFamily: fontMedium),
                SizedBox(height: 10),
                Container(
                  decoration: boxDecoration(bgColor: t9_green, radius: 8, showShadow: false),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                    child: text(t9_lbl_30_80, textColor: t9_white),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(t9_ic_profile),
                            radius: MediaQuery.of(context).size.height * 0.025,
                          ),
                          SizedBox(width: 16),
                          text(t9_lbl_hannah_tran, textColor: t9_colorPrimary)
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.star,
                                  color: t9_yellow,
                                  size: 16,
                                ),
                              ),
                            ),
                            TextSpan(text: t9_lbl_5_0, style: TextStyle(fontSize: textSizeMedium, color: t9_yellow, fontFamily: fontMedium)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return T9Question(mList[index], index);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class T9Question extends StatelessWidget {
  late T9ContentModel model;

  T9Question(T9ContentModel model, int pos) {
    this.model = model;
  }

  var i;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: <Widget>[
          text("1", textColor: t9_textColorSecondary),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(model.name, textColor: appStore.textPrimaryColor, fontFamily: fontMedium, fontSize: textSizeLargeMedium, maxLine: 2, isLongText: true),
                text(model.subtitle, textColor: appStore.textSecondaryColor, isLongText: true, maxLine: 2),
                text(model.type, textColor: t9_colorPrimary)
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget T9OptionDescription(var total, var type) {
  return Container(
    margin: EdgeInsets.only(left: 16, right: 16),
    child: Column(
      children: <Widget>[
        CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: t9_ic_cup, height: 20, width: 20),
        SizedBox(height: 4),
        text(total, textColor: appStore.textPrimaryColor, fontFamily: fontMedium, isLongText: true),
        text(type, textColor: appStore.textSecondaryColor),
      ],
    ),
  );
}
