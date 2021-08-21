import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/components/CSCommonFileComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/components/CSFileAndFolderEditingComponents.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/model/CSDataModel.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSImages.dart';

// ignore: must_be_immutable
class CSDisplayDataInGridViewComponents extends StatefulWidget {
  static String tag = '/CSDisplayDataInGridViewComponents';
  List<CSDataModel>? listOfData;
  bool? isSelect;
  bool? isSelectAll;
  int? selectedItem;
  Function(int?, bool?)? onChange;

  CSDisplayDataInGridViewComponents({Key? key, this.listOfData, this.isSelect, this.isSelectAll, this.selectedItem, this.onChange}) : super(key: key);

  @override
  CSDisplayDataInGridViewComponentsState createState() => CSDisplayDataInGridViewComponentsState();
}

class CSDisplayDataInGridViewComponentsState extends State<CSDisplayDataInGridViewComponents> {
  bool isChecked = false;

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
    return GridView.builder(
      padding: EdgeInsets.all(0),
      itemCount: widget.listOfData!.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: widget.isSelect! ? 0.7 : 0.79, crossAxisSpacing: 5),
      itemBuilder: (context, index) {
        return Container(
          //color: Colors.amber,
          padding: widget.isSelect! ? EdgeInsets.all(0) : EdgeInsets.all(4),
          width: context.width() / 2,
          margin: EdgeInsets.only(bottom: 5),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.isSelect!
                  ? Container(
                      padding: EdgeInsets.only(left: 8),
                      alignment: Alignment.centerLeft,
                      width: context.width() / 2,
                      child: Checkbox(
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
                    )
                  : 0.height,
              Container(
                width: context.width() / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(widget.listOfData![index].fileUrl, height: 150, width: 130, fit: BoxFit.cover).onTap(() {
                      if (widget.listOfData![index].fileUrl == CSFolderIcon) {
                        widget.isSelect! ? selectFileAndFolders(index) : CSCommonFileComponents(appBarTitle: widget.listOfData![index].fileName).launch(context);
                      } else {
                        if (widget.isSelect!) {
                          selectFileAndFolders(index);
                        }
                      }
                    }),
                    Text(widget.listOfData![index].fileName!).paddingTop(8),
                    widget.isSelect!
                        ? Wrap(
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
                          )
                        : Wrap(
                            children: [
                              widget.listOfData![index].isDownload
                                  ? IconButton(
                                      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                      iconSize: 18,
                                      icon: Icon(MaterialIcons.offline_pin),
                                      onPressed: () {},
                                    )
                                  : 0.width,
                              widget.listOfData![index].isStared
                                  ? IconButton(
                                      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                      iconSize: 18,
                                      color: CSDarkBlueColor,
                                      icon: Icon(Icons.star),
                                      onPressed: () {},
                                    )
                                  : 0.width,
                              IconButton(
                                  visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                  iconSize: 18,
                                  icon: Icon(MaterialCommunityIcons.dots_vertical_circle_outline),
                                  onPressed: () async {
                                    await showBottomSheetForFileAndFolderEditingOption(context, widget.listOfData![index]);
                                    setState(() {});
                                  }),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ).onTap(() {
          widget.isSelect! ? 0.height : 0.height;
        });
      },
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
