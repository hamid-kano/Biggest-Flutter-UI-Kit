import 'package:prokit_flutter/fullApps/cloudStorage/components/CSDisplayDataInListViewComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/model/CSDataModel.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CSStarredScreen extends StatefulWidget {
  static String tag = '/CSStarredScreen';

  @override
  CSStarredScreenState createState() => CSStarredScreenState();
}

class CSStarredScreenState extends State<CSStarredScreen> {
  List<CSDataModel> onlyStarredData() {
    List<CSDataModel> starredData = [];

    getCloudboxList.forEach((element) {
      if (element.isStared) {
        starredData.add(element);
      }
    });

    return starredData;
  }

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
        child: CSDisplayDataInListViewComponents(
          listOfData: onlyStarredData(),
          isSelect: false,
          isSelectAll: false,
          selectedItem: 0,
          isCopyOrMove: false,
          onListChanged: () {
            setState(() {});
          },
        ).visible(
          onlyStarredData().isNotEmpty,
          defaultWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(CSOfflineImg, height: 120, width: 120),
              Text("Aim for the stars", style: boldTextStyle(size: 20)).paddingOnly(top: 20, bottom: 10),
              Text("After you star an item, it'll show up here, so it's easier to get to", textAlign: TextAlign.center, style: TextStyle(fontSize: 16)).paddingSymmetric(vertical: 10, horizontal: 50),
            ],
          ),
        ),
      ),
    );
  }
}
