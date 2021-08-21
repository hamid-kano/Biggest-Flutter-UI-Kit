import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';

import '../../main.dart';

class CWDialogScreen extends StatefulWidget {
  static String tag = '/CWDialogScreen';

  @override
  CWDialogScreenState createState() => CWDialogScreenState();
}

class CWDialogScreenState extends State<CWDialogScreen> {
  List<ListModel> example = [
    ListModel(name: 'Simple Dialog'),
    ListModel(name: 'Review Dialog'),
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
      appBar: appBar(context, 'Cupertino Dialog'),
      body: SafeArea(
          child: ListView.builder(
              itemCount: example.length,
              itemBuilder: (BuildContext context, index) {
                return ExampleItemWidget(example[index], onTap: () {
                  if (index == 0) {
                    showDialog(
                        context: context,
                        builder: (_) => CustomTheme(
                              child: CupertinoAlertDialog(
                                title: Text(
                                  "Cupertino Dialog",
                                  style: boldTextStyle(color: appStore.textPrimaryColor, size: 16),
                                ).paddingBottom(6),
                                content: Text("Hey! I'm Coflutter!", style: primaryTextStyle(color: appStore.textSecondaryColor, size: 16)).paddingBottom(6),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text(
                                      'Close me!',
                                      style: primaryTextStyle(),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ),
                            ));
                  } else if (index == 1) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomTheme(
                              child: CupertinoAlertDialog(
                                title: Text(
                                  'Rating',
                                  style: boldTextStyle(size: 16),
                                ).paddingOnly(bottom: 8),
                                content: Column(
                                  children: [
                                    RatingBar(
                                      initialRating: 5,
                                      minRating: 1,
                                      itemSize: 20,
                                      direction: Axis.horizontal,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                  ],
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                    child: Text(
                                      "Cancel",
                                    ),
                                    onPressed: () {
                                      finish(context);
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text('Submit'),
                                    onPressed: () {
                                      toast('Submit');
                                      finish(context);
                                    },
                                  )
                                ],
                              ),
                            ));
                  }
                });
              })),
    );
  }
}
