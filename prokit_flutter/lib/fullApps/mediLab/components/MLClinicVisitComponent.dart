import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLDepartmentData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLClinicVisitComponent extends StatefulWidget {
  @override
  MLClinicVisitComponentState createState() => MLClinicVisitComponentState();
}

class MLClinicVisitComponentState extends State<MLClinicVisitComponent> {
  static String tag = '/MLClinicVisitComponent';
  List<MLDepartmentData> departmentList = mlServiceListDataList();
  int? selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          16.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Clinic Visit', style: boldTextStyle(size: 24)),
                  8.height,
                  Text('Find the service you are', style: secondaryTextStyle()),
                  16.height,
                ],
              ).expand(),
              mlRoundedIconContainer(Icons.search, mlColorBlue),
              16.width,
              mlRoundedIconContainer(Icons.calendar_view_day_outlined, mlColorBlue),
            ],
          ).paddingOnly(right: 16.0, left: 16.0),
          8.height,
          ListView.builder(
            padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 70),
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: departmentList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(8.0),
                decoration: boxDecorationWithRoundedCorners(
                  border: Border.all(color: selectedIndex == index ? mlColorBlue : mlColorLightGrey100),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset((departmentList[index].image)!.validate(), height: 75, width: 75, fit: BoxFit.fill).paddingAll(8.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text((departmentList[index].title)!.validate(), style: boldTextStyle(size: 18)),
                            8.height,
                            Text((departmentList[index].subtitle).validate(), style: secondaryTextStyle()),
                            8.height,
                            Text((departmentList[index].price).validate(), style: boldTextStyle(color: mlColorDarkBlue)),
                          ],
                        ),
                      ],
                    ),
                    8.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(child: Icon(Icons.watch_later_outlined, size: 14)),
                              TextSpan(text: ' next available time', style: secondaryTextStyle()),
                            ],
                          ),
                        ),
                        Text('Dec 23 at 8:30 AM', style: secondaryTextStyle(color: Colors.black87)),
                      ],
                    ).paddingOnly(left: 8, right: 8),
                    8.height,
                  ],
                ),
              ).onTap(
                () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
