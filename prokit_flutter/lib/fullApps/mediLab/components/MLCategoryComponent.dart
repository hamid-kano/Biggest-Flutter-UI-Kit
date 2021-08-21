import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLPharmacyProductComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLMedicationData.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLOnlinePharmacyDetailScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLCategoryComponent extends StatefulWidget {
  static String tag = '/MLCategoryComponent';

  @override
  MLCategoryComponentState createState() => MLCategoryComponentState();
}

class MLCategoryComponentState extends State<MLCategoryComponent> {
  List<MLMedicationData> listOne = mlCategoryMedicineList();

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
      decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Prescription Drugs', style: boldTextStyle(size: 20)).paddingOnly(right: 16.0, left: 16.0),
            8.height,
            HorizontalList(
                wrapAlignment: WrapAlignment.spaceEvenly,
                itemCount: listOne.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: boxDecorationWithRoundedCorners(
                          border: Border.all(color: Colors.grey.withOpacity(0.1)),
                          borderRadius: radius(12),
                        ),
                        child: Image.asset((listOne[index].image).validate(), height: 75, width: 75, fit: BoxFit.cover),
                      ),
                      16.height,
                      Text((listOne[index].title).validate(), style: boldTextStyle(size: 14), textAlign: TextAlign.center),
                    ],
                  ).paddingOnly(right: 4.0, left: 4.0).onTap(() {
                    MLOnlinePharmacyDetailScreen(index: 1).launch(context);
                  });
                }),
            8.height,
            Divider(thickness: 0.5),
            MLPharmacyProductComponent()
          ],
        ),
      ).paddingTop(32.0),
    );
  }
}
