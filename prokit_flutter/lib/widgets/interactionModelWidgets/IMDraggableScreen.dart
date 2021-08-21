import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class IMDraggableScreen extends StatefulWidget {
  static String tag = '/IMDraggableScreen';

  @override
  _IMDraggableScreenState createState() => _IMDraggableScreenState();
}

class _IMDraggableScreenState extends State<IMDraggableScreen> with TickerProviderStateMixin {
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
      name: 'Drawable',
    ),
    ListModel(
      name: 'Drawable',
    ),
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  var mData = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(
                example[index],
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => example[index].widget!));
                },
              );
            }));
  }
}
