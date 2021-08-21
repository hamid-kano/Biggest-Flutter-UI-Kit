import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLVoucherData.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLAddPaymentScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

class MLAddVoucherScreen extends StatefulWidget {
  static String tag = '/MLAddVoucherScreen';

  @override
  MLAddVoucherScreenState createState() => MLAddVoucherScreenState();
}

class MLAddVoucherScreenState extends State<MLAddVoucherScreen> {
  List<MLVoucherData> data = mlVoucherDataList();
  int _radioSelected = 1;
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: mlPrimaryColor,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.height,
                  mlBackToPreviousWidget(context, black),
                  32.height,
                  Text(mlVoucher_title!, style: boldTextStyle(size: 24)),
                  8.height,
                  Text(mlVoucher_subtitle!, style: secondaryTextStyle()),
                  32.height,
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12.0), border: Border.all(color: selectedIndex == index ? mlColorBlue : mlColorLightGrey100)),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16.0),
                                decoration: boxDecorationWithRoundedCorners(
                                  borderRadius: radius(12.0),
                                  backgroundColor: Colors.cyan.withOpacity(0.1),
                                ),
                                child: Image.asset((data[index].image).validate(), fit: BoxFit.fill, width: 45, height: 45),
                              ),
                              8.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text((data[index].title).validate(), style: boldTextStyle()),
                                  4.height,
                                  Text(('[Up-to \$50]'), style: boldTextStyle()),
                                  4.height,
                                  Text(('Exp: 21 April 2021'), style: secondaryTextStyle()),
                                ],
                              ).expand(),
                              Radio(
                                value: 1,
                                groupValue: _radioSelected,
                                activeColor: selectedIndex == index ? mlColorBlue : mlColorLightGrey100,
                                onChanged: (value) {
                                  //
                                },
                              ),
                            ],
                          ),
                        ).paddingBottom(8.0),
                      );
                    },
                  ),
                ],
              ),
            ),
            AppButton(
              width: context.width(),
              color: mlColorDarkBlue,
              child: Text("Add Voucher", style: boldTextStyle(color: white)),
              onTap: () {
                MLAddPaymentScreen().launch(context);
              },
            ).paddingOnly(right: 16, left: 16, bottom: 16),
          ],
        ),
      ),
    );
  }
}
