import 'package:prokit_flutter/fullApps/cloudStorage/components/CSDisplayDataInListViewComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/components/CSDrawerComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/model/CSDataModel.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CSOfflineScreen extends StatefulWidget {
  static String tag = '/CSOfflineScreen';

  @override
  CSOfflineScreenState createState() => CSOfflineScreenState();
}

class CSOfflineScreenState extends State<CSOfflineScreen> {
  List<CSDataModel> onlyDownloadData() {
    List<CSDataModel> offlineData = [];
    getCloudboxList.forEach((element) {
      if (element.isDownload) {
        offlineData.add(element);
      }
    });
    return offlineData;
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

  Future<void> refreshList() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offline", style: boldTextStyle()),
      ),
      drawer: CSDrawerComponents(),
      body: Container(
        child: RefreshIndicator(
          onRefresh: refreshList,
          child: onlyDownloadData().length != 0
              ? SingleChildScrollView(
                  child: CSDisplayDataInListViewComponents(
                    listOfData: onlyDownloadData(),
                    isSelect: false,
                    isCopyOrMove: false,
                    isSelectAll: false,
                    selectedItem: 0,
                    onListChanged: () {
                      setState(() {});
                    },
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(CSOfflineImg, height: 120, width: 120),
                    Text(
                      "Get to your files offline",
                      style: boldTextStyle(size: 20),
                    ).paddingOnly(top: 20, bottom: 10),
                    Wrap(
                      children: [
                        Text("Files you make available offline will show up here.", textAlign: TextAlign.center, style: TextStyle(fontSize: 17)).paddingOnly(top: 10, bottom: 10),
                      ],
                    ),
                    TextButton(onPressed: () {}, child: Text("Learn more", style: TextStyle(color: CSDarkBlueColor)))
                  ],
                ).center(),
        ),
      ),
    );
  }
}
