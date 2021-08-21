import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/panel.dart';
import 'package:prokit_flutter/fullApps/hairSalon/model/BHModel.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHDataProvider.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class BHNotifyScreen extends StatefulWidget {
  static String tag = '/SlideUpSheetScreen';

  @override
  SlideUpSheetScreenState createState() => SlideUpSheetScreenState();
}

class SlideUpSheetScreenState extends State<BHNotifyScreen> {
  late List<BHNotifyModel> notifyList;

  @override
  void initState() {
    super.initState();
    notifyList = getNotifyList();
  }

  Widget _scrollingList(ScrollController sc) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      ),
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(BHLocation, width: 14, height: 14),
                8.width,
                Text('Dorthy walks,chicago,Us.', style: TextStyle(fontSize: 14, color: BHAppTextColorSecondary)),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          hintText: 'Find salon Services',
                          prefixIcon: Icon(Icons.search, color: BHGreyColor, size: 20),
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: BHAppDividerColor, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: BHAppDividerColor, width: 0.5),
                          ),
                        ),
                      )),
                ),
                8.width,
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    child: Icon(Icons.cancel, color: BHAppTextColorPrimary),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(border: Border.all(color: BHAppDividerColor, width: 0.5), borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
            16.height,
            ListView.separated(
                separatorBuilder: (context, index) => Divider(color: BHAppDividerColor),
                physics: NeverScrollableScrollPhysics(),
                itemCount: notifyList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: commonCacheImageWidget(notifyList[index].img, 60, width: 90, fit: BoxFit.cover),
                      ),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notifyList[index].name!, style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold)),
                          8.height,
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 14, color: BHAppTextColorSecondary),
                              Text(notifyList[index].address!, style: TextStyle(fontSize: 12, color: BHGreyColor)),
                            ],
                          ),
                          8.height,
                          Row(
                            children: [
                              Text(notifyList[index].rating.toString(), style: TextStyle(fontSize: 12, color: BHGreyColor)),
                              Padding(padding: EdgeInsets.only(left: 4), child: Icon(Icons.star, size: 14, color: BHColorPrimary)),
                              8.width,
                              Text(notifyList[index].distance.toString(), style: TextStyle(fontSize: 12, color: BHGreyColor)),
                              Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Text('km', style: TextStyle(fontSize: 12, color: BHGreyColor)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        panelBuilder: (ScrollController? sc) => _scrollingList(sc!),
        margin: EdgeInsets.symmetric(horizontal: 16),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
    );
  }
}
