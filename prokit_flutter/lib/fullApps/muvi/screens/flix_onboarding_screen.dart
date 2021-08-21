import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_signin.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/dots_indicator/dots_indicator.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_constants.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_images.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_size.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_strings.dart';

class MuviOnBoardingScreen extends StatefulWidget {
  static String tag = '/OnBoardingScreen';

  @override
  MuviOnBoardingScreenState createState() => MuviOnBoardingScreenState();
}

class MuviOnBoardingScreenState extends State<MuviOnBoardingScreen> {
  int currentIndexPage = 0;
  PageController _controller = new PageController();

  @override
  Widget build(BuildContext context) {
    var pageView = PageView(
      controller: _controller,
      children: <Widget>[
        WalkThrough(walkImg: ic_walk_1),
        WalkThrough(walkImg: ic_walk2),
        WalkThrough(walkImg: ic_walk_1),
      ],
      onPageChanged: (value) {
        setState(() => currentIndexPage = value);
      },
    );

    var startButton = MaterialButton(
      height: 30,
      color: muvi_colorPrimary,
      splashColor: muvi_colorPrimary.withOpacity(0.5),
      child: text("Get Started", fontSize: ts_medium, fontFamily: font_medium, textColor: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(spacing_large)),
      onPressed: () {
        finish(context);
        SignInScreen().launch(context);
      },
    ).visible(currentIndexPage == 2);

    return Scaffold(
      backgroundColor: muvi_navigationBackground,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            flixTitle(context).paddingOnly(top: spacing_standard_new, bottom: spacing_standard_new),
            text(walk_titles[currentIndexPage], fontSize: ts_large, fontFamily: font_bold, textColor: muvi_textColorPrimary)
                .paddingOnly(left: spacing_large, right: spacing_large, top: spacing_standard_new),
            text(walk_sub_titles[currentIndexPage], fontSize: ts_normal, textColor: muvi_textColorPrimary, maxLine: 2, isCentered: true)
                .paddingOnly(top: spacing_control, left: spacing_large, right: spacing_large),
            Stack(
              children: <Widget>[
                DotsIndicator(dotsCount: 3, position: currentIndexPage, decorator: dotsDecorator(context)).paddingAll(spacing_standard_new),
                startButton,
              ],
            ).paddingAll(spacing_standard),
            Expanded(child: pageView.paddingTop(spacing_standard)),
          ],
        ),
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String? walkImg;

  WalkThrough({Key? key, this.walkImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Positioned(
          top: spacing_standard,
          left: -spacing_large,
          right: -spacing_large,
          bottom: -width * 0.55,
          child: CachedNetworkImage(
            placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
            imageUrl: walkImg!,
            width: double.infinity,
          ).paddingAll(spacing_standard_new).cornerRadiusWithClipRRect(spacing_standard_new),
        ),
        Positioned(top: spacing_standard, left: -spacing_large, right: -spacing_large, bottom: -width * 0.55, child: Image.asset(ic_phone, width: double.infinity)),
      ],
    );
  }
}
