import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/model/BHModel.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHDataProvider.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'BHBookAppointmentScreen.dart';

class BHPackageOffersScreen extends StatefulWidget {
  static String tag = '/PackageOffersScreen';

  @override
  BHPackageOffersScreenState createState() => BHPackageOffersScreenState();
}

class BHPackageOffersScreenState extends State<BHPackageOffersScreen> {
  late List<BHIncludeServiceModel> includeServiceList;

  @override
  void initState() {
    super.initState();
    includeServiceList = getIncludeServicesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            BHDashedBoardImage3,
            height: 220,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Personality Girl Event', style: TextStyle(fontSize: 16, color: BHAppTextColorSecondary, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('\$100', style: TextStyle(color: BHAppTextColorPrimary, decoration: TextDecoration.lineThrough)),
                          8.width,
                          Text('\$89', style: TextStyle(color: BHColorPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  8.height,
                  Divider(color: BHAppDividerColor),
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 16),
                    child: Text(BHTxtTimeOfEvent, style: TextStyle(color: BHAppTextColorPrimary, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    children: [
                      Text('From', style: TextStyle(color: Colors.grey)),
                      16.width,
                      Text('7:30 AM - June 10,2020', style: TextStyle(color: BHAppTextColorPrimary)),
                    ],
                  ),
                  16.height,
                  Row(
                    children: [
                      Text('To', style: TextStyle(color: Colors.grey)),
                      35.width,
                      Text('5:30 AM - June 25,2020', style: TextStyle(color: BHAppTextColorPrimary)),
                    ],
                  ),
                  16.height,
                  Text(BHTxtServicesInclude, style: TextStyle(color: BHAppTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 14)),
                  ListView.builder(
                      itemCount: includeServiceList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 16),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                child: commonCacheImageWidget(includeServiceList[index].serviceImg, 80, width: 80, fit: BoxFit.cover),
                              ),
                              8.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    includeServiceList[index].serviceName!,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: BHAppTextColorPrimary),
                                  ),
                                  8.height,
                                  Row(
                                    children: [
                                      Text(
                                        includeServiceList[index].time!,
                                        style: TextStyle(fontSize: 14, color: BHAppTextColorSecondary),
                                      ),
                                      8.width,
                                      Text(
                                        '\$${includeServiceList[index].price.toString()}',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: BHColorPrimary),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        primary: BHColorPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        BHBookAppointmentScreen().launch(context);
                      },
                      child: Text(BHBtnBookAppointment, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  //16.height,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
