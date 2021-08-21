import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme11/models/T11Models.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Colors.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11DataGenerator.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Strings.dart';

class T11List extends StatefulWidget {
  static String tag = '/T11List';

  @override
  _T11ListState createState() => _T11ListState();
}

class _T11ListState extends State<T11List> {
  late List<Theme11SongsList> mList1;

  void initState() {
    super.initState();
    mList1 = theme11SongList();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    final songList = ListView.builder(
        itemCount: mList1.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width - 24,
                child: CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: mList1[index].img,
                  fit: BoxFit.fill,
                ).cornerRadiusWithClipRRect(20).paddingTop(16),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: t11_WhiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(mList1[index].title,
                        style: boldTextStyle(
                          color: t11_blackColor,
                          size: 20,
                          fontFamily: fontBold,
                        )),
                    Text(mList1[index].subtitle, style: primaryTextStyle(color: t11_blackColor, size: 16, fontFamily: fontRegular)).paddingTop(4),
                  ],
                ).paddingAll(16),
              ).cornerRadiusWithClipRRect(20)
            ],
          ).paddingOnly(top: 8, bottom: 8, left: 24, right: 24);
        });

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: t11_GradientColor2.withOpacity(0.4),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.navigate_before,
                      size: 40,
                      color: t11_PrimaryColor,
                    ).paddingTop(24).onTap(() {
                      finish(context);
                    }),
                    Expanded(
                      child: Container(
                        color: t11_WhiteColor,
                        child: Text(t11_lbl_header_text, style: primaryTextStyle(color: t11_blackColor, size: 16, fontFamily: fontRegular)).paddingAll(16),
                      ).cornerRadiusWithClipRRect(30).paddingOnly(top: 16, bottom: 8, left: 16, right: 16),
                    )
                  ],
                ),
              ),
              Expanded(
                child: songList,
              )
            ],
          )
        ],
      ),
    );
  }
}
