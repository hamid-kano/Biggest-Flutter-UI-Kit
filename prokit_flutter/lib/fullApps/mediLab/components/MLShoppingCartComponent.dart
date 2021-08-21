import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLDeliveredData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLShoppingCartComponent extends StatefulWidget {
  static String tag = '/MLShoppingCartComponent';

  @override
  MLShoppingCartComponentState createState() => MLShoppingCartComponentState();
}

class MLShoppingCartComponentState extends State<MLShoppingCartComponent> {
  List<MLDeliveredData> data = mlDeliveredDataList();

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
      children: data.map((e) {
        return Container(
          decoration: boxDecorationRoundedWithShadow(8),
          child: Column(
            children: [
              16.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.width,
                  Image.asset((e.imageOne).validate(), height: 100, width: 90, fit: BoxFit.cover).cornerRadiusWithClipRRect(8.0),
                  12.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((e.medicineOne).validate(), style: boldTextStyle()),
                      4.height,
                      Text(('Tablets : 50 pills').validate(), style: secondaryTextStyle(size: 14)),
                      4.height,
                      Text('\$12.00', style: boldTextStyle(size: 14, color: mlColorBlue)),
                      8.height,
                      Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: boxDecorationWithRoundedCorners(
                          border: Border.all(color: Colors.grey.withOpacity(0.3)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.add, size: 16),
                            8.width,
                            Container(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0, top: 2.0, bottom: 2.0),
                              decoration: boxDecorationWithRoundedCorners(
                                backgroundColor: mlColorDarkBlue,
                              ),
                              child: Text('01', style: secondaryTextStyle(color: white)),
                            ),
                            8.width,
                            Icon(Icons.remove, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              16.height,
            ],
          ),
        ).paddingBottom(16.0);
      }).toList(),
    ).paddingOnly(top: 16, right: 16, left: 16, bottom: 56);
  }
}
