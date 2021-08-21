import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MEditProfileScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MFollowersListScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MFollowingScreen.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MDataProvider.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MImages.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MWidget.dart';

class MProfileScreen extends StatefulWidget {
  static String tag = '/MProfileScreen';

  @override
  MProfileScreenState createState() => MProfileScreenState();
}

class MProfileScreenState extends State<MProfileScreen> {
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
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: white),
                    onPressed: () {
                      finish(context);
                    }),
                backgroundColor: black,
                expandedHeight: 240,
                pinned: true,
                actions: [
                  PopupMenuButton(
                    color: mGreyColor,
                    icon: Icon(Icons.more_vert, color: grey),
                    padding: EdgeInsets.all(0),
                    onSelected: (dynamic i) {
                      MEditProfileScreen(name: 'Smith John').launch(context);
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text("Edit", style: primaryTextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: CircleAvatar(backgroundImage: AssetImage(mCatSoftware), radius: 60).center(),
                  title: Text("Smith John", style: boldTextStyle(size: 14, color: white)),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverContainerDelegate(Container(
                  decoration: BoxDecoration(border: Border(top: BorderSide(color: white, width: 0.2)), color: black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text('${1} Following', style: primaryTextStyle(size: 16, color: white)),
                      ).onTap(() {
                        MFollowingScreen().launch(context);
                      }),
                      Container(color: appDividerColor, width: 0.2, height: 40),
                      Container(
                        alignment: Alignment.center,
                        child: Text('${1}  Followers', style: primaryTextStyle(size: 16, color: white)),
                      ).onTap(() {
                        MFollowersListScreen().launch(context);
                      })
                    ],
                  ),
                )),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: white,
                    unselectedLabelColor: Colors.blueGrey,
                    isScrollable: true,
                    tabs: [
                      Tab(text: "Profile"),
                      Tab(text: "Latest"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              Container(
                color: mGreyColor,
                child: Wrap(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      height: 50,
                      child: Text("Latest", style: boldTextStyle(color: white, size: 16)),
                    ),
                    CommonListDataForProfile(list: getProfileListData()),
                  ],
                ),
              ),
              Container(
                color: mGreyColor,
                child: Wrap(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      height: 50,
                      child: Text("Latest", style: boldTextStyle(color: white, size: 16)),
                    ),
                    CommonListDataForProfile(list: getProfileListData()),
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _SliverContainerDelegate extends SliverPersistentHeaderDelegate {
  final Container _container;

  _SliverContainerDelegate(this._container);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _container,
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
