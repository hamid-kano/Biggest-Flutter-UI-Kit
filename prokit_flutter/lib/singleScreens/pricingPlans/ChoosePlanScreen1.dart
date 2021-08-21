import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/model/PlanModal.dart';

class ChoosePlanScreen1 extends StatefulWidget {
  @override
  ChoosePlanScreen1State createState() => ChoosePlanScreen1State();
}

class ChoosePlanScreen1State extends State<ChoosePlanScreen1> {
  List<PlanModal> periodModal = [];
  int selectIndex = 0;
  int containerIndex = 0;

  Color screenColor = Color(0xFFEBA791);

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    periodModal.add(
      PlanModal(
        title: '3 days trial',
        subTitle: "\$9 per month",
        optionList: [
          PlanModal(title: 'Weekly Sentiment'),
          PlanModal(title: 'Daily Google rank update'),
          PlanModal(title: 'Daily Analyze'),
        ],
      ),
    );
    periodModal.add(PlanModal(
      title: 'Monthly',
      subTitle: '\$29 per month',
      optionList: [
        PlanModal(title: 'Monthly Sentiment'),
        PlanModal(title: 'Software package'),
        PlanModal(title: 'Email support'),
      ],
    ));
    periodModal.add(
      PlanModal(title: 'Annual', subTitle: '\$19 per month', optionList: [
        PlanModal(title: 'Yearly Sentiment'),
        PlanModal(title: 'Unlimited email support'),
        PlanModal(title: '24/7 support'),
      ]),
    );
    setStatusBarColor(Color(0xFFFBC5BB));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: context.height(),
          width: context.width(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 280,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Image.asset(
                        'images/pricingPlans/planScreen1.jpg',
                        fit: BoxFit.cover,
                        width: context.width(),
                      ),
                      Positioned(
                        child: BackButton(),
                      )
                    ],
                  ),
                ),
                16.height,
                Text('GO Pro', style: boldTextStyle(size: 24, color: screenColor)).paddingLeft(12.0),
                Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        UL(
                          edgeInsets: EdgeInsets.symmetric(horizontal: 16),
                          symbolType: SymbolType.Custom,
                          customSymbol: Container(
                            child: Text('•', style: secondaryTextStyle(size: 20)),
                          ),
                          children: List.generate(periodModal[selectIndex].optionList!.length, (i) {
                            return Text(periodModal[selectIndex].optionList![i].title.validate(), style: primaryTextStyle(size: 18));
                          }),
                        )
                      ],
                    )),
                16.height,
                Text('Choose Period', style: boldTextStyle(size: 24, color: screenColor)).paddingLeft(12.0),
                16.height,
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: periodModal.length,
                  shrinkWrap: true,
                  itemBuilder: (_, int index) {
                    bool value = selectIndex == index;
                    return Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: value ? screenColor.withOpacity(0.3) : context.cardColor,
                          borderRadius: BorderRadius.circular(defaultRadius),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  padding: EdgeInsets.all(2),
                                  child: Icon(
                                    Icons.check,
                                    size: 14,
                                  ).visible(value).center(),
                                  decoration: BoxDecoration(
                                    color: context.cardColor,
                                    shape: BoxShape.circle,
                                    border: value ? Border.all(color: Colors.white) : Border.all(color: Colors.blue),
                                  ),
                                ),
                                12.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(periodModal[index].title.validate(), style: boldTextStyle(size: 16)),
                                    Text(periodModal[index].subTitle.validate(), style: secondaryTextStyle()),
                                  ],
                                ).expand(),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                  child: Text('Buy', style: secondaryTextStyle(color: white)),
                                  decoration: BoxDecoration(color: screenColor.withOpacity(0.8), borderRadius: radius(defaultRadius)),
                                ).visible(value).onTap(() {
                                  snackBar(context, title: "${periodModal[index].title}");
                                }),
                              ],
                            ),
                          ],
                        )).onTap(
                      () {
                        selectIndex = index;

                        setState(() {});
                      },
                      borderRadius: radius(16),
                    ).paddingSymmetric(horizontal: 16, vertical: 4);
                  },
                )
              ],
            ).paddingBottom(16),
          ),
        ),
      ),
    );
  }
}
