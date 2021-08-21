import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/component/MPDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPAlbumsScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPDiscoverScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPProfileScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSongTypeScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPImages.dart';

class MPDashboardScreen extends StatefulWidget {
  static String tag = '/MPDashboardScreen';

  @override
  MPDashboardScreenState createState() => MPDashboardScreenState();
}

class MPDashboardScreenState extends State<MPDashboardScreen> {

  TextEditingController searchController = TextEditingController();

  List<DrawerList> drawerList = getDrawerList();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int currentIndex = 0;

  final tabs = [
    MPDiscoverScreen(),
    MPSongTypeScreen(),
    MPAlbumsScreen(isTab: true),
    MPProfileScreen(isTab: false),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: mpAppBackGroundColor,
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: mpAppBackGroundColor,
          leading: IconButton(
            icon: Icon(Icons.menu, color: white),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Container(
            height: 40,
            width: context.width(),
            child: AppTextField(
              textStyle: primaryTextStyle(color: Colors.white.withOpacity(0.4)),
              textFieldType: TextFieldType.EMAIL,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.2)),
                fillColor: mpSearchBarBackGroundColor,
                hintText: 'Search album, song...',
                hintStyle: primaryTextStyle(color: Colors.white.withOpacity(0.4)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7)),
                enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(25.7)),
              ),
              controller: searchController,
            ),
          ),
          actions: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 16),
              decoration: boxDecorationWithShadow(
                boxShape: BoxShape.circle,
                decorationImage: DecorationImage(image: Image.network(mpImages_4).image, fit: BoxFit.cover),
              ),
            )
          ],
        ),
        drawer: DrawerScreen(),
        body: Stack(
          children: [
            tabs[currentIndex],
            Positioned(
              left: 0,
              right: 0,
              bottom: 4,
              child: BottomNavigationBar(
                selectedItemColor: mpAppButtonColor,
                unselectedItemColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                backgroundColor: mpBottomBgColor.withOpacity(0.9),
                currentIndex: currentIndex,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Discover'),
                  BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Song'),
                  BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Albums'),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                ],
                onTap: (index) {
                  currentIndex = index;
                  setState(() {});
                },
              ).cornerRadiusWithClipRRect(30).paddingOnly(left: 16, right: 16, bottom: 8),
            )
          ],
        ),
      ),
    );
  }
}
