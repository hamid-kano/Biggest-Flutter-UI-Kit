import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWDrawerWidgets/MWDrawerScreen1.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWDrawerWidgets/MWDrawerScreen2.dart';

class MWDrawerScreen extends StatefulWidget {
  static String tag = '/MWDrawerScreen';

  @override
  MWDrawerScreenState createState() => MWDrawerScreenState();
}

class MWDrawerScreenState extends State<MWDrawerScreen> {
  List<ListModel> example = [
    ListModel(
      name: 'Simple Drawer',
      widget: MWDrawerScreen1(),
    ),
    ListModel(
      name: 'Shaped Drawer',
      widget: MWDrawerScreen2(),
    ),
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
          appBar: appBar(context, 'Drawer Example'),
          body: ListView.builder(
              itemCount: example.length,
              itemBuilder: (BuildContext context, index) {
                return ExampleItemWidget(
                  example[index],
                  onTap: () {
                    example[index].widget.launch(context);
                  },
                );
              })),
    );
  }
}
