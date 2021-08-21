import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/model/BHModel.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHDataProvider.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'BHDetailScreen.dart';

class BHSpecialOfferViewAllScreen extends StatefulWidget {
  static String tag = '/SpecialOfferViewAllScreen';
  final String? offerData;

  BHSpecialOfferViewAllScreen({this.offerData});

  @override
  BHSpecialOfferViewAllScreenState createState() => BHSpecialOfferViewAllScreenState();
}

class BHSpecialOfferViewAllScreenState extends State<BHSpecialOfferViewAllScreen> {
  late List<BHSpecialOfferModel> specialOfferList;

  @override
  void initState() {
    super.initState();
    specialOfferList = getSpecialOfferList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(widget.offerData!, style: TextStyle(color: BHAppTextColorPrimary, fontSize: 16, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back, color: blackColor),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Wrap(
            runSpacing: 8,
            spacing: 8,
            children: specialOfferList.map((e) {
              return GestureDetector(
                onTap: () {
                  BHDetailScreen().launch(context);
                },
                child: Container(
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
                        child: commonCacheImageWidget(e.img, 100, width: context.width() * 0.43, fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          e.title!,
                          style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: Text(e.subtitle!, style: TextStyle(fontSize: 14, color: BHAppTextColorSecondary)),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ).center(),
        ),
      ),
    );
  }
}
