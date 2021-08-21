import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class CWNavigationBarScreen extends StatefulWidget {
  static String tag = '/CWNavigationBarScreen';

  @override
  CWNavigationBarScreenState createState() => CWNavigationBarScreenState();
}

class CWNavigationBarScreenState extends State<CWNavigationBarScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Cupertino NavigationBar'),
      body: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 16,
            spacing: 8,
            direction: Axis.horizontal,
            children: [
              CupertinoNavigationBar(
                transitionBetweenRoutes: false,
                backgroundColor: appStore.appBarColor,
                leading: CustomTheme(
                  child: CupertinoNavigationBarBackButton(
                    color: appStore.iconColor,
                    onPressed: () {
                      toast("Back button");
                    },
                  ),
                ),
                middle: Text(
                  'Center Title',
                  style: boldTextStyle(),
                ),
              ),
              CupertinoNavigationBar(
                transitionBetweenRoutes: false,
                backgroundColor: appStore.appBarColor,
                leading: CupertinoNavigationBarBackButton(
                  color: appStore.iconColor,
                  previousPageTitle: 'With Back Icon',
                  onPressed: () {
                    toast("Back button");
                  },
                ),
              ),
              CupertinoNavigationBar(
                transitionBetweenRoutes: false,
                backgroundColor: appStore.appBarColor,
                automaticallyImplyLeading: true,
                leading: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        toast("Back button");
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: appStore.iconColor,
                      ),
                    ),
                  ],
                ),
                middle: Text(
                  'Single Action',
                  style: boldTextStyle(),
                ),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: GestureDetector(
                    onTap: () {
                      toast("Settings");
                    },
                    child: Icon(
                      Icons.settings,
                      color: appStore.iconColor,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              CupertinoNavigationBar(
                transitionBetweenRoutes: false,
                backgroundColor: appStore.appBarColor,
                leading: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        toast("Drawer");
                      },
                      child: Icon(Icons.menu, color: appStore.iconColor, size: 25),
                    ),
                    8.width,
                    Expanded(child: Text("Page Title", style: boldTextStyle()))
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        toast("Search");
                      },
                      child: Icon(Icons.search, color: appStore.iconColor, size: 25),
                    ),
                    16.width,
                    GestureDetector(
                      onTap: () {
                        toast("Menu");
                      },
                      child: Icon(Icons.more_vert, color: appStore.iconColor, size: 25),
                    ),
                  ],
                ),
              ),
              CupertinoNavigationBar(
                transitionBetweenRoutes: false,
                backgroundColor: appStore.appBarColor,
                leading: CupertinoNavigationBarBackButton(
                  previousPageTitle: 'With Single Action',
                  color: appStore.iconColor,
                  onPressed: () {
                    toast("Back button");
                  },
                ),
                trailing: CupertinoButton(
                  padding: EdgeInsets.all(4),
                  child: GestureDetector(
                    onTap: () {
                      toast("Profile");
                    },
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider('https://www.attractivepartners.co.uk/wp-content/uploads/2017/06/profile.jpg'),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
