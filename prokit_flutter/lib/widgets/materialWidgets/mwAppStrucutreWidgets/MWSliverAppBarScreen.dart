import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWSliverAppBarWidgets/MWSliverAppBarScreen1.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWSliverAppBarWidgets/MWSliverAppBarScreen2.dart';

class MWSliverAppBarScreen extends StatefulWidget {
  static String tag = '/MWSliverAppBarScreen';

  @override
  MWSliverAppBarScreenState createState() => MWSliverAppBarScreenState();
}

class MWSliverAppBarScreenState extends State<MWSliverAppBarScreen> {
  List<ListModel> example = [
    ListModel(
      name: 'SliverAppBar with ListView',
      widget: MWSliverAppBarScreen1(),
    ),
    ListModel(
      name: 'Parallax SliverAppBar',
      widget: MWSliverAppBarScreen2(),
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
    return Scaffold(
        appBar: appBar(context, 'SliverApp Bar Example'),
        body: ListView.builder(
            itemCount: example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(
                example[index],
                onTap: () {
                  example[index].widget.launch(context);
                },
              );
            }));
  }
}
