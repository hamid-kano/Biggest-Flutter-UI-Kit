import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';

class MLBottomNavigationBarWidget extends StatefulWidget {
  static String tag = '/MLBottomNavigationBarWidget';
  final Function(int)? onTap;
  final int? index;

  MLBottomNavigationBarWidget({this.onTap, this.index});

  @override
  MLBottomNavigationBarWidgetState createState() => MLBottomNavigationBarWidgetState();
}

class MLBottomNavigationBarWidgetState extends State<MLBottomNavigationBarWidget> {
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
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey.shade400,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontSize: 0),
      unselectedLabelStyle: TextStyle(fontSize: 0),
      currentIndex: widget.index!,
      onTap: widget.onTap,
      items: [
        bottomNavigationItem(Icons.home_outlined),
        bottomNavigationItem(Icons.chat_bubble_outline),
        bottomNavigationItem(Icons.calendar_today_outlined),
        bottomNavigationItem(Icons.notifications_none),
        bottomNavigationItem(Icons.people_alt_outlined),
      ],
    );
  }

  bottomNavigationItem(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 22),
      label: '',
      activeIcon: mlSelectedNavigationbarIcon(icon),
    );
  }
}
