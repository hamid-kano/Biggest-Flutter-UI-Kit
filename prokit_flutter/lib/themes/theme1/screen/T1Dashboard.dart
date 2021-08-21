import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Constant.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Images.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Strings.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Widget.dart';
import 'package:nb_utils/nb_utils.dart';

class T1Dashboard extends StatefulWidget {
  static var tag = "/T1Dashboard";

  @override
  State<StatefulWidget> createState() {
    return T1DashboardState();
  }
}

class T1DashboardState extends State<T1Dashboard> {
  var isSelected = 1;
  late var width;
  late var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    changeStatusColor(appStore.appBarColor!);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: Observer(
        builder: (_) => Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 80),
              physics: ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  16.height,
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.55,
                    color: appStore.scaffoldBackground,
                    child: PageView(
                      children: <Widget>[
                        Slider(file: t1_slider1),
                        Slider(file: t1_slider2),
                        Slider(file: t1_slider3),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      color: appStore.scaffoldBackground,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          text(t1_lbl_media, textColor: appStore.textPrimaryColor, fontSize: textSizeNormal, fontFamily: fontBold),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[mediaButton(t1_lbl_document, t1_file), mediaButton(t1_lbl_video, t1_video), mediaButton(t1_lbl_photos, t1_images)],
                            ),
                          ),
                          SizedBox(height: 24),
                          text(t1_lbl_send_file, textColor: appStore.textPrimaryColor, fontSize: textSizeNormal, fontFamily: fontBold),
                          SizedBox(height: 16),
                          Container(
                            alignment: Alignment.center,
                            color: appStore.scaffoldBackground,
                            child: Stack(
                              children: <Widget>[
                                Image.asset(t1_ic_home_image, width: width / 2, height: width / 2.7),
                                Container(
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: t1_color_primary_light),
                                  width: width / 3.5,
                                  height: width / 3.5,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: width / 30),
                                  padding: EdgeInsets.all(width / 18),
                                  child: text(t1_lbl_send_files, textColor: t1_colorPrimary, fontSize: textSizeNormal, maxLine: 2),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: height * 0.1,
                  )
                ],
              ),
            ),
            SafeArea(
              child: Container(
                color: appStore.appBarColor,
                padding: EdgeInsets.only(left: 14),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      t1_menu,
                      width: 25,
                      height: 25,
                      color: appStore.iconColor,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Center(
                        child: headerText(t1_lbl_home),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 60,
                    decoration: BoxDecoration(
                      color: appStore.scaffoldBackground,
                      boxShadow: [BoxShadow(color: shadowColorGlobal, blurRadius: 10, spreadRadius: 2, offset: Offset(0, 3.0))],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          tabItem(1, t1_home),
                          tabItem(2, t1_notification),
                          Container(
                            width: 45,
                            height: 45,
                          ),
                          tabItem(3, t1_settings),
                          tabItem(4, t1_user)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 55,
                    child: FloatingActionButton(
                      backgroundColor: t1_colorPrimary,
                      onPressed: () {},
                      child: Icon(
                        Icons.mic,
                        color: t1_white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tabItem(var pos, var icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = pos;
        });
      },
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: isSelected == pos ? BoxDecoration(shape: BoxShape.circle, color: t1_colorPrimary_light) : BoxDecoration(),
        child: SvgPicture.asset(
          icon,
          width: 20,
          height: 20,
          color: isSelected == pos ? t1_colorPrimary : appStore.textSecondaryColor,
        ),
      ),
    );
  }

  Widget mediaButton(String buttonText, String icon) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: t1_color_primary_light),
          width: width / 5.5,
          height: width / 5.5,
          padding: EdgeInsets.all(width / 18),
          child: SvgPicture.asset(
            icon,
            color: t1_colorPrimary,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        text(buttonText, textColor: appStore.textPrimaryColor, fontSize: textSizeMedium, fontFamily: fontMedium)
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

class Slider extends StatelessWidget {
  final String file;

  Slider({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: CachedNetworkImage(
          placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
          imageUrl: file,
          fit: BoxFit.fill,
        ), /*Image.asset(file, fit: BoxFit.fill),*/
      ),
    );
  }
}
