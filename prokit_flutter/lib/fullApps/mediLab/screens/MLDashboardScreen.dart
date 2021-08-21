import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLBottomNavigationBarWidget.dart';
import 'package:prokit_flutter/fullApps/mediLab/fragments/MLCalendarFragment.dart';
import 'package:prokit_flutter/fullApps/mediLab/fragments/MLChatFragment.dart';
import 'package:prokit_flutter/fullApps/mediLab/fragments/MLHomeFragment.dart';
import 'package:prokit_flutter/fullApps/mediLab/fragments/MLNotificationFragment.dart';
import 'package:prokit_flutter/fullApps/mediLab/fragments/MLProfileFragemnt.dart';

class MLDashboardScreen extends StatefulWidget {
  static String tag = '/MLDashboardScreen';

  @override
  _MLDashboardScreenState createState() => _MLDashboardScreenState();
}

class _MLDashboardScreenState extends State<MLDashboardScreen> {
  int currentWidget = 0;
  List<Widget> widgets = [
    MLHomeFragment(),
    MLChatFragment(),
    MLCalendarFragment(),
    MLNotificationFragment(),
    MLProfileFragment(),
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
  void dispose() {
    setStatusBarColor(Colors.white);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: widgets[currentWidget],
        bottomNavigationBar: Container(
          color: Colors.white,
          child: showBottomDrawer(),
        ),
      ),
    );
  }

  Widget showBottomDrawer() {
    return MLBottomNavigationBarWidget(
      index: currentWidget,
      onTap: (index) {
        setState(() {});
        currentWidget = index;
      },
    );
  }
}
