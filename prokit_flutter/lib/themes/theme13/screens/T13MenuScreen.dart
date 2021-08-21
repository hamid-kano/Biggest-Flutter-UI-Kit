import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Constant.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';

class T13MenuScreen extends StatefulWidget {
  static String tag = '/T13MenuScreen';

  @override
  T13MenuScreenState createState() => T13MenuScreenState();
}

class T13MenuScreenState extends State<T13MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: SafeArea(
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
      ),
      drawer: T13Drawer(),
    );
  }
}

class T13Drawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return T13DrawerState();
  }
}

class T13DrawerState extends State<T13Drawer> {
  var selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    Widget mLabel(String value) {
      return Padding(
        padding: EdgeInsets.all(spacing_middle),
        child: text(value.toUpperCase()),
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        elevation: 8,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: t13_menu_background,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                mLabel(t13_lbl_for_rent),
                mLabel(t13_lbl_for_sale),
                mLabel(t13_lbl_search),
                mLabel(t13_lbl_profile),
                mLabel(t13_lbl_setting),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
