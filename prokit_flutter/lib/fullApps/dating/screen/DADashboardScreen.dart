import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/fragment/DAHomeFragment.dart';
import 'package:prokit_flutter/fullApps/dating/fragment/DAInboxFragment.dart';
import 'package:prokit_flutter/fullApps/dating/fragment/DAMatchesFragment.dart';
import 'package:prokit_flutter/fullApps/dating/fragment/DAProfileFragment.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAColors.dart';

class DADashboardScreen extends StatefulWidget {
  @override
  DADashboardScreenState createState() => DADashboardScreenState();
}

class DADashboardScreenState extends State<DADashboardScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    DAHomeFragment(),
    DAInboxFragment(),
    DAMatchesFragment(),
    DAProfileFragment(),
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
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: black,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
