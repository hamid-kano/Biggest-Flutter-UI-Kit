import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/medium/modal/MModel.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MDataProvider.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MWidget.dart';

class MStoriesScreen extends StatefulWidget {
  static String tag = '/MStoriesScreen';

  @override
  MStoriesScreenState createState() => MStoriesScreenState();
}

class MStoriesScreenState extends State<MStoriesScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List<MStoriesModel> listOfStories = getStoriesList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  List<MStoriesModel> getListOfDraftStories() {
    List<MStoriesModel> listOfDraftStories = [];
    listOfStories.forEach((element) {
      if (element.isDraft) {
        listOfDraftStories.add(element);
      }
    });
    return listOfDraftStories;
  }

  List<MStoriesModel> getListOfPublicStories() {
    List<MStoriesModel> listOfPublicStories = [];
    listOfStories.forEach((element) {
      if (element.isPublic) {
        listOfPublicStories.add(element);
      }
    });
    return listOfPublicStories;
  }

  List<MStoriesModel> getListOfUnlistedStories() {
    List<MStoriesModel> listOfUnlistedStories = [];
    listOfStories.forEach((element) {
      if (element.isUnlisted) {
        listOfUnlistedStories.add(element);
      }
    });
    return listOfUnlistedStories;
  }

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
          backgroundColor: Color.fromRGBO(41, 41, 41, 1),
          key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.menu, color: white),
                onPressed: () {
                  openDrawer();
                }),
            centerTitle: false,
            backgroundColor: black,
            title: Text("Stories", style: boldTextStyle(color: white)),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(isScrollable: true, tabs: [
                  Tab(text: "Drafts"),
                  Tab(text: "Public"),
                  Tab(text: "Unlisted"),
                ]),
              ),
            ),
          ),
          drawer: Drawer(child: SideDrawer()),
          body: TabBarView(
            children: [
              getListOfDraftStories().length != 0
                  ? CommonListForStories(list: getListOfDraftStories())
                  : Text("You haven't published any draft stories yet.", style: primaryTextStyle(size: 18, color: grey), textAlign: TextAlign.center).paddingAll(16).center(),
              getListOfPublicStories().length != 0
                  ? CommonListForStories(list: getListOfPublicStories())
                  : Text("You haven't published any public stories yet.", style: primaryTextStyle(size: 18, color: grey), textAlign: TextAlign.center).paddingAll(16).center(),
              getListOfUnlistedStories().length != 0
                  ? CommonListForStories(list: getListOfUnlistedStories())
                  : Text("You haven't published any unlisted stories yet.", style: primaryTextStyle(size: 18, color: grey), textAlign: TextAlign.center).paddingAll(16).center(),
            ],
          ),
        ),
      ),
    );
  }
}
