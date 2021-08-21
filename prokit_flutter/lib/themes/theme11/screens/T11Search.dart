import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme11/models/T11Models.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Colors.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Constant.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11DataGenerator.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Strings.dart';

class T11Search extends StatefulWidget {
  static String tag = '/T11Search';

  @override
  _T11SearchState createState() => _T11SearchState();
}

class _T11SearchState extends State<T11Search> {
  late List<Theme11Albums> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = theme11AlbumsList();
  }

  @override
  Widget build(BuildContext context) {
    final searchView = Container(
      height: 80,
      child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: t11_WhiteColor,
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: t11_PrimaryColor,
            ).paddingAll(16),
            contentPadding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
          )).cornerRadiusWithClipRRect(20),
      alignment: Alignment.center,
    ).cornerRadiusWithClipRRect(10).paddingAll(16);

    final songDisplayList = Container(
      child: ListView.builder(
          itemCount: mList1.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                      imageUrl: mList1[index].img,
                      height: 70,
                      width: 70,
                      fit: BoxFit.fill,
                    ).cornerRadiusWithClipRRect(20).paddingAll(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          text(mList1[index].name, textColor: t11_blackColor, fontSize: textSizeLargeMedium, fontFamily: fontMedium).paddingOnly(right: 16),
                          text(mList1[index].subTitle, textColor: t11_PrimaryColor.withOpacity(0.4), fontSize: textSizeLargeMedium, fontFamily: fontMedium).paddingOnly(top: 4, right: 16),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.more_vert,
                      size: 30,
                      color: t11_PrimaryColor.withOpacity(0.4),
                    ).paddingAll(16)
                  ],
                ),
              ],
            );
          }),
    );

    final albumsList = Container(
      height: 120,
      child: ListView.builder(
          itemCount: mList1.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                      imageUrl: mList1[index].img,
                      height: 70,
                      width: 70,
                      fit: BoxFit.fill,
                    ).cornerRadiusWithClipRRect(20).paddingAll(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        text(mList1[index].name, textColor: t11_blackColor, fontSize: textSizeLargeMedium, fontFamily: fontMedium).paddingOnly(right: 16),
                        text(mList1[index].subTitle, textColor: t11_PrimaryColor.withOpacity(0.4), fontSize: textSizeLargeMedium, fontFamily: fontMedium).paddingOnly(top: 4, right: 16),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }),
    );

    final suggestTags = Wrap(
      spacing: 16.0, // gap between adjacent chips
      runSpacing: 10.0, // gap between
      children: Theme11SuggestTagList().map((s) {
        return Chip(
          backgroundColor: t11_GradientColor2.withOpacity(0.4),
          label: Text(
            s.name,
            style: primaryTextStyle(size: 18, color: t11_PrimaryColor),
          ).paddingAll(16),
          shape: StadiumBorder(
            side: BorderSide(width: 1, color: t11_PrimaryColor),
          ),
        );
      }).toList(), //
    ).paddingAll(16);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Container(
            color: t11_GradientColor2.withOpacity(0.4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.navigate_before,
                  size: 40,
                  color: t11_PrimaryColor,
                ).paddingOnly(left: 8, top: 24).onTap(() {
                  finish(context);
                })
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: t11_GradientColor2,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              searchView,
              text(t11_lbl_display_song, textColor: t11_blackColor, fontSize: textSizeLarge, fontFamily: fontMedium).paddingOnly(top: 8, left: 16, right: 16, bottom: 16),
              songDisplayList,
              text(t11_lbl_albums, textColor: t11_blackColor, fontSize: textSizeLarge, fontFamily: fontMedium).paddingOnly(top: 8, left: 16, right: 16, bottom: 16),
              albumsList,
              text(t11_lbl_suggested_tags, textColor: t11_blackColor, fontSize: textSizeLarge, fontFamily: fontMedium).paddingOnly(top: 8, left: 16, right: 16, bottom: 16),
              suggestTags,
            ],
          ),
        ),
      ),
    );
  }
}
