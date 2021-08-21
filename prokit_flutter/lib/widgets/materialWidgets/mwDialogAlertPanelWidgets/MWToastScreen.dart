import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class MWToastScreen extends StatefulWidget {
  static String tag = '/MWToastScreen';

  @override
  MWToastScreenState createState() => MWToastScreenState();
}

class MWToastScreenState extends State<MWToastScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

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
    ListModel(name: 'Simple Toast'),
    ListModel(name: 'Error Toast'),
    ListModel(name: 'Top Gravity'),
    ListModel(name: 'Center Gravity'),
    ListModel(name: 'Long Toast'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      appBar: appBar(context, 'Toast'),
      key: scaffoldKey,
      body: ListView.builder(
        itemCount: example.length,
        itemBuilder: (BuildContext context, index) {
          return ExampleItemWidget(example[index], onTap: () {
            if (index == 0) {
              toast('This is simple Toast');
            } else if (index == 1) {
              Fluttertoast.showToast(msg: "This is error Toast", backgroundColor: Colors.redAccent, textColor: whiteColor, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_SHORT);
            } else if (index == 2) {
              toast('This is in top Toast', gravity: ToastGravity.TOP);
            } else if (index == 3) {
              toast('Hello ,I\'m in center', gravity: ToastGravity.CENTER);
            } else if (index == 4) {
              toast('This toast will display for long time', length: Toast.LENGTH_LONG);
            }
          });
        },
      ),
    );
  }
}
