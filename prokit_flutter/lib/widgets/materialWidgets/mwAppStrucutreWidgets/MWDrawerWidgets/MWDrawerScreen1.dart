import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWDrawerScreen1 extends StatefulWidget {
  static String tag = '/MWDrawerScreen1';

  @override
  _MWDrawerScreen1State createState() => _MWDrawerScreen1State();
}

class _MWDrawerScreen1State extends State<MWDrawerScreen1> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(seconds: 1));
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('With Multiple Account Selection', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 22)),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: 'https://miro.medium.com/max/2048/0*0fClPmIScV5pTLoE.jpg',
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRect(100),
                accountName: Text('john Doe'),
                otherAccountsPictures: [
                  CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkynekYrn6_eDaVJG5l_DTiD_5LAm2_osI0Q&usqp=CAU',
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(100),
                  CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTD8u1Nmrk78DSX0v2i_wTgS6tW5yvHSD7o6g&usqp=CAU',
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(100),
                ],
                accountEmail: Text('johndoe@gmail.com'),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: boldTextStyle(color: black),
                ),
                leading: Icon(Icons.home, color: Colors.black.withOpacity(0.7)),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toast('Home');
                },
              ),
              ListTile(
                title: Text(
                  "Photos",
                  style: boldTextStyle(color: black),
                ),
                leading: Icon(Icons.photo, color: Colors.black.withOpacity(0.7)),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toast('Photos');
                },
              ),
              ListTile(
                title: Text(
                  "Movies",
                  style: boldTextStyle(color: black),
                ),
                leading: Icon(Icons.movie, color: Colors.black.withOpacity(0.7)),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toast('Movies');
                },
              ),
              ListTile(
                title: Text(
                  "Notification",
                  style: boldTextStyle(color: black),
                ),
                leading: Icon(Icons.notifications, color: Colors.black.withOpacity(0.7)),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toast('Notification');
                },
              ),
              ListTile(
                title: Text(
                  "Settings",
                  style: boldTextStyle(color: black),
                ),
                leading: Icon(Icons.settings, color: Colors.black.withOpacity(0.7)),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toast('Settings');
                },
              ),
              Divider(),
              Text('Other').paddingLeft(12.0),
              Text(
                'About Us',
                style: boldTextStyle(color: black),
              ).paddingAll(12.0).onTap(() {
                scaffoldKey.currentState!.openEndDrawer();
                toast('About us');
              }),
              Text(
                'Privacy Policy',
                style: boldTextStyle(color: black),
              ).paddingAll(12.0).onTap(() {
                scaffoldKey.currentState!.openEndDrawer();
                toast('Privacy Policy');
              }),
            ],
          ),
        ),
        body: MaterialButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Text('Open Drawer', style: primaryTextStyle(color: whiteColor)),
          padding: EdgeInsets.all(16),
          color: appColorPrimary,
        ).center(),
      ),
    );
  }
}
