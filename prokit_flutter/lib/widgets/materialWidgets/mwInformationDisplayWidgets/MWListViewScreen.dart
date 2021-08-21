import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';
import 'MWListViewWidget/MWListViewScreen1.dart';
import 'MWListViewWidget/MWListViewScreen2.dart';
import 'MWListViewWidget/MWListViewScreen3.dart';
import 'MWListViewWidget/MWListViewScreen4.dart';

class MWListViewScreen extends StatefulWidget {
  static String tag = '/MWListViewScreen';

  @override
  _MWListViewScreenState createState() => _MWListViewScreenState();
}

class _MWListViewScreenState extends State<MWListViewScreen> {
  List<ListModel> example = [
    ListModel(name: 'Vertical ListView', widget: MWListViewScreen1()),
    ListModel(name: 'ListWheelScrollView', widget: MWListViewScreen2()),
    ListModel(name: 'Horizontal ListView', widget: MWListViewScreen3()),
    ListModel(name: 'BouncingScroll ListView', widget: MWListViewScreen4()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'ListView'),
        body: ListView.builder(
            itemCount: example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(example[index], onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => example[index].widget!));
              });
            }));
  }
}
