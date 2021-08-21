import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/components/CSCommonFileComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/components/CSFileAndFolderEditingComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/model/CSDataModel.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSImages.dart';

// ignore: must_be_immutable
class CSDisplayDataInListViewComponents extends StatefulWidget {
  static String tag = '/CSDisplayDataInListViewComponents';
  List<CSDataModel>? listOfData;
  bool? isSelect;
  bool? isSelectAll;
  bool? isCopyOrMove;
  int? selectedItem;
  Function(int?, bool?)? onChange;
  Function()? onListChanged;

  CSDisplayDataInListViewComponents({Key? key, this.listOfData, this.isSelect, this.isSelectAll, this.selectedItem, this.onChange, this.onListChanged, this.isCopyOrMove}) : super(key: key);

  @override
  CSDisplayDataInListViewComponentsState createState() => CSDisplayDataInListViewComponentsState();
}

class CSDisplayDataInListViewComponentsState extends State<CSDisplayDataInListViewComponents> {
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
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(4, 0, 4, 4),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          enabled: widget.isCopyOrMove!
              ? widget.listOfData![index].isFolder
                  ? true
                  : false
              : true,
          contentPadding: EdgeInsets.fromLTRB(8, 4, 4, 8),
          onTap: () {
            if (widget.listOfData![index].isFolder) {
              widget.isSelect!
                  ? selectFileAndFolders(index)
                  : widget.isCopyOrMove!
                      ? toast("Copied ${widget.listOfData![index].fileName}")
                      : CSCommonFileComponents(appBarTitle: widget.listOfData![index].fileName).launch(context);
            } else {
              if (widget.isSelect!) selectFileAndFolders(index);
            }
          },
          visualDensity: VisualDensity(vertical: -4, horizontal: -4),
          title: Row(
            children: [
              Text(widget.listOfData![index].fileName!),
              widget.listOfData![index].isStared
                  ? IconButton(
                      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                      iconSize: 18,
                      color: CSDarkBlueColor,
                      icon: Icon(Icons.star),
                      onPressed: () {
                        widget.listOfData![index].isStared = false;
                        setState(() {});
                      },
                    )
                  : 0.width,
            ],
          ),
          leading: Image.asset(widget.listOfData![index].fileUrl, height: 30, width: 30),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              !widget.isSelect!
                  ? Row(
                      children: [
                        widget.listOfData![index].isDownload
                            ? IconButton(
                                visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                iconSize: 18,
                                icon: Icon(MaterialIcons.offline_pin),
                                onPressed: () {
                                  widget.listOfData![index].isDownload = false;
                                  setState(() {});
                                },
                              )
                            : 0.width,
                        !widget.isCopyOrMove!
                            ? IconButton(
                                visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                icon: Icon(Icons.more_vert),
                                iconSize: 18,
                                onPressed: () async {
                                  await showBottomSheetForFileAndFolderEditingOption(context, widget.listOfData![index]);
                                  widget.onListChanged!.call();
                                  setState(() {});
                                })
                            : 0.width,
                      ],
                    )
                  : Row(
                      children: [
                        widget.listOfData![index].isDownload
                            ? IconButton(
                                visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                iconSize: 18,
                                icon: Icon(MaterialIcons.offline_pin),
                                onPressed: () {},
                              )
                            : 0.width,
                        Checkbox(
                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                          value: widget.listOfData![index].isFileSelect,
                          onChanged: (val) {
                            setState(() {
                              widget.isSelectAll = false;
                              widget.listOfData![index].isFileSelect = val;
                              val! ? widget.selectedItem = widget.selectedItem! + 1 : widget.selectedItem = widget.selectedItem! - 1;
                              widget.onChange!.call(widget.selectedItem, widget.isSelectAll);
                            });
                          },
                        ),
                      ],
                    ),
            ],
          ),
          subtitle: widget.listOfData![index].fileUrl != CSFolderIcon ? Text("size and time display here") : null,
        );
      },
      itemCount: widget.listOfData!.length,
    );
  }

  void selectFileAndFolders(int index) {
    setState(() {
      widget.isSelectAll = false;
      widget.listOfData![index].isFileSelect = !widget.listOfData![index].isFileSelect!;
      widget.listOfData![index].isFileSelect! ? widget.selectedItem = widget.selectedItem! + 1 : widget.selectedItem = widget.selectedItem! - 1;
      widget.onChange!.call(widget.selectedItem, widget.isSelectAll);
    });
  }
}
