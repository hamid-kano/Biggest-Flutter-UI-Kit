import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/medium/modal/MModel.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MDataProvider.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MWidget.dart';

class MReadingListScreen extends StatefulWidget {
  static String tag = '/MReadingListScreen';

  @override
  MReadingListScreenState createState() => MReadingListScreenState();
}

class MReadingListScreenState extends State<MReadingListScreen> with TickerProviderStateMixin, AfterLayoutMixin<MReadingListScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController? tabController;
  List<Widget> tabs = [];
  List<String> tabList = ['Saved(2)', 'Archived', 'Recently Viewed', 'Highlighted'];
  List<MListModel> savingList = getSavingPostList();
  List<MListModel> archivedList = getArchivedList();
  List<MListModel> recentList = getRecentViewList();
  List<MListModel> highlightedList = getHighlightPostList();

  @override
  void afterFirstLayout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => SavingDialog(),
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    tabList.forEach((element) {
      tabs.add(
        Container(
          padding: EdgeInsets.all(16.0),
          child: Text(element),
        ),
      );
    });
    log(tabs);
  }

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: black,
            leading: IconButton(
              icon: Icon(Icons.menu, color: white),
              onPressed: () {
                openDrawer();
              },
            ),
            title: Text('Reading List', style: primaryTextStyle(color: white)),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(FontAwesome.sort_down, color: white),
                onPressed: () {},
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  tabs: tabList.map((String key) => Tab(text: key)).toList(),
                ),
              ),
            ),
          ),
          drawer: Drawer(
            child: SideDrawer(),
          ),
          body: TabBarView(
            children: [
              Container(
                color: mGreyColor,
                child: SingleChildScrollView(child: MCommonList(list: savingList)),
              ),
              Container(
                color: mGreyColor,
                child: SingleChildScrollView(child: MCommonList(list: archivedList)),
              ),
              Container(
                color: mGreyColor,
                child: SingleChildScrollView(child: MCommonList(list: recentList)),
              ),
              Container(
                color: mGreyColor,
                child: SingleChildScrollView(child: MCommonList(list: highlightedList)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SavingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: appBackgroundColorDark,
      titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      title: Text('Saving and archiving the stories', style: boldTextStyle(color: white)),
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(Icons.bookmark_border, size: 20, color: white),
                    4.height,
                    Icon(Icons.bookmark, size: 20, color: white),
                  ],
                ),
                8.width,
                Text('The bookmark icon saves stories for future or offline or reading. Tap it once to save, and tap it again to un-save.', style: primaryTextStyle(color: white, size: 14)).expand(),
              ],
            ),
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.archive,
                  color: white,
                  size: 20,
                ),
                8.width,
                Text('The archive icon keeps stories for future reference', style: primaryTextStyle(color: white, size: 14)).expand(),
              ],
            ),
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.archive,
                  color: white,
                  size: 20,
                ),
                8.width,
                Text('The archive icon keeps stories for future reference', style: primaryTextStyle(color: white, size: 14)).expand(),
              ],
            ),
            16.height,
            Container(
              width: context.width(),
              decoration: boxDecoration(bgColor: mLimeColor, radius: 5),
              padding: EdgeInsets.all(8),
              child: Text('Got it', style: boldTextStyle(color: white), textAlign: TextAlign.center),
            ).onTap(() {
              finish(context);
            })
          ],
        )
      ],
    );
  }
}
