import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLMedicationData.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLProductDetailScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLPharmacyProductComponent extends StatefulWidget {
  static String tag = '/MLPharmacyProductComponent';

  @override
  MLPharmacyProductComponentState createState() => MLPharmacyProductComponentState();
}

class MLPharmacyProductComponentState extends State<MLPharmacyProductComponent> {
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
    return Column(
      children: [
        Row(
          children: [
            Text('Products (34)', style: boldTextStyle(size: 20)).expand(),
            Icon(Icons.format_line_spacing, color: black, size: 24),
          ],
        ),
        16.height,
        StaggeredGridView.countBuilder(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          itemCount: listTwo.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: radius(12),
                border: Border.all(color: mlColorLightGrey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image.asset((listTwo[index].image).validate(), height: 120, width: context.width(), fit: BoxFit.cover).cornerRadiusWithClipRRectOnly(topRight: 8, topLeft: 8),
                      Container(
                        decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorDarkBlue),
                        child: Text('-30%', style: secondaryTextStyle(color: white)).paddingOnly(right: 8, left: 8.0),
                      ).paddingOnly(left: 4.0, bottom: 8)
                    ],
                  ),
                  16.height,
                  Row(
                    children: [
                      RatingBarWidget(onRatingChanged: (v) {}, rating: 3.5, size: 14).expand(),
                      4.width,
                      Text(('4.8 (456)'), style: secondaryTextStyle()),
                    ],
                  ).paddingOnly(left: 10, right: 10),
                  8.height,
                  Text((listTwo[index].title).validate(), style: boldTextStyle()).paddingOnly(left: 10, right: 10),
                  2.height,
                  Text(('5 ml').validate(), style: secondaryTextStyle()).paddingOnly(left: 10, right: 10),
                  4.height,
                  Row(
                    children: [
                      Text(('\$25.00').validate(), style: boldTextStyle()),
                      4.width,
                      Text(('\$95.00').validate(), style: boldTextStyle(color: Colors.grey.shade500, decoration: TextDecoration.lineThrough)),
                    ],
                  ).paddingOnly(left: 10, right: 10),
                  12.height,
                ],
              ),
            ).onTap(() {
              MLProductDetailScreen().launch(context);
            });
          },
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
      ],
    ).paddingAll(16.0);
  }
}
