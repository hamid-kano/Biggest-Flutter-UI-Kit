import 'package:flutter/material.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5BubbleBotoomBar.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Colors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Images.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Strings.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Widget.dart';

class T5BottomNavigation extends StatefulWidget {
  static var tag = "/T5BottomNavigation";

  @override
  T5BottomNavigationState createState() => T5BottomNavigationState();
}

class T5BottomNavigationState extends State<T5BottomNavigation> {
  var currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        backgroundColor: appStore.appBarColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        onTap: changePage,
        hasNotch: false,
        hasInk: true,
        inkColor: t5ColorPrimaryLight,
        items: <BubbleBottomBarItem>[
          tab(t5_img_home, t5_home),
          tab(t5_list_check, t5_lbl_listing),
          tab(t5_notification_2, t5_notification),
          tab(t5_user, t5_lbl_profile),
        ],
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: ring(t5_lbl_welcome_to_bottom_n_navigation_bar),
          ),
          TopBar()
        ],
      ),
    );
  }
}
