import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class MWTabBarScreen4 extends StatefulWidget {
  static String tag = "/MWTabBarScreen4";

  @override
  _MWTabBarScreen4State createState() => _MWTabBarScreen4State();
}

class _MWTabBarScreen4State extends State<MWTabBarScreen4> {
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
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appStore.appBarColor,
            title: Text(
              'Scrollable Tab',
              style: boldTextStyle(color: appStore.textPrimaryColor, size: 20),
            ),
            bottom: TabBar(
              onTap: (index) {
                print(index);
              },
              isScrollable: true,
              labelStyle: boldTextStyle(),
              indicatorColor: Colors.blue,
              tabs: [
                Tab(
                  child: TabList(title: 'Home'),
                ),
                Tab(
                  child: TabList(title: 'MarketPlace'),
                ),
                Tab(
                  child: TabList(title: 'Group'),
                ),
                Tab(
                  child: TabList(title: 'Watch'),
                ),
                Tab(
                  child: TabList(title: 'Notifications'),
                ),
                Tab(
                  child: TabList(title: 'Menu'),
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
                      'MarketPlace',
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
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
                      'Group',
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
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
                      'Watch',
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
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
                      'Notifications',
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
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
                      'Menu',
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TabList({Widget? icon, required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon == null ? SizedBox() : icon,
        10.width,
        Text(
          title,
          style: TextStyle(color: appStore.textPrimaryColor),
        ),
      ],
    );
  }
}
