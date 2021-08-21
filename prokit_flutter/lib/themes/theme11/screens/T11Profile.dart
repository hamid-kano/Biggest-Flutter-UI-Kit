import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme11/models/T11Models.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Colors.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11DataGenerator.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Images.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Strings.dart';

class T11Profile extends StatefulWidget {
  static String tag = '/T11Profile';

  @override
  _T11ProfileState createState() => _T11ProfileState();
}

class _T11ProfileState extends State<T11Profile> {
  late List<Theme11ListProfile> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = theme11List();
  }

  @override
  Widget build(BuildContext context) {
    final topImageView = Column(
      children: <Widget>[
        Container(
            color: t11_BackgroundColor,
            height: MediaQuery.of(context).size.height / 1.5,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: t11_ic_Profile,
              fit: BoxFit.fill,
            )),
      ],
    );

    final details = Column(
      children: <Widget>[
        Container(
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      t11_lbl_emily_dosan,
                      style: primaryTextStyle(size: 20, color: blackColor),
                    ).paddingOnly(top: 20, left: 16)),
                    Icon(
                      Icons.bookmark_border,
                      size: 30,
                      color: t11_PrimaryColor,
                    ).paddingOnly(top: 18, right: 16).onTap(() {}),
                  ],
                ),
                Divider().paddingOnly(top: 12, bottom: 12),
                Text(
                  t11_lbl_short_text,
                  style: primaryTextStyle(size: 18, color: textSecondaryColor),
                ).paddingOnly(top: 8, left: 16, right: 16, bottom: 16),
                Text(
                  t11_lbl_ReadMore,
                  style: primaryTextStyle(size: 20, color: Colors.blueAccent),
                ).paddingOnly(top: 16, left: 16, bottom: 40)
              ],
            )).cornerRadiusWithClipRRect(15.0).paddingOnly(bottom: 50, left: 24, right: 24)
      ],
    );

    final listView = Container(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: mList1.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              color: whiteColor,
              child: Row(
                children: <Widget>[
                  Image.asset(mList1[index].img, height: 30, width: 30),
                  Text(
                    mList1[index].count,
                    style: boldTextStyle(size: 18, color: t11_PrimaryColor),
                  ).paddingAll(8),
                  Icon(Icons.chevron_right).paddingRight(8)
                ],
              ).paddingLeft(16),
            ).cornerRadiusWithClipRRect(20).paddingOnly(left: 16, top: 8, bottom: 8, right: 16);
          }),
    );

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            topImageView,
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomLeft, colors: [
                  t11_GradientColor1.withOpacity(0.1),
                  t11_GradientColor2.withOpacity(0.7),
                ]),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[details, listView],
            ).paddingBottom(16)
          ],
        ),
      ),
    );
  }
}
