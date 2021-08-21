import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class CWActionSheetScreen extends StatefulWidget {
  static String tag = '/CWActionSheetScreen';

  @override
  CWActionSheetScreenState createState() => CWActionSheetScreenState();
}

class CWActionSheetScreenState extends State<CWActionSheetScreen> {
  List<ListModel> example = [
    ListModel(name: 'Cupertino action sheet 1'),
    ListModel(name: 'Cupertino action sheet 2'),
    ListModel(name: 'Cupertino action sheet 3'),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final action1 = CustomTheme(
      child: CupertinoActionSheet(
        title: Text(
          'Cupertino Action Sheet Example',
          style: boldTextStyle(size: 18),
        ),
        message: Text('It\'s a demo for cupertino action sheet.'),
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {
                toast('OK');
                finish(context);
              },
              child: Text('OK', style: primaryTextStyle(size: 18)))
        ],
        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              finish(context);
            },
            child: Text(
              'Cancel',
              style: primaryTextStyle(color: redColor, size: 18),
            )),
      ),
    );

    final action2 = CustomTheme(
      child: CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              finish(context);
              toast('Male Clicked');
            },
            child: Text(' 💁‍♂️ Male', style: primaryTextStyle(size: 18)),
            isDefaultAction: true,
          ),
          CupertinoActionSheetAction(
              onPressed: () {
                finish(context);
                toast('Female Clicked');
              },
              child: Text(' 💁‍♀️ Female', style: primaryTextStyle(size: 18)))
        ],
        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              finish(context);
            },
            child: Text(
              'Cancel',
              style: primaryTextStyle(color: redColor, size: 18),
            )),
      ),
    );

    final action3 = CustomTheme(
      child: CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {
                toast('Share App');
                finish(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Share App',
                    style: primaryTextStyle(size: 18),
                  ),
                  Icon(
                    Icons.share,
                    color: appStore.iconColor,
                  )
                ],
              )),
          CupertinoActionSheetAction(
            onPressed: () {
              toast('More by this Developer');
              finish(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'More by this Developer',
                  style: primaryTextStyle(size: 18),
                ),
                Icon(
                  Icons.supervised_user_circle,
                  color: appStore.iconColor,
                )
              ],
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              finish(context);
            },
            child: Text(
              'Cancel',
              style: primaryTextStyle(color: redColor, size: 18),
            )),
      ),
    );

    return Scaffold(
      appBar: appBar(context, 'Cupertino action sheet'),
      body: SafeArea(
        child: ListView.builder(
            itemCount: example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(example[index], onTap: () {
                if (index == 0) {
                  showCupertinoModalPopup(context: context, builder: (BuildContext context) => action1);
                } else if (index == 1) {
                  showCupertinoModalPopup(context: context, builder: (BuildContext context) => action2);
                } else if (index == 2) {
                  showCupertinoModalPopup(context: context, builder: (BuildContext context) => action3);
                }
              });
            }),
      ),
    );
  }
}
