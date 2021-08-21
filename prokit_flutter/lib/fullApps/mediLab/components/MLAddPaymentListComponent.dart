import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLPaymentData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLAddPaymentListComponent extends StatefulWidget {
  @override
  MLAddPaymentListComponentState createState() => MLAddPaymentListComponentState();
}

class MLAddPaymentListComponentState extends State<MLAddPaymentListComponent> {
  List<MLPaymentData> paymentData = mlPaymentDataList();
  int? selectedIndex = 0;
  int _radioSelected = 1;

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
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: paymentData.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 8.0),
          padding: EdgeInsets.all(4),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: radius(12),
            border: Border.all(color: selectedIndex == index ? mlColorBlue : mlColorLightGrey100),
          ),
          child: Row(
            children: [
              Image.asset((paymentData[index].image).validate(), fit: BoxFit.fill, width: 50, height: 50),
              Text((paymentData[index].title).validate(), style: boldTextStyle()).expand(),
              Radio(
                value: 1,
                groupValue: _radioSelected,
                activeColor: selectedIndex == index ? mlColorBlue : mlColorLightGrey100,
                onChanged: (value) {
                  //
                },
              ),
              4.width,
            ],
          ),
        ).onTap(() {
          setState(() {
            selectedIndex = index;
          });
        });
      },
    );
  }
}
