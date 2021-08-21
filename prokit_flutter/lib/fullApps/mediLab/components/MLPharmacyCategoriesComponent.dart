import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLMedicationData.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLOnlinePharmacyDetailScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

class MLPharmacyCategoriesComponent extends StatefulWidget {
  static String tag = '/MLPharmacyCategoriesComponent';

  @override
  MLPharmacyCategoriesComponentState createState() => MLPharmacyCategoriesComponentState();
}

class MLPharmacyCategoriesComponentState extends State<MLPharmacyCategoriesComponent> {
  List<MLMedicationData> listOne = mlCategoryMedicineList();
  List<MLMedicationData> listTwo = mlPrescriptionMedicineDataList();

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
    return Container(
      height: context.height(),
      decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
      child: Column(
        children: [
          16.height,
          Row(
            children: [
              Text('Categories', style: boldTextStyle(size: 18)).expand(),
              Text(mlView_all!, style: secondaryTextStyle(color: mlColorBlue, size: 16)),
              4.width,
              Icon(Icons.arrow_forward_ios, color: mlColorBlue, size: 12),
            ],
          ).paddingAll(16.0).onTap(() {
            MLOnlinePharmacyDetailScreen(index: 0).launch(context);
          }),
          16.height,
          HorizontalList(
            padding: EdgeInsets.only(right: 16, left: 16),
            wrapAlignment: WrapAlignment.spaceEvenly,
            itemCount: listOne.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 105,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: boxDecorationWithRoundedCorners(
                        border: Border.all(color: Colors.grey.withOpacity(0.1)),
                        borderRadius: radius(8),
                      ),
                      child: Image.asset((listOne[index].image).validate(), fit: BoxFit.fill).paddingAll(16.0),
                    ),
                    4.height,
                    Text((listOne[index].title).validate(), style: primaryTextStyle(size: 14), maxLines: 2),
                  ],
                ),
              );
            },
          ).onTap(() {
            MLOnlinePharmacyDetailScreen(index: 0).launch(context);
          }),
          32.height,
          HorizontalList(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: listTwo.length,
              spacing: 16,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Image.asset((listTwo[index].image).validate(), height: 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(8.0),
                    8.height,
                    Text((listTwo[index].title).validate(), style: primaryTextStyle(size: 14), maxLines: 2),
                  ],
                );
              }).onTap(() {
            MLOnlinePharmacyDetailScreen(
              index: 0,
            ).launch(context);
          }),
          32.height,
          HorizontalList(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: listTwo.length,
              spacing: 16,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Image.asset((listTwo[index].image).validate(), height: 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(8.0),
                    8.height,
                    Text((listTwo[index].title).validate(), style: boldTextStyle(size: 14), textAlign: TextAlign.center),
                  ],
                );
              }).onTap(() {
            MLOnlinePharmacyDetailScreen(index: 0).launch(context);
          }),
        ],
      ),
    );
  }
}
