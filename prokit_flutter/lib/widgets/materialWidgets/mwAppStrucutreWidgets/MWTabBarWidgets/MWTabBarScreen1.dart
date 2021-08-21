import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class MWTabBarScreen1 extends StatefulWidget {
  static String tag = "/MWTabBarScreen1";

  @override
  _MWTabBarScreen1State createState() => _MWTabBarScreen1State();
}

class _MWTabBarScreen1State extends State<MWTabBarScreen1> {
  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appStore.appBarColor,
            title: Text(
              'Simple TabBar',
              style: boldTextStyle(color: appStore.textPrimaryColor, size: 20),
            ),
            bottom: TabBar(
              onTap: (index) {
                print(index);
              },
              indicatorColor: Colors.blue,
              labelColor: appStore.textPrimaryColor,
              labelStyle: boldTextStyle(),
              tabs: [
                Tab(
                  text: "Home",
                ),
                Tab(
                  text: "Articles",
                ),
                Tab(
                  text: "User",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: context.width(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                    15.height,
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: context.width(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Articles',
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                    15.height,
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: context.width(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'User',
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                    15.height,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
