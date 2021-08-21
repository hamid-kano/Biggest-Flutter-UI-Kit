import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';
import 'package:prokit_flutter/main.dart';

class T14SubscriptionScreen4 extends StatefulWidget {
  @override
  _T14SubscriptionScreen4State createState() => _T14SubscriptionScreen4State();
}

class _T14SubscriptionScreen4State extends State<T14SubscriptionScreen4> {
  List<CheckBoxTextModel> subscription4checkBoxTxtList = getSubscription4CheckBoxTxtList();
  List<ChoosePlanModel> subscription4choosePlanList = getSubscription4ChoosePlanList();
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: t14_colorWhite,
        title: Text(t14_txt_subscription, style: boldTextStyle(color: t14_colorBlue)),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(AntDesign.closecircleo, size: 20),
              onPressed: () {
                finish(context);
              })
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t14_txt_SubScription_title, style: boldTextStyle(size: 20, color: t14_colorBlue)),
                16.height,
                Text(t14_txt_SubScription_SubTitle, style: secondaryTextStyle(color: t14_colorBlue)),
                ListView.builder(
                    itemCount: subscription4checkBoxTxtList.length,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      CheckBoxTextModel data = subscription4checkBoxTxtList[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: new BoxDecoration(
                                  color: data.checkBox! ? t14_btn_checkBoxColor : Colors.transparent,
                                  border: Border.all(
                                    width: 1,
                                    color: data.checkBox! ? Colors.transparent : appStore.textPrimaryColor!,
                                  ),
                                  shape: BoxShape.circle),
                              child: Theme(
                                data: ThemeData(unselectedWidgetColor: Colors.transparent),
                                child: Checkbox(
                                  value: data.checkBox,
                                  onChanged: (state) {
                                    setState(() {
                                       data.checkBox = state;
                                    });
                                  },
                                  activeColor: Colors.transparent,
                                  checkColor: t14_colorWhite,
                                  materialTapTargetSize: MaterialTapTargetSize.padded,
                                ),
                              ),
                            ),
                            16.width,
                            Text(data.name!, style: boldTextStyle(size: 16)),
                          ],
                        ),
                      ).onTap(() {
                        data.checkBox = !data.checkBox!;
                        setState(() {});
                      });
                    }),
                ListView.builder(
                    itemCount: subscription4choosePlanList.length,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      ChoosePlanModel data = subscription4choosePlanList[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.all(16),
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          backgroundColor: i == index ? t14_choosePlan_bgColor : white,
                          border: Border.all(color: t14_colorBlue.withOpacity(0.2), width: 0.8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.title!, style: primaryTextStyle(size: 16)),
                            Text(data.subTitle!, style: primaryTextStyle(size: 14)),
                          ],
                        ),
                      ).onTap(() {
                        i = index;
                        setState(() {});
                      });
                    }),
                50.height,
              ],
            ).paddingAll(16),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: t14AppButton(
              context,
              btnText: t14_btn_StartSubsciption,
              bgColor: t14_btn_subscription,
              width: context.width(),
              shape: 10.0,
              txtColor: t14_colorBlue,
            ).paddingAll(16),
          ),
        ],
      ),
    );
  }
}
