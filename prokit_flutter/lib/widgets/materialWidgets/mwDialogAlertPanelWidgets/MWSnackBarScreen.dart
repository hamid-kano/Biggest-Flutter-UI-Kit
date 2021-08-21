import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class MWSnackBarScreen extends StatefulWidget {
  static String tag = '/MWSnackBarScreen';

  @override
  MWSnackBarScreenState createState() => MWSnackBarScreenState();
}

class MWSnackBarScreenState extends State<MWSnackBarScreen> {
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
    ListModel(name: 'Simple SnackBar'),
    ListModel(name: 'SnackBar with Action'),
    ListModel(name: 'Custom SnackBar'),
    ListModel(name: 'Infinite SnackBar'),
    ListModel(name: 'Floating SnackBar'),
    ListModel(name: 'Rounded SnackBar'),
    ListModel(name: 'Bordered SnackBar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      appBar: appBar(context, 'SnackBar'),
      key: scaffoldKey,
      body: ListView.builder(
        itemCount: example.length,
        itemBuilder: (BuildContext context, index) {
          return ExampleItemWidget(example[index], onTap: () {
            if (index == 0) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('This is simple SnackBar', style: primaryTextStyle(color: Colors.white)),
              ));
            } else if (index == 1) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('This is SnackBar with Action', style: primaryTextStyle(color: Colors.white)),
                  action: SnackBarAction(
                      label: 'Undo',
                      textColor: Colors.white,
                      onPressed: () {
                        Fluttertoast.showToast(msg: 'Undo pressed');
                      }),
                ),
              );
            } else if (index == 2) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('This is custom SnackBar', style: primaryTextStyle(color: Colors.white)),
                backgroundColor: appColorPrimary,
              ));
            } else if (index == 3) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('This is infinite SnackBar with some info', style: primaryTextStyle(color: Colors.white)),
                duration: Duration(days: 365),
                action: SnackBarAction(
                    label: 'Ok',
                    onPressed: () {
                      ScaffoldMessengerState().hideCurrentSnackBar();
                    }),
              ));
            } else if (index == 4) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('This is Floating SnackBar', style: primaryTextStyle(color: Colors.white)),
                behavior: SnackBarBehavior.floating,
              ));
            } else if (index == 5) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('This is Rounded SnackBar', style: primaryTextStyle(color: Colors.white)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                behavior: SnackBarBehavior.floating,
              ));
            } else if (index == 6) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('This is Bordered SnackBar', style: primaryTextStyle(color: appStore.textPrimaryColor)),
                shape: Border.all(color: appColorPrimary),
                backgroundColor: appStore.appBarColor,
                behavior: SnackBarBehavior.floating,
              ));
            }
          });
        },
      ),
    );
  }
}
