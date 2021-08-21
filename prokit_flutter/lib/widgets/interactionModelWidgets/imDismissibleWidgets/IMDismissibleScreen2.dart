import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import '../IMDismissibleScreen.dart';

class IMDismissibleScreen2 extends StatefulWidget {
  static String tag = '/IMDismissibleScreen2';

  @override
  _IMDismissibleScreen2State createState() => _IMDismissibleScreen2State();
}

class _IMDismissibleScreen2State extends State<IMDismissibleScreen2> {
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

  ListView generateItemsList() {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: Key(userList[index].tag!),
          child: mDismissibleList(userList[index]),
          background: slideRightBackground(),
          // ignore: missing_return
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.endToStart) {
              final bool? res = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: appStore.appBarColor,
                      content: Text(
                        "Are you sure you want to delete?",
                        style: primaryTextStyle(),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            "Cancel",
                            style: primaryTextStyle(),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(
                            "Delete",
                            style: primaryTextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            setState(() {
                              userList.removeAt(index);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
              return res;
            }
          },
        );
      },
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: primaryTextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.right,
            ),
            20.width,
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'Dismissible with One Side'),
        body: generateItemsList(),
      ),
    );
  }
}
