import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/percent_indicator/circular_percent_indicator.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Colors.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Constant.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Images.dart';

class T8Result extends StatefulWidget {
  static String tag = '/T8Result';

  const T8Result({
    Key? key,
  }) : super(key: key);

  @override
  T8ResultState createState() => T8ResultState();
}

class T8ResultState extends State<T8Result> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: appStore.scaffoldBackground,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: appStore.iconColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularPercentIndicator(
                      radius: 190.0,
                      lineWidth: 10.0,
                      animation: true,
                      arcType: ArcType.FULL,
                      percent: 1.0,
                      backgroundColor: t8_view_color,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          text("100", textColor: appStore.textPrimaryColor, fontSize: 20.0, fontFamily: fontBold),
                          text("5 out 5", textColor: appStore.textSecondaryColor),
                        ],
                      ),
                      footer: Container(
                        transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                        decoration: boxDecoration(showShadow: true, bgColor: t8_white, radius: 8),
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Text(
                          "+50 XP",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                      ),
                      progressColor: t8_colorAccent,
                    ),
                    text("You are awesome!", fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                    text("Congratulations for getting\nall the answer correct!", isLongText: true, textColor: appStore.textSecondaryColor, isCentered: true),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 16, bottom: 20),
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: boxDecoration(radius: 10, bgColor: t8_color_facebook, showShadow: true),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SvgPicture.asset(t8_ic_facebook, color: t8_white),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 16, bottom: 20),
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: boxDecoration(radius: 10, bgColor: t8_form_google, showShadow: true),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SvgPicture.asset(t8_ic_google, color: t8_white),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 16, bottom: 20),
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: boxDecoration(radius: 10, bgColor: t8_color_message, showShadow: true),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SvgPicture.asset(t8_ic_mail, color: t8_white),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: boxDecoration(radius: 10, bgColor: t8_color_twitter, showShadow: true),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SvgPicture.asset(t8_ic_twitter, color: t8_white),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget t8ResultOption(var icon, var color) {
  return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: 70,
      height: 70,
      decoration: boxDecoration(radius: 10, bgColor: color, showShadow: true),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SvgPicture.asset(icon, color: t8_white),
      ));
}
