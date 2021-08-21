import 'package:prokit_flutter/fullApps/cloudStorage/components/CSDisplayDataInListViewComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CSRecentScreen extends StatefulWidget {
  static String tag = '/CSRecentScreen';

  @override
  CSRecentScreenState createState() => CSRecentScreenState();
}

class CSRecentScreenState extends State<CSRecentScreen> {
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
      body: Container(
        child: getCloudboxList.length != 0
            ? CSDisplayDataInListViewComponents(
                listOfData: getCloudboxList,
                isSelect: false,
                isSelectAll: false,
                selectedItem: 0,
                isCopyOrMove: false,
                onListChanged: () {
                  setState(() {});
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(CSOfflineImg, height: 120, width: 120),
                    Text("Aim for the Recent", style: boldTextStyle(size: 20)).paddingOnly(top: 20, bottom: 10),
                    Wrap(
                      children: [
                        Text("After you use an item, it'll show up here, so it's easier to get to", textAlign: TextAlign.center, style: TextStyle(fontSize: 16))
                            .paddingSymmetric(vertical: 10, horizontal: 50),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
