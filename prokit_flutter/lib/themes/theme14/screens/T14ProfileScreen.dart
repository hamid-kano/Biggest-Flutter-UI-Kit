import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14ProfileScreen1.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14ProfileScreen2.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14ProfileScreen3.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14ProfileScreen4.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';

class T14ProfileScreen extends StatefulWidget {
  @override
  _T14ProfileScreenState createState() => _T14ProfileScreenState();
}

class _T14ProfileScreenState extends State<T14ProfileScreen> {
  int _pageIndex = 0;
  PageController? _pageController;

  List<Widget> tabPages = [
    T14ProfileScreen1(),
    T14ProfileScreen2(),
    T14ProfileScreen3(),
    T14ProfileScreen4(),
  ];

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController!.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _pageIndex,
      onTap: onTabTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.teal,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home, size: 20), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person, size: 20), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline, size: 20), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search, size: 20), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.settings, size: 20), label: ''),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
    init();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: t14_colorWhite,
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          size: 20,
        ).onTap(() {
          finish(context);
        }),
        elevation: 0.0,
        title: Text('Account', style: boldTextStyle(color: t14_colorBlue, size: 18)),
        centerTitle: true,
      ),
      bottomNavigationBar: _bottomTab(),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
}
