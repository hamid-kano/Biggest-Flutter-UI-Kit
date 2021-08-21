import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/model/PlanModal.dart';

class ChoosePlanScreen7 extends StatefulWidget {
  @override
  ChoosePlanScreen7State createState() => ChoosePlanScreen7State();
}

class ChoosePlanScreen7State extends State<ChoosePlanScreen7> {
  List<PlanModal> planPeriodList = [];
  Color containerUltimate = Color(0xFF17C4AB);
  Color containerMaster = Color(0xFFE97979);
  Color containerAdvanced = Color(0xFFF7C96C);
  Color containerCustom = Color(0xFF55BBEA);
  PageController controller = PageController(viewportFraction: 0.85);
  int _index = 0;
  int containerIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    planPeriodList.add(
      PlanModal(
        title: 'Master',
        subTitle: '2600',
        currency: '₹',
        period: 'month',
        containerColor: containerMaster,
        price: '13,000',
        planPriceSubTitle: 'For 5 month up to Apr 2018',
        priceLinthroughTitle: '13,500',
        icon: Icons.add_to_photos_sharp,
        iconColor: containerMaster,
        optionList: [
          PlanModal(
            title: 'Learn',
            subTitle: 'Unlimited access to video  lectures adaptive practice.',
            isAvailable: true,
          ),
          PlanModal(
            title: 'Tests',
            subTitle: 'Create Custom challanges invite friends and access test reports',
            isAvailable: false,
          ),
          PlanModal(
            title: 'Doubts',
            subTitle: 'Get unlimited doubts solved via chat with our subjects experts ',
            isAvailable: false,
          )
        ],
      ),
    );

    planPeriodList.add(
      PlanModal(
        title: 'Advanced',
        subTitle: '3900',
        isAvailable: false,
        currency: '₹',
        period: 'month',
        containerColor: containerAdvanced,
        price: '19,000',
        planPriceSubTitle: 'For 5 month up to Apr 2018',
        priceLinthroughTitle: '19,500',
        icon: Icons.add_to_photos_sharp,
        iconColor: containerAdvanced,
        optionList: [
          PlanModal(
            title: 'Learn',
            subTitle: 'Unlimited access to video  lectures adaptive practice.',
            isAvailable: true,
          ),
          PlanModal(title: 'Tests', subTitle: 'Create Custom challanges invite friends and access test reports', isAvailable: true),
          PlanModal(
            title: 'Doubts',
            subTitle: 'Get unlimited doubts solved via chat with our subjects experts ',
            isAvailable: false,
          ),
        ],
      ),
    );

    planPeriodList.add(
      PlanModal(
        title: 'Ultimate',
        subTitle: '5200',
        currency: '₹',
        period: 'month',
        containerColor: containerUltimate,
        price: '25,000',
        planPriceSubTitle: 'For 5 month up to Apr 2018',
        priceLinthroughTitle: '26000',
        icon: Icons.add_to_photos_sharp,
        iconColor: containerUltimate,
        optionList: [
          PlanModal(
            title: 'Learn',
            subTitle: 'Unlimited access to video  lectures adaptive practice.',
            isAvailable: true,
          ),
          PlanModal(
            title: 'Tests',
            subTitle: 'Create Custom challanges invite friends and access test reports',
            isAvailable: true,
          ),
          PlanModal(
            title: 'Doubts',
            subTitle: 'Get unlimited doubts solved via chat with our subjects experts ',
            isAvailable: true,
          )
        ],
      ),
    );
    planPeriodList.add(
      PlanModal(
        title: 'Custom',
        subTitle: '1300',
        period: 'month',
        price: 'Select one of the \nmodules to start \nbuilding your package.',
        containerColor: containerCustom,
        iconColor: containerCustom,
        icon: Icons.add_to_photos_sharp,
        isAvailable: true,
        optionList: [
          PlanModal(
            title: 'Learn',
            subTitle: '₹2600 /month',
            isAvailable: true,
          ),
          PlanModal(
            title: 'Tests',
            subTitle: '₹1300 /month',
            isAvailable: true,
          ),
          PlanModal(
            title: 'Doubts',
            subTitle: '₹1300 /month ',
            isAvailable: true,
          )
        ],
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Pricing plan 7', center: true, color: context.scaffoldBackgroundColor),
      body: PageView.builder(
        controller: controller,
        itemCount: planPeriodList.length,
        onPageChanged: (i) {
          _index = i;
          setState(() {});
        },
        itemBuilder: (context, index) {
          PlanModal data = planPeriodList[index];

          return AnimatedContainer(
            margin: EdgeInsets.symmetric(vertical: _index == index ? 16 : 50, horizontal: 8),
            decoration: BoxDecoration(borderRadius: radius(defaultRadius), color: planPeriodList[index].containerColor),
            duration: 1000.milliseconds,
            curve: Curves.linearToEaseOut,
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(borderRadius: radius(defaultRadius), color: data.containerColor),
                        height: context.height() * 0.4,
                        width: context.width(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.title.validate(), style: boldTextStyle(size: 20, color: white)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(data.currency.validate(), style: primaryTextStyle(color: Colors.white70, size: 16)),
                                    Text(data.subTitle.validate(), style: primaryTextStyle(color: Colors.white70, size: 16)),
                                    Text('/' + data.period.validate(), style: secondaryTextStyle(color: Colors.white70)),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.priceLinthroughTitle.validate(), style: secondaryTextStyle(size: 20, decoration: TextDecoration.lineThrough)),
                                4.height,
                                Row(
                                  children: [
                                    Text(data.currency.validate(), style: primaryTextStyle(color: white, size: 16)),
                                    Text(data.price.validate(),
                                        style: boldTextStyle(
                                          size: 24,
                                          color: white,
                                        )),
                                  ],
                                ),
                                4.height,
                                Text(
                                  data.planPriceSubTitle.validate(),
                                  style: secondaryTextStyle(color: white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ).paddingBottom(16),
                      ),
                      Container(
                        height: context.height() * 0.40,
                        width: context.width(),
                        color: context.cardColor,
                        padding: EdgeInsets.only(top: 20),
                        margin: EdgeInsets.only(bottom: 16),
                        child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 16),
                          itemCount: planPeriodList[index].optionList!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return Container(
                              padding: EdgeInsets.all(16),
                              //color: !planPeriodList[index].optionList![i].isAvailable.validate() ? Colors.grey.withOpacity(0.2) : null,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    planPeriodList[index].icon,
                                    color: planPeriodList[index].iconColor,
                                  ),
                                  8.width,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(planPeriodList[index].optionList![i].title.validate(), style: boldTextStyle(decoration: planPeriodList[index].optionList![i].isAvailable.validate() ? null : TextDecoration.lineThrough)),
                                      6.height,
                                      Text(
                                        planPeriodList[index].optionList![i].subTitle.validate(),
                                        style: secondaryTextStyle(decoration: planPeriodList[index].optionList![i].isAvailable.validate() ? null : TextDecoration.lineThrough),
                                      ),
                                    ],
                                  ).expand(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AppButton(
                      width: context.width() * 0.7,
                      color: context.cardColor,
                      text: 'Buy Now',
                      textColor: planPeriodList[index].containerColor,
                      onTap: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();

                        snackBar(context, title: "${planPeriodList[index].title}", backgroundColor: appColorPrimaryDark);
                      },
                      shapeBorder: RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                      padding: EdgeInsets.all(16),
                    ).paddingBottom(32),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
