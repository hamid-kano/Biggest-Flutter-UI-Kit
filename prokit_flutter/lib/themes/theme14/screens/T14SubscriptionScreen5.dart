import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14SubscriptionScreen5 extends StatefulWidget {
  @override
  _T14SubscriptionScreen5State createState() => _T14SubscriptionScreen5State();
}

class _T14SubscriptionScreen5State extends State<T14SubscriptionScreen5> {
  List<ChoosePlanModel> subscription5choosePlanList = getSubscription5ChoosePlanList();
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScroll) {
          return [
            SliverAppBar(
              expandedHeight: 230.0,
              floating: false,
              pinned: false,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    icon: Icon(Icons.close, size: 20),
                    onPressed: () {
                      finish(context);
                    })
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(t14_travel2, fit: BoxFit.cover),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: subscription5choosePlanList.length,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    ChoosePlanModel data = subscription5choosePlanList[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        backgroundColor: i == index ? t14_choosePlan_bgColor : white,
                        border: Border.all(color: t14_colorBlue.withOpacity(0.2), width: 0.8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.title!, style: boldTextStyle(size: 16)),
                              4.height,
                              Text(data.subTitle!, style: primaryTextStyle(size: 14, color: i == index ? white : t14_colorBlue)),
                            ],
                          ),
                          Container(
                              width: 25,
                              height: 25,
                              decoration: new BoxDecoration(
                                  color: data.checkBox! ? Colors.transparent : white,
                                  border: Border.all(
                                    width: 1,
                                    color: i == index ? white : t14_colorBlue,
                                  ),
                                  shape: BoxShape.circle),
                              child: i == index ? Icon(Icons.check, size: 18) : 0.height)
                        ],
                      ),
                    ).onTap(() {
                      i = index;
                      setState(() {});
                    });
                  }),
              16.height,
              t14AppButton(
                context,
                btnText: t14_btn_Choose,
                bgColor: t14_btn_subscription,
                width: context.width(),
                shape: 10.0,
                txtColor: t14_colorBlue,
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(t14_txt_Privacy, style: secondaryTextStyle(size: 14)),
                  16.width,
                  Container(height: 12, width: 2, color: t14_colorBlue.withOpacity(0.3)),
                  16.width,
                  Text(t14_txt_Terms, style: secondaryTextStyle(size: 14)),
                ],
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
