import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'CWTabBarWidgets/CWTabBarScreen1.dart';
import 'CWTabBarWidgets/CWTabBarScreen2.dart';
import 'CWTabBarWidgets/CWTabBarScreen3.dart';

class CWTabBarScreen extends StatefulWidget {
  static String tag = '/CWTabBarScreen';

  @override
  CWTabBarScreenState createState() => CWTabBarScreenState();
}

class CWTabBarScreenState extends State<CWTabBarScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  List<ListModel> example = [
    ListModel(
      name: 'TabBar with Icon',
      widget: CWTabBarScreen1(),
    ),
    ListModel(
      name: 'TabBar with Label',
      widget: CWTabBarScreen2(),
    ),
    ListModel(
      name: 'TabBar with Custom Widget',
      widget: CWTabBarScreen3(),
    ),
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'TabBar Example'),
      body: ListView.builder(
        itemCount: example.length,
        itemBuilder: (BuildContext context, index) {
          return ExampleItemWidget(
            example[index],
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => example[index].widget!));
            },
          );
        },
      ),
    );
  }
}
