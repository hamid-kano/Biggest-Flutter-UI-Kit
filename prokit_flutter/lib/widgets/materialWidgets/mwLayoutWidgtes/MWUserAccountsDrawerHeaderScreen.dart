import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/MWUserAccountDrawerHeaderScreen4.dart';

import 'MWUserAccountDrawerHeaderWidget/MWUserAccountDrawerHeaderScreen1.dart';
import 'MWUserAccountDrawerHeaderWidget/MWUserAccountDrawerHeaderScreen2.dart';
import 'MWUserAccountDrawerHeaderWidget/MWUserAccountDrawerHeaderScreen3.dart';

class MWUserAccountsDrawerHeaderScreen extends StatefulWidget {
  static String tag = '/MWUserAccountsDrawerHeaderScreen';

  @override
  MWUserAccountsDrawerHeaderScreenState createState() => MWUserAccountsDrawerHeaderScreenState();
}

class MWUserAccountsDrawerHeaderScreenState extends State<MWUserAccountsDrawerHeaderScreen> {
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
      name: 'UserAccountsDrawerHeader with custom design',
      widget: MWUserAccountDrawerHeaderScreen1(),
    ),
    ListModel(
      name: 'Simple UserAccountsDrawerHeader ',
      widget: MWUserAccountDrawerHeaderScreen2(),
    ),
    ListModel(
      name: 'UserAccountsDrawerHeader with multiple account',
      widget: MWUserAccountDrawerHeaderScreen3(),
    ),
    ListModel(
      name: 'UserAccountsDrawerHeader with custom background',
      widget: MWUserAccountDrawerHeaderScreen4(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: appBar(context, 'UserAccountsDrawerHeader'),
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
