import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'MWTabBarWidgets/MWTabBarScreen1.dart';
import 'MWTabBarWidgets/MWTabBarScreen2.dart';
import 'MWTabBarWidgets/MWTabBarScreen3.dart';
import 'MWTabBarWidgets/MWTabBarScreen4.dart';

class MWTabBarScreen extends StatefulWidget {
  static String tag = '/MWTabBarScreen';

  @override
  MWTabBarScreenState createState() => MWTabBarScreenState();
}

class MWTabBarScreenState extends State<MWTabBarScreen> {
  List<ListModel> tabBarType = [
    ListModel(name: 'Simple Tab Bar', widget: MWTabBarScreen1()),
    ListModel(name: 'Title with icon tab', widget: MWTabBarScreen2()),
    ListModel(name: 'Icon tab', widget: MWTabBarScreen3()),
    ListModel(name: 'Scrollable Tab', widget: MWTabBarScreen4()),
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
      appBar: appBar(context, 'TabBar Example'),
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
    ));
  }
}
