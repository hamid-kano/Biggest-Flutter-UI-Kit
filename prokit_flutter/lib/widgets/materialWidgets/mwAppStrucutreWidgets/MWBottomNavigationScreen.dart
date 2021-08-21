import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'mwBottomNavigationWidgets/MWBottomNavigationScreen1.dart';
import 'mwBottomNavigationWidgets/MWBottomNavigationScreen2.dart';
import 'mwBottomNavigationWidgets/MWBottomNavigationScreen3.dart';

class MWBottomNavigationScreen extends StatefulWidget {
  static String tag = '/MWBottomNavigationScreen';

  @override
  MWBottomNavigationScreenState createState() => MWBottomNavigationScreenState();
}

class MWBottomNavigationScreenState extends State<MWBottomNavigationScreen> {
  List<ListModel> tabBarType = [
    ListModel(name: 'Bottom Navigation bar with fixed icon and label', widget: MWBottomNavigationScreen1()),
    ListModel(name: 'Bottom Navigation bar with icon ', widget: MWBottomNavigationScreen2()),
    ListModel(name: 'Bottom Navigation bar shifiting', widget: MWBottomNavigationScreen3()),
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
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Bottom Navigation Bar'),
        body: ListView.builder(
          itemCount: tabBarType.length,
          itemBuilder: ((BuildContext context, index) {
            return ExampleItemWidget(
              tabBarType[index],
              onTap: () {
                tabBarType[index].widget.launch(context);
              },
            );
          }),
        ),
      ),
    );
  }
}
