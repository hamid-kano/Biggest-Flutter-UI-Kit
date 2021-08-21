import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWBottomNavigationScreen1 extends StatefulWidget {
  static String tag = '/MWBottomNavigationScreen1';

  @override
  MWBottomNavigationScreen1State createState() => MWBottomNavigationScreen1State();
}

class MWBottomNavigationScreen1State extends State<MWBottomNavigationScreen1> {
  int currentIndex1 = 0;
  final example1 = [
    Text('Example 1', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Reels', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('New Photo', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Activity', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Profile', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
  ];

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
      appBar: appBar(context, ''),
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: example1.elementAt(currentIndex1)),
            15.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bulletText('A bottom navigation bar is usually used in conjunction with a Scaffold.'),
                5.height,
                bulletText('Bottom navigation bar consists of multiple items in the form of text labels, icons, or both.'),
                5.height,
                bulletText('This example consists of icons and label both.'),
                5.height,
                bulletText('Bottom Navigation type is Fixed (Default Type).'),
                5.height,
                bulletText('Use when there are less than five items .'),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentIndex1 = index;
          });
        },
        currentIndex: currentIndex1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: appStore.iconColor,
        unselectedItemColor: appStore.textSecondaryColor,
        backgroundColor: appStore.appBarColor,
        items: [
          //1
          BottomNavigationBarItem(
            icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/home.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/home_fill.png', height: 25, width: 25, color: appStore.iconColor),
            label: 'Home',
            backgroundColor: appStore.appBarColor,
          ),
          //2
          BottomNavigationBarItem(
            icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/reel.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/reel_fill.png', height: 25, width: 25, color: appStore.iconColor),
            label: 'Reels',
          ),
          //3
          BottomNavigationBarItem(
            icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/gallery.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/gallery_fill.png', height: 25, width: 25, color: appStore.iconColor),
            label: 'Gallery',
          ),
          //4
          BottomNavigationBarItem(
            icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/heart.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/heart_fill.png', height: 25, width: 25, color: appStore.iconColor),
            label: 'Activity',
          ),
          //5
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: appStore.iconSecondaryColor!, width: 1)),
              child: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/profile1.png', height: 30, width: 30).cornerRadiusWithClipRRect(20),
            ),
            activeIcon: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: appStore.iconColor!, width: 1)),
              child: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/profile1.png', height: 30, width: 30).cornerRadiusWithClipRRect(20),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

Widget bulletText(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("•  ", style: TextStyle(color: appStore.textPrimaryColor, fontSize: 14)),
      Text(text, style: TextStyle(color: appStore.textPrimaryColor, fontSize: 14)).expand(),
    ],
  );
}
