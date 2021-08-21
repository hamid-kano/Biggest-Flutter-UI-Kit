import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class MWTabBarScreen3 extends StatefulWidget {
  static String tag = "/MWTabBarScreen3";

  @override
  _MWTabBarScreen3State createState() => _MWTabBarScreen3State();
}

class _MWTabBarScreen3State extends State<MWTabBarScreen3> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 6);
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.appBarColor,
        title: Text(
          'TabBar with Icon',
          style: boldTextStyle(color: appStore.textPrimaryColor, size: 20),
        ),
        bottom: TabBar(
          controller: _tabController,
          onTap: (index) {
            print(index);
          },
          indicatorColor: Colors.blue,
          tabs: [
            Tab(
                icon: Image.asset(
              'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/home.png',
              height: 25,
              width: 25,
              color: _tabController!.index != 0 ? appStore.iconSecondaryColor : Colors.blue,
            )),
            Tab(
                icon: Image.asset(
              'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/marketplace.png',
              height: 25,
              width: 25,
              color: _tabController!.index != 1 ? appStore.iconSecondaryColor : Colors.blue,
            )),
            Tab(
                icon: Image.asset(
              'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/group.png',
              height: 25,
              width: 25,
              color: _tabController!.index != 2 ? appStore.iconSecondaryColor : Colors.blue,
            )),
            Tab(
                icon: Image.asset(
              'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/video.png',
              height: 25,
              width: 25,
              color: _tabController!.index != 3 ? appStore.iconSecondaryColor : Colors.blue,
            )),
            Tab(
                icon: Image.asset(
              'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/notification.png',
              height: 25,
              width: 25,
              color: _tabController!.index != 4 ? appStore.iconSecondaryColor : Colors.blue,
            )),
            Tab(
                icon: Image.asset(
              'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/list.png',
              height: 25,
              width: 25,
              color: _tabController!.index != 5 ? appStore.iconSecondaryColor : Colors.blue,
            )),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
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
                  'Marketplace',
                  style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                ),
                15.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
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
                  'Groups',
                  style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                ),
                15.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
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
                15.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
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
                15.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
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
                15.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
