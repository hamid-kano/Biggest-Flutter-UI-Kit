import 'package:prokit_flutter/fullApps/cloudStorage/components/CSDisplayDataInListViewComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/components/CSSearchBar.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/model/CSDataModel.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSImages.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CSCopyAndMoveComponents extends StatefulWidget {
  static String tag = '/CSCopyAndMoveComponents';

  final List<CSDataModel>? listOfData;
  final String? appBarTitle;

  const CSCopyAndMoveComponents({Key? key, this.listOfData, this.appBarTitle}) : super(key: key);

  @override
  CSCopyAndMoveComponentsState createState() => CSCopyAndMoveComponentsState();
}

class CSCopyAndMoveComponentsState extends State<CSCopyAndMoveComponents> {
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.close, color: CSDarkBlueColor),
            onPressed: () {
              finish(context);
            }),
        title: Text(widget.appBarTitle!),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: CSDarkBlueColor),
              onPressed: () {
                showSearch(context: context, delegate: CSSearchBar(hintText: "Searching in Cloudbox", listData: getCloudboxList));
              }),
          IconButton(
              icon: Icon(Icons.create_new_folder, color: CSDarkBlueColor),
              onPressed: () async {
                var folderName = await buildCreateFolderDialog(context);
                if (folderName != null) {
                  getCloudboxList.add(CSDataModel(fileName: folderName, fileUrl: CSFolderIcon, isFolder: true));
                }
                setState(() {});
              }),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
              width: size.width,
              height: size.height * 0.8,
              child: SingleChildScrollView(
                  child: CSDisplayDataInListViewComponents(
                listOfData: widget.listOfData,
                isSelectAll: false,
                isSelect: false,
                isCopyOrMove: true,
              ))),
          Positioned(
            bottom: 5,
            right: 10,
            child: MaterialButton(height: 50, minWidth: 80, color: CSDarkBlueColor, onPressed: () {}, child: Text("Paste", style: boldTextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }
}
