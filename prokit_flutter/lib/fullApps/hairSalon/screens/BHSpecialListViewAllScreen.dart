import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/model/BHModel.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHDataProvider.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'BHDetailScreen.dart';

class BHSpecialListViewAllScreen extends StatefulWidget {
  static String tag = '/SpecialListViewAllScreen';

  final String? specialList;

  BHSpecialListViewAllScreen({this.specialList});

  @override
  BHSpecialListViewAllScreenState createState() => BHSpecialListViewAllScreenState();
}

class BHSpecialListViewAllScreenState extends State<BHSpecialListViewAllScreen> {
  late List<BHBestSpecialModel> bestSpecialList;

  @override
  void initState() {
    super.initState();
    bestSpecialList = getSpecialList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(widget.specialList!, style: TextStyle(color: BHAppTextColorPrimary, fontSize: 16, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back, color: blackColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Wrap(
          runSpacing: 8,
          spacing: 8,
          children: bestSpecialList.map((e) {
            return GestureDetector(
              onTap: () {
                BHDetailScreen().launch(context);
              },
              child: Container(
                //width: context.width() * 0.45,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      child: commonCacheImageWidget(e.img, 110, width: context.width() * 0.43, fit: BoxFit.cover),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        e.title!,
                        style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(e.subTitle!, style: TextStyle(fontSize: 14, color: BHAppTextColorSecondary)),
                    ),
                    8.height,
                  ],
                ),
              ),
            );
          }).toList(),
        ).center(),
      ),
    );
  }
}
