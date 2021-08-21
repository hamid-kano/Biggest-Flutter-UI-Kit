import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTWalkThoughScreen.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppDataProvider.dart';
import 'package:prokit_flutter/main/utils/AppImages.dart';
import 'package:prokit_flutter/main/utils/AppStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import 'ProKitScreenListing.dart';
import 'SettingScreen.dart';
import 'ThemeList.dart';

class ProKitLauncher extends StatefulWidget {
  static String tag = '/ProKitLauncher';

  @override
  ProKitLauncherState createState() => ProKitLauncherState();
}

class ProKitLauncherState extends State<ProKitLauncher> with TickerProviderStateMixin, AfterLayoutMixin<ProKitLauncher> {
  var selectedTab = 0;
  List<Color> colors = [appCat1, appCat2, appCat3];

  PageController _controller = PageController(initialPage: 0, keepPage: false);

  @override
  void initState() {
    super.initState();
    changeStatusColor(appStore.scaffoldBackground!);
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    if (getIntAsync(appOpenCount) >= 5) {
      setValue(appOpenCount, 0);
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;


    Widget tabItem(String name, int pos, {var isRight = false, bool isNew = false}) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _controller.jumpToPage(pos);
            selectedTab = pos;
          });
        },
        child: Stack(
          children: [
            Container(
              child: Text(name, style: boldTextStyle(color: selectedTab == pos ? appColorPrimaryDark : appStore.textPrimaryColor, size: 18)),
              alignment: Alignment.center,
              height: 50,
              decoration: selectedTab == pos
                  ? BoxDecoration(color: appStore.appColorPrimaryLightColor, borderRadius: isRight ? BorderRadius.only(topLeft: Radius.circular(16)) : BorderRadius.only(topRight: Radius.circular(16)))
                  : BoxDecoration(),
            ),
            Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(color: appDarkRed,shape: BoxShape.circle),
                //decoration: boxDecoration(bgColor: appDarkRed, radius: 4),
                ),
              ).visible(isNew.validate()),

          ],
        ),
      );
    }

    Widget category(Color color, String img, String? name, {bool isNew = false, String? type = 'New', required Function onTap}) {
      return Container(
        width: 145,
        height: 110,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 140,
              height: 100,
              margin: EdgeInsets.only(right: 16),
              decoration: boxDecorationRoundedWithShadow(4, backgroundColor: color),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(img, width: 40, height: 40, color: Colors.white),
                  Text('$name', style: boldTextStyle(color: Colors.white), maxLines: 2, textAlign: TextAlign.center),
                ],
              ),
            ),
            Positioned(
              right: -5,
              top: -5,
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 8, top: 8),
                padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                decoration: boxDecoration(bgColor: appDarkRed, radius: 4),
                child: FittedBox(child: text(type.validate(), fontSize: 8.0, textColor: Colors.white)),
              ).visible(isNew.validate()),
            ),
          ],
        ).onTap(() => onTap()),
      );
    }

    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        body: FutureBuilder<AppTheme>(
          future: getAllAppsAndThemes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SafeArea(
                child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        expandedHeight: 230.0,
                        floating: false,
                        backgroundColor: appStore.scaffoldBackground,
                        forceElevated: innerBoxIsScrolled,
                        pinned: true,
                        automaticallyImplyLeading: false,
                        actions: [
                          IconButton(
                            icon: Icon(Icons.settings, color: appStore.backgroundColor),
                            onPressed: () {
                              SettingScreen().launch(context);
                            },
                          )
                        ],
                        title: innerBoxIsScrolled ? Text(appLblDashboardHeading, style: boldTextStyle(size: 24)) : null,
                        bottom: innerBoxIsScrolled
                            ? PreferredSize(
                                preferredSize: Size(context.width(), 80),
                                child: Container(
                                  height: 80,
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  margin: EdgeInsets.only(left: 8),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 60,
                                        margin: EdgeInsets.only(right: 12),
                                        padding: EdgeInsets.all(16),
                                        child: Image.asset(icons[0], color: Colors.white),
                                        decoration: boxDecoration(bgColor: colors[0], radius: 4),
                                      ),
                                      Expanded(
                                        child: Stack(
                                          alignment: Alignment.centerRight,
                                          children: <Widget>[
                                            Container(
                                              width: width,
                                              height: 60,
                                              padding: EdgeInsets.only(left: 16, right: 16),
                                              margin: EdgeInsets.only(right: width / 28),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text('Default Theme', style: boldTextStyle(), maxLines: 2),
                                                    ],
                                                  ).expand(),
                                                ],
                                              ),
                                              decoration: boxDecoration(bgColor: appStore.scaffoldBackground, radius: 4, showShadow: true),
                                            ),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                                              decoration: BoxDecoration(color: colors[0], shape: BoxShape.circle),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ).onTap(() {
                                  DTWalkThoughScreen().launch(context);
                                }),
                              )
                            : null,
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          background: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(appLblDashboardHeading, style: boldTextStyle(size: 35)).paddingOnly(top: 16, left: 16, right: 16),
                                SizedBox(height: 16),
                                SingleChildScrollView(
                                  padding: EdgeInsets.all(8),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      category(appCat5, app_ic_phone, snapshot.data!.defaultTheme!.name, type: snapshot.data!.defaultTheme!.type, onTap: () {
                                        DTWalkThoughScreen().launch(context);
                                      }),
                                      category(appCat4, app_ic_phone, snapshot.data!.widgets!.name, type: snapshot.data!.widgets!.type, onTap: () {
                                        ProKitScreenListing(snapshot.data!.widgets).launch(context);
                                      }),
                                      category(appCat1, app_ic_phone, appLblFullApps, isNew: true, type: snapshot.data!.fullApp!.type, onTap: () {
                                        ProKitScreenListing(snapshot.data!.fullApp).launch(context);
                                      }),
                                      category(appCat2, app_dashboard, appLblDashboard, type: snapshot.data!.dashboard!.type, onTap: () {
                                        ProKitScreenListing(snapshot.data!.dashboard).launch(context);
                                      }),
                                      category(appCat3, app_ic_phone, appLblIntegrations, onTap: () {
                                        ProKitScreenListing(snapshot.data!.integrations).launch(context);
                                      }, isNew: true),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: Container(
                    margin: EdgeInsets.only(top: 8),
                    width: context.width(),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            tabItem(appLblThemeList, 0,isNew: false).expand(),
                            tabItem(appLblScreenList, 1, isRight: true,isNew: true).expand(),
                          ],
                        ),
                        16.height,
                        Expanded(
                          child: Container(
                            height: double.maxFinite,
                            color: appStore.scaffoldBackground,
                            child: PageView(
                              pageSnapping: false,
                              onPageChanged: (value) {
                                selectedTab = value;
                                setState(() {});
                              },
                              controller: _controller,
                              physics: NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                ThemeList(snapshot.data!.themes),
                                ThemeList(snapshot.data!.screenList),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error.toString()}", style: primaryTextStyle());
            }
            return CircularProgressIndicator().center();
          },
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: appStore.scaffoldBackground,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  finish(context);
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(padding: EdgeInsets.only(top: 8, right: 16), child: Icon(Icons.close, color: appStore.iconColor)),
                ),
              ),
              Image.asset('images/app/app_icon.png', height: 100),
              Text("Download the source code", style: boldTextStyle(size: 20)).fit(),
              SizedBox(height: 6),
              Text("Love ProKit Flutter? Tap on download to buy ProKit Flutter.", style: secondaryTextStyle(size: 16), textAlign: TextAlign.center),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: appColorPrimary,
                ),
                onPressed: () {
                  finish(context);
                  launch(SourceCodeUrl);
                },
                child: Text('Download', style: primaryTextStyle(color: white)),
              ).paddingOnly(bottom: 24)
            ],
          ),
        ),
      ),
    );
  }
}
