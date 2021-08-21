import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14SubscriptionScreen7 extends StatefulWidget {
  @override
  _T14SubscriptionScreen7State createState() => _T14SubscriptionScreen7State();
}

class _T14SubscriptionScreen7State extends State<T14SubscriptionScreen7> {
  List<ChoosePlanModel> subscription4DiscountList = getSubscription7DiscountList();
  int? i;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: t14_colorLightCrem1,
              height: context.height() * 0.4,
            ),
            Row(
              children: [
                Text(t14_txt_Subscription, textAlign: TextAlign.center, style: boldTextStyle()).expand(),
                IconButton(
                    icon: Icon(Icons.close, size: 20),
                    onPressed: () {
                      finish(context);
                    }),
              ],
            ),
            Align(alignment: Alignment.topCenter, child: Image.asset(t14_KingIcon, height: 20, width: 20, color: t14_colorWhite)).paddingOnly(top: 70),
            Container(
              margin: EdgeInsets.only(top: 100, left: 16, right: 16),
              padding: EdgeInsets.all(16),
              decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.all(Radius.circular(16)), backgroundColor: white),
              height: context.height(),
              width: context.width(),
              child: Column(
                children: [
                  Text(t14_txt_yourBalance, textAlign: TextAlign.center, style: primaryTextStyle()),
                  Text('6,354', textAlign: TextAlign.center, style: boldTextStyle(color: t14_colorBlue, size: 20)),
                  8.height,
                  Divider(),
                  8.height,
                  Row(
                    children: [
                      Icon(Entypo.dot_single, size: 20, color: t14_colorBlue),
                      8.width,
                      Text(t14_txt_CollectCoin, style: secondaryTextStyle(size: 14)),
                    ],
                  ),
                  8.height,
                  Row(
                    children: [
                      Icon(Icons.check, size: 16, color: t14_OppsColor1),
                      8.width,
                      Text(t14_txt_stayMonth, style: secondaryTextStyle(size: 14, color: t14_OppsColor1)),
                    ],
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      t14AppButton(
                        context,
                        btnText: t14_btn_aboutVip,
                        bgColor: t14_btn_aboutVip_bgColor,
                        width: 110,
                        shape: 10.0,
                        txtColor: t14_colorBlue,
                      ).paddingAll(16),
                      t14AppButton(context, btnText: t14_btn_bye, bgColor: t14_OppsColor, width: 110, shape: 10.0, txtColor: white).paddingAll(16),
                    ],
                  ),
                  ListView.separated(
                      itemCount: subscription4DiscountList.length,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      separatorBuilder: (BuildContext context, int index) => Divider(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        ChoosePlanModel data = subscription4DiscountList[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: new BoxDecoration(
                                    color: data.checkBox! ? t14_cBox_color : Colors.transparent,
                                    border: Border.all(
                                      width: 1,
                                      color: data.checkBox! ? white : t14_colorBlue,
                                    ),
                                    shape: BoxShape.circle),
                                child: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.transparent,
                                  ),
                                  child: Checkbox(
                                    value: data.checkBox,
                                    onChanged: (state) {
                                      setState(() {
                                         data.checkBox = state;
                                      });
                                    },
                                    activeColor: Colors.transparent,
                                    checkColor: t14_OppsColor,
                                    materialTapTargetSize: MaterialTapTargetSize.padded,
                                  ),
                                ),
                              ),
                              16.width,
                              Text(data.title!, style: secondaryTextStyle(color: t14_colorBlue)).expand(),
                              Text(data.subTitle!, style: secondaryTextStyle(color: t14_colorBlue)),
                            ],
                          ),
                        ).onTap(() {
                          // i = index;
                          data.checkBox = !data.checkBox!;
                          setState(() {});
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
