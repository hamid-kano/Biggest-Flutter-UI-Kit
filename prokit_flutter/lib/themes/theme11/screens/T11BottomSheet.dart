import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme11/models/T11Models.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Colors.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Constant.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11DataGenerator.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Images.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Strings.dart';

class T11BottomSheet extends StatefulWidget {
  static String tag = '/T11BottomSheet';

  @override
  _T11BottomSheetState createState() => _T11BottomSheetState();
}

class _T11BottomSheetState extends State<T11BottomSheet> {
  late List<Theme11Albums> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = theme11AlbumsList();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: IntrinsicHeight(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          colors: [t11_GradientColor1, t11_GradientColor2],
                        ),
                      ),
                    ).cornerRadiusWithClipRRect(20.0).paddingOnly(top: 150),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Image.asset(
                          t11_ic_DownArrow,
                          height: 50,
                          width: 50,
                        ).center().paddingOnly(bottom: 24),
                        CachedNetworkImage(
                          placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                          imageUrl: t11_ic_Music1,
                          fit: BoxFit.fill,
                          height: 200,
                          width: 200,
                        ).cornerRadiusWithClipRRect(30).center(),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: text(t11_lbl_short_text, textColor: t11_greyColor, fontSize: textSizeLargeMedium, fontFamily: fontMedium, maxLine: 3).paddingAll(32),
                            ),
                            Image.asset(
                              t11_ic_Expand,
                              fit: BoxFit.fill,
                              height: 30,
                              width: 30,
                            ).paddingOnly(right: 16)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: text(t11_lbl_sprakFly, textColor: t11_blackColor, fontSize: textSizeLarge, fontFamily: fontRegular).paddingOnly(left: 16, top: 8, right: 16),
                            ),
                            Image.asset(
                              t11_ic_Shuffle,
                              fit: BoxFit.fill,
                              height: 20,
                              width: 20,
                              color: Colors.pinkAccent,
                            ).paddingOnly(right: 24, top: 16, left: 16).center(),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            text(t11_lbl_Imagine, textColor: t11_PrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontRegular).paddingAll(16),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: textSecondaryColor.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            t11_PrimaryColor,
                          ),
                        ).paddingAll(16),
                        text(t11_lbl_time, textColor: t11_PrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontRegular).paddingAll(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              t11_ic_Prev,
                              fit: BoxFit.fill,
                              height: 60,
                              width: 60,
                            ).center(),
                            Image.asset(
                              t11_ic_Pause,
                              fit: BoxFit.fill,
                              height: 80,
                              width: 80,
                              color: t11_PrimaryColor,
                            ).paddingOnly(left: 4, right: 4).center(),
                            Image.asset(
                              t11_ic_next,
                              fit: BoxFit.fill,
                              height: 60,
                              width: 60,
                            ).center(),
                          ],
                        ).center().paddingOnly(top: 16, bottom: 32)
                      ],
                    )
                  ],
                ).cornerRadiusWithClipRRect(30),
              ),
            );
          });
    });
    final imgView = Container(
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
            imageUrl: t11_ic_Music1,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height / 2.0,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.0,
            width: MediaQuery.of(context).size.width,
            color: t11_blackColor.withOpacity(0.4),
          )
        ],
      ),
    );

    final textView = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        text(t11_lbl_heavy_addication, textColor: t11_WhiteColor, fontSize: textSizeLarge, fontFamily: fontBold, isCentered: true).paddingOnly(top: 8, bottom: 8, left: 16, right: 16),
        text(t11_lbl_song_timing, textColor: t11_greyColor, fontSize: textSizeNormal, fontFamily: fontSemibold, isCentered: true).paddingOnly(bottom: 8, left: 16, right: 16)
      ],
    ).paddingAll(8);

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
                    color: t11_PrimaryColor.withOpacity(0.7),
                  ).paddingAll(16)
                ],
              ),
            ],
          );
        },
      ),
    );

    final nowPlaying = Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [t11_GradientColor1, t11_GradientColor2],
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 50,
              height: 5,
              color: Colors.grey,
            ).center().paddingOnly(top: 16),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        t11_lbl_now_playing,
                        style: primaryTextStyle(size: 18, color: t11_PrimaryColor),
                      ).paddingOnly(top: 16, right: 16),
                      Text(
                        t11_lbl_SmokeMirrors,
                        style: primaryTextStyle(size: 20, color: blackColor),
                      ).paddingOnly(top: 8, right: 16, bottom: 16),
                    ],
                  ),
                ),
                Icon(
                  Icons.play_circle_outline,
                  size: 50,
                  color: t11_PrimaryColor,
                )
              ],
            ).paddingAll(16),
          ],
        )).cornerRadiusWithClipRRect(20).paddingOnly(bottom: 4).onTap(() => showBottomSheetDialog(context));

    return Scaffold(
        extendBody: true,
        body: Column(
          children: <Widget>[
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 290.0,
                      floating: false,
                      pinned: true,
                      titleSpacing: 0,
                      backgroundColor: whiteColor,
                      actionsIconTheme: IconThemeData(opacity: 0.0),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            imgView,
                            textView,
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                            colors: [t11_GradientColor1, t11_GradientColor2],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                t11_lbl_songs,
                                style: boldTextStyle(size: 24, color: t11_PrimaryColor),
                              ).paddingOnly(top: 16, left: 16, right: 16)),
                              Image.asset(
                                t11_ic_Shuffle,
                                fit: BoxFit.fill,
                                height: 25,
                                width: 25,
                                color: Colors.pinkAccent,
                              ).paddingOnly(right: 16, top: 16),
                              Image.asset(
                                t11_ic_Repeat,
                                fit: BoxFit.fill,
                                height: 30,
                                width: 30,
                              ).paddingOnly(right: 16, top: 16),
                            ],
                          ),
                          songDisplayList,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            nowPlaying
          ],
        ));
  }

  showBottomSheetDialog(context) async {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: IntrinsicHeight(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [t11_GradientColor1, t11_GradientColor2],
                    ),
                  ),
                ).cornerRadiusWithClipRRect(20.0).paddingOnly(top: 150),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Image.asset(
                      t11_ic_DownArrow,
                      height: 50,
                      width: 50,
                    ).center().paddingOnly(bottom: 24),
                    CachedNetworkImage(
                      imageUrl: t11_ic_Music1,
                      fit: BoxFit.fill,
                      height: 200,
                      width: 200,
                    ).cornerRadiusWithClipRRect(30).center(),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: text(t11_lbl_short_text, textColor: t11_greyColor, fontSize: textSizeLargeMedium, fontFamily: fontMedium, maxLine: 3).paddingAll(32),
                        ),
                        Image.asset(
                          t11_ic_Expand,
                          fit: BoxFit.fill,
                          height: 30,
                          width: 30,
                        ).paddingOnly(right: 16)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: text(t11_lbl_sprakFly, textColor: t11_blackColor, fontSize: textSizeLarge, fontFamily: fontRegular).paddingOnly(left: 16, top: 8, right: 16),
                        ),
                        Image.asset(
                          t11_ic_Shuffle,
                          fit: BoxFit.fill,
                          height: 20,
                          width: 20,
                          color: Colors.pinkAccent,
                        ).paddingOnly(right: 24, top: 16, left: 16).center(),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(t11_lbl_Imagine, textColor: t11_PrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontRegular).paddingAll(16),
                      ],
                    ),
                    LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: textSecondaryColor.withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        t11_PrimaryColor,
                      ),
                    ).paddingAll(16),
                    text(t11_lbl_time, textColor: t11_PrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontRegular).paddingAll(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          t11_ic_Prev,
                          fit: BoxFit.fill,
                          height: 60,
                          width: 60,
                        ).center(),
                        Image.asset(
                          t11_ic_Pause,
                          fit: BoxFit.fill,
                          height: 80,
                          width: 80,
                          color: t11_PrimaryColor,
                        ).paddingOnly(left: 4, right: 4).center(),
                        Image.asset(
                          t11_ic_next,
                          fit: BoxFit.fill,
                          height: 60,
                          width: 60,
                        ).center(),
                      ],
                    ).center().paddingOnly(top: 16, bottom: 32)
                  ],
                )
              ],
            ).cornerRadiusWithClipRRect(30),
          ),
        );
      },
    );
  }
}
