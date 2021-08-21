import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/model/CSDataModel.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSConstants.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSWidgets.dart';

class CSShareComponents extends StatefulWidget {
  static String tag = '/CSShareComponents';

  final CSDataModel? dataModel;

  const CSShareComponents({Key? key, this.dataModel}) : super(key: key);

  @override
  CSShareComponentsState createState() => CSShareComponentsState();
}

class CSShareComponentsState extends State<CSShareComponents> {
  TextEditingController controller = TextEditingController();
  AccessOption? defaultAccess = AccessOption.edit;

  bool isTextEmpty = false;

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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share \"${widget.dataModel!.fileName}\"", style: boldTextStyle(size: 20)),
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        height: context.height(),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              10.height,
              Text("Send to", style: boldTextStyle()),
              10.height,
              Row(children: [
                Expanded(
                  child: TextField(
                    style: primaryTextStyle(size: 20),
                    controller: controller,
                    onChanged: (val) {
                      val.isEmpty ? isTextEmpty = false : isTextEmpty = true;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email, name or group",
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      hintStyle: secondaryTextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                10.width,
                PopupMenuButton(
                    child: Text("Can Edit", style: boldTextStyle(size: 14)),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    onSelected: (dynamic val) {},
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                              contentPadding: EdgeInsets.all(0),
                              title: Text("Can edit"),
                              subtitle: Text("Lets them view, comment and edit", style: primaryTextStyle(size: 12)),
                              leading: Radio(
                                value: AccessOption.edit,
                                groupValue: defaultAccess,
                                onChanged: (AccessOption? val) => setState(() => defaultAccess = val),
                                visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                contentPadding: EdgeInsets.all(0),
                                title: Text("Can view"),
                                subtitle: Text("Lets them view and comment but not edit", style: primaryTextStyle(size: 12)),
                                leading: Radio(
                                  value: AccessOption.view,
                                  groupValue: defaultAccess,
                                  onChanged: (AccessOption? val) => setState(() => defaultAccess = val),
                                  visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                ),
                              ))
                        ])
              ]),
              10.height,
              buildDivider(isFull: true),
              10.height,
              TextField(
                  decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16),
                labelText: "Optional message",
                labelStyle: primaryTextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: CSGreyColor),
                  borderRadius: BorderRadius.zero,
                ),
              ))
            ]),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                //alignment: Alignment.center,
                width: context.width(),
                height: 50,
                child: Text("Share", style: boldTextStyle(size: 16, color: Colors.white)).center(),
                color: isTextEmpty ? CSDarkBlueColor : Colors.grey,
              ).onTap(() {
                if (isTextEmpty) {
                  widget.dataModel!.isShared = true;
                }
                setState(() {});
                finish(context);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
