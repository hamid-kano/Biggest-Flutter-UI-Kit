import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerBottomNavigationBar.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerBottomNavigation extends StatefulWidget {
  static String tag = '/T9BottomNavigation';

  @override
  LearnerBottomNavigationState createState() => LearnerBottomNavigationState();
}

class LearnerBottomNavigationState extends State<LearnerBottomNavigation> {
  var _selectedIndex = 0;

  // ignore: non_constant_identifier_names
  get learner_ic_home_navigation => null;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
            LearnerBottomNavigationBarItem(
              icon: Learner_ic_home_navigation,
            ),
            LearnerBottomNavigationBarItem(
              icon: Learner_ic_search_navigation,
            ),
            LearnerBottomNavigationBarItem(
              icon: Learner_ic_chart_navigation,
            ),
            LearnerBottomNavigationBarItem(
              icon: Learner_ic_message_navigation,
            ),
            LearnerBottomNavigationBarItem(
              icon: Learner_ic_more_navigation,
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: learner_textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: learner_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: LearnerBottomNavigationBarType.fixed,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 8),
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: learner_colorPrimary,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
