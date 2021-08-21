import 'package:flutter/material.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class IMLongPressDraggableScreen extends StatefulWidget {
  static String tag = '/IMLongPressDraggableScreen';

  @override
  _IMLongPressDraggableScreenState createState() => _IMLongPressDraggableScreenState();
}

class _IMLongPressDraggableScreenState extends State<IMLongPressDraggableScreen> {
  Offset position = Offset(20.0, 20.0);

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

  List<ListModel> example = [
    ListModel(
      name: 'Drawable',
    ),
    ListModel(
      name: 'Drawable',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: appStore.scaffoldBackground,
          appBar: appBar(context, 'LongPressDraggable'),
          body: ListView.builder(
              itemCount: example.length,
              itemBuilder: (BuildContext context, index) {
                return ExampleItemWidget(
                  example[index],
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => example[index].widget!));
                  },
                );
              })),
    );
  }
}
