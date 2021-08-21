import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/components/CSCopyAndMoveComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/components/CSDisplayDataInGridViewComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/components/CSDisplayDataInListViewComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/components/CSDrawerComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/components/CSSearchBar.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSConstants.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSWidgets.dart';
import 'package:prokit_flutter/main.dart';

class CSCommonFileComponents extends StatefulWidget {
  static String tag = '/CSCommonFileComponents';

  final String? appBarTitle;

  const CSCommonFileComponents({Key? key, this.appBarTitle}) : super(key: key);

  @override
  CSCommonFileComponentsState createState() => CSCommonFileComponentsState();
}

class CSCommonFileComponentsState extends State<CSCommonFileComponents> {
  CrossFadeState state = CrossFadeState.showFirst;
  Sorting? defaultSortingType = Sorting.Name;
  int selectedItem = 0;
  bool isSelect = false;
  bool isSelectAll = false;

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

  void selectAll() {
    isSelectAll = !isSelectAll;

    getCloudboxList.forEach((element) => element.isFileSelect = isSelectAll);

    selectedItem = isSelectAll ? getCloudboxList.length : 0;
    setState(() {});
  }

  List<Widget> actionBarWidgets() {
    List<Widget> listOfActionBarWidgets = [];
    if (selectedItem == 0) {
      listOfActionBarWidgets.add(
        IconButton(color: CSDarkBlueColor, icon: Icon(Icons.done_all), onPressed: () => setState(() => selectAll())),
      );
    } else {
      listOfActionBarWidgets.add(
        IconButton(color: CSDarkBlueColor, icon: Icon(Icons.done_all), onPressed: () => setState(() => selectAll())),
      );
      listOfActionBarWidgets.add(
        IconButton(color: CSDarkBlueColor, icon: Icon(MaterialCommunityIcons.file_download), onPressed: () {}),
      );
      listOfActionBarWidgets.add(PopupMenuButton(
          icon: Icon(Icons.more_vert, color: CSDarkBlueColor),
          onSelected: (dynamic val) async {
            if (val == 2) CSCopyAndMoveComponents(appBarTitle: "Copy $selectedItem items to", listOfData: getCloudboxList).launch(context);
            if (val == 3) CSCopyAndMoveComponents(appBarTitle: "Move $selectedItem items to", listOfData: getCloudboxList).launch(context);
            if (val == 4) {
              bool isSelectedFileDeleted = await (buildDeleteSelectedFileDialog(context, "Delete $selectedItem items?"));
              if (isSelectedFileDeleted) {
                getCloudboxList.removeWhere((element) => element.isFileSelect == true);
                finish(context);
                CSCommonFileComponents(
                  appBarTitle: CSAppName,
                ).launch(context);
              }
              setState(() {});
            }
          },
          itemBuilder: (context) => [
                PopupMenuItem(value: 1, child: Text("Save to Device")),
                PopupMenuItem(value: 2, child: Text("Copy")),
                PopupMenuItem(value: 3, child: Text("Move")),
                PopupMenuItem(value: 4, child: Text("Delete")),
              ]));
    }
    return listOfActionBarWidgets;
  }

  void ascendingOrderList() {
    getCloudboxList.sort((a, b) => a.fileName!.toLowerCase().compareTo(b.fileName!.toLowerCase()));
  }

  void descendingOrderList() {
    getCloudboxList = getCloudboxList.reversed.toList();
  }

  Future showSortingType(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return StatefulBuilder(builder: (BuildContext ctx, StateSetter state) {
            return Wrap(children: [
              Container(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                  Text("Sort By", style: primaryTextStyle(size: 16)),
                  10.height,
                  ListTile(
                    onTap: () {
                      ascendingOrderList();
                      defaultSortingType = Sorting.Name;
                      setState(() {});
                      finish(context);
                    },
                    visualDensity: VisualDensity(horizontal: -4, vertical: -2),
                    contentPadding: EdgeInsets.all(0),
                    title: Text("Name"),
                    leading: Icon(Icons.sort_by_alpha),
                    trailing: Radio(
                        visualDensity: VisualDensity(vertical: -2),
                        value: Sorting.Name,
                        groupValue: defaultSortingType,
                        onChanged: (Sorting? val) => state(() {
                              ascendingOrderList();
                              defaultSortingType = val;
                              setState(() {});
                              finish(context);
                            })),
                  ),
                  ListTile(
                    onTap: () {
                      descendingOrderList();
                      defaultSortingType = Sorting.Modified;
                      setState(() {});
                      finish(context);
                    },
                    visualDensity: VisualDensity(horizontal: -4, vertical: -2),
                    contentPadding: EdgeInsets.all(0),
                    title: Text("Modified"),
                    leading: Icon(Icons.access_time),
                    trailing: Radio(
                        visualDensity: VisualDensity(vertical: -2),
                        value: Sorting.Modified,
                        groupValue: defaultSortingType,
                        onChanged: (Sorting? val) => state(() {
                              descendingOrderList();
                              defaultSortingType = val;
                              setState(() {});
                              finish(context);
                            })),
                  ),
                ]).paddingAll(16),
              ),
            ]);
          });
        });
  }

  Future<void> refreshList() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isSelect) {
          setState(() {
            isSelect = false;
          });
        } else {
          finish(context);
        }
        return false;
      },
      child: Scaffold(
        drawer: isSelect ? null : CSDrawerComponents(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                leading: isSelect
                    ? IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => setState(() {
                          isSelect = false;
                          getCloudboxList.forEach((element) => element.isFileSelect = false);
                          selectedItem = 0;
                        }),
                      )
                    : null,
                actions: isSelect
                    ? actionBarWidgets()
                    : [
                        IconButton(
                          color: CSDarkBlueColor,
                          icon: Icon(Icons.search),
                          onPressed: () => showSearch(context: context, delegate: CSSearchBar(hintText: "Searching in Cloudbox", listData: getCloudboxList)),
                        ),
                        IconButton(
                          color: CSDarkBlueColor,
                          icon: Icon(Feather.check_square, size: 20),
                          onPressed: () => setState(() => isSelect = true),
                        ),
                        PopupMenuButton(
                          icon: Icon(Icons.more_vert, color: CSDarkBlueColor),
                          onSelected: (dynamic val) {
                            if (val == 1) showSortingType(context);
                          },
                          itemBuilder: (context) => [PopupMenuItem(value: 1, child: Text("Sort"))],
                        ),
                      ],
                expandedHeight: isSelect ? 0 : 120,
                flexibleSpace: FlexibleSpaceBar(
                  title: isSelect
                      ? selectedItem == 0
                          ? Text("Select items", style: boldTextStyle(color: black, size: 18))
                          : Text("$selectedItem selected", style: boldTextStyle(color: black, size: 18))
                      : Text(widget.appBarTitle!, style: boldTextStyle(color: black, size: 18)),
                ),
              ),
            ];
          },
          body: Container(
            child: RefreshIndicator(
              onRefresh: refreshList,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.appBarTitle != CSAppName
                        ? !isSelect
                            ? TextButton(
                                style: TextButton.styleFrom(visualDensity: VisualDensity(horizontal: -4, vertical: -2)),
                                onPressed: () {},
                                child: Text("Only you", style: primaryTextStyle(size: 16)),
                              ).paddingLeft(12)
                            : 0.height
                        : 0.height,
                    widget.appBarTitle != CSAppName
                        ? !isSelect
                            ? MaterialButton(
                                onPressed: () {},
                                child: Text("Share", style: boldTextStyle(color: white)),
                                color: CSDarkBlueColor,
                                padding: EdgeInsets.all(0),
                                minWidth: 80,
                                elevation: 0,
                                visualDensity: VisualDensity(horizontal: -4, vertical: -1),
                              ).paddingLeft(16)
                            : 0.height
                        : 0.height,
                    10.height,
                    isSelect
                        ? 0.height
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [Text(defaultSortingType.toString().substring(defaultSortingType.toString().indexOf('.') + 1)), Icon(Icons.keyboard_arrow_down)],
                              ).onTap(() => showSortingType(context)),
                              IconButton(
                                  padding: EdgeInsets.all(0),
                                  iconSize: 12,
                                  color: Colors.blueGrey,
                                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                  icon: state == CrossFadeState.showFirst ? Icon(FontAwesome.list_ul) : Icon(AntDesign.appstore1),
                                  onPressed: () {
                                    setState(() => state = state == CrossFadeState.showFirst ? CrossFadeState.showSecond : CrossFadeState.showFirst);
                                  })
                            ],
                          ).paddingOnly(right: 10, left: 16),
                    isSelect ? 0.height : buildDivider(isFull: true),
                    getCloudboxList.length != 0
                        ? AnimatedCrossFade(
                            duration: Duration(milliseconds: 50),
                            crossFadeState: state,
                            firstChild: CSDisplayDataInGridViewComponents(
                              selectedItem: selectedItem,
                              isSelectAll: isSelectAll,
                              listOfData: getCloudboxList,
                              isSelect: isSelect,
                              onChange: (int? itemCount, bool? selectAll) {
                                selectedItem = itemCount!;
                                isSelectAll = selectAll!;
                                setState(() {});
                              },
                            ),
                            secondChild: CSDisplayDataInListViewComponents(
                              isSelect: isSelect,
                              isSelectAll: isSelectAll,
                              listOfData: getCloudboxList,
                              selectedItem: selectedItem,
                              isCopyOrMove: false,
                              onChange: (int? itemCount, bool? selectAll) {
                                selectedItem = itemCount!;
                                isSelectAll = selectAll!;
                                setState(() {});
                              },
                              onListChanged: () => setState(() {}),
                            ),
                          )
                        : Container(
                            height: 200,
                            child: Text("This folder is empty", style: primaryTextStyle(color: Colors.grey)).center(),
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: isSelect
            ? null
            : FloatingActionButton(
                onPressed: () async {
                  await showBottomSheetForAddingData(context);
                  setState(() {});
                },
                child: Icon(Icons.add, color: Colors.white),
                backgroundColor: CSDarkBlueColor,
              ),
      ),
    );
  }
}
