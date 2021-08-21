import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerChart.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerChat.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerHome.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerProfile.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerSearch.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerBottomNavigationBar.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerDashboard extends StatefulWidget {
  static String tag = '/LearnerDashboard';

  @override
  _LearnerDashboardState createState() => _LearnerDashboardState();
}

class _LearnerDashboardState extends State<LearnerDashboard> {
  var selectedIndex = 0;
  var pages = [
    LearnerHome(),
    LearnerSearch(),
    LearnerChart(),
    LearnerChat(),
    LearnerProfile(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
      if (selectedIndex == 0) {
        print("Home");
      } else if (selectedIndex == 1) {
        print("Search");
      } else if (selectedIndex == 2) {
        print("Chart");
      } else if (selectedIndex == 3) {
        print("Chat");
      } else if (selectedIndex == 4) {
        print("Profile");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(learner_layout_background);

    return Scaffold(
      backgroundColor: learner_layout_background,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: learner_ShadowColor, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5)]),
        child: LearnerBottomNavigationBar(
          items: const <LearnerBottomNavigationBarItem>[
            LearnerBottomNavigationBarItem(icon: Learner_ic_home_navigation),
            LearnerBottomNavigationBarItem(icon: Learner_ic_search_navigation),
            LearnerBottomNavigationBarItem(icon: Learner_ic_chart_navigation),
            LearnerBottomNavigationBarItem(icon: Learner_ic_message_navigation),
            LearnerBottomNavigationBarItem(icon: Learner_ic_more_navigation),
          ],
          currentIndex: selectedIndex,
          unselectedIconTheme: IconThemeData(color: learner_textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: learner_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: LearnerBottomNavigationBarType.fixed,
        ),
      ),
      body: SafeArea(
        child: pages[selectedIndex],
      ),
    );
  }
}
