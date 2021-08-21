import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';

class T14FinanceScreen1 extends StatefulWidget {
  @override
  _T14FinanceScreen1State createState() => _T14FinanceScreen1State();
}

class _T14FinanceScreen1State extends State<T14FinanceScreen1> {
  List<SubscriptionModel> travelStoryList = getTravelStoryList();
  List<CheckBoxTextModel> finance1CheckBoxTxtList = getFinance1CheckBoxTxtList();
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
        appBar: AppBar(
          backgroundColor: t14_choosePlan_bgColor,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, size: 16),
              onPressed: () {
                finish(context);
              }),
          title: Text(t14_txt_sendMoney.validate(), style: boldTextStyle(size: 16)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(color: t14_choosePlan_bgColor, height: context.height() * 0.4),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                autocorrect: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  hintText: 'Enter a name or email',
                  prefixIcon: Icon(Icons.search, color: BHGreyColor),
                  hintStyle: TextStyle(color: BHGreyColor),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: BHAppDividerColor, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: BHAppDividerColor, width: 0.5),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 70),
                padding: EdgeInsets.only(top: 16, bottom: 16),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t14_txt_recent, style: boldTextStyle(size: 18, color: t14_colorBlue)).paddingOnly(left: 16),
                    Container(
                      height: 90,
                      child: ListView.builder(
                          itemCount: travelStoryList.length,
                          padding: EdgeInsets.all(8),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            SubscriptionModel data = travelStoryList[index];

                            return Container(
                              height: 50,
                              width: 50,
                              margin: EdgeInsets.all(8),
                              decoration: boxDecorationWithShadow(
                                decorationImage: DecorationImage(image: Image.asset(data.img!).image, fit: BoxFit.cover),
                                boxShape: BoxShape.circle,
                              ),
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t14_txt_contact, style: boldTextStyle(size: 16, color: black)),
                          16.height,
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: boxDecorationWithShadow(boxShape: BoxShape.circle, backgroundColor: t14_SuccessBgColor),
                                child: Icon(Icons.add, size: 20, color: t14_txt_BlueColor),
                              ),
                              16.width,
                              Text(t14_txt_InviteFrd, style: boldTextStyle(size: 16, color: t14_txt_BlueColor)),
                            ],
                          ),
                          ListView.builder(
                            itemCount: finance1CheckBoxTxtList.length,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              CheckBoxTextModel data = finance1CheckBoxTxtList[index];

                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: i == index ? Colors.grey : white, width: 2),
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: boxDecorationWithShadow(
                                          decorationImage: DecorationImage(image: Image.asset(data.img!).image, fit: BoxFit.cover),
                                          boxShape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    16.width,
                                    Text(data.name!, style: secondaryTextStyle()).expand(),
                                    16.width,
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: i == index ? t14_btn_checkBoxColor : Colors.transparent,
                                        border: Border.all(width: 1, color: i == index ? white : t14_colorBlue),
                                        shape: BoxShape.circle,
                                      ),
                                      child: i == index ? Icon(Icons.check, size: 18, color: i == index ? white : Colors.transparent) : 0.height,
                                    )
                                  ],
                                ),
                              ).onTap(() {
                                i = index;
                                setState(() {});
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: t14AppButton(
          context,
          btnText: t14_btn_sendMoney,
          bgColor: t14_btn_subscription,
          width: context.width(),
          shape: 10.0,
          txtColor: t14_colorBlue,
        ).paddingOnly(left: 16, right: 16, bottom: 16),
      ),
    );
  }
}
