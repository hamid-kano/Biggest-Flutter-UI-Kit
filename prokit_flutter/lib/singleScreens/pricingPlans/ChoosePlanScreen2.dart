import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/model/PlanModal.dart';

class ChoosePlanScreen2 extends StatefulWidget {
  @override
  ChoosePlanScreen2State createState() => ChoosePlanScreen2State();
}

class ChoosePlanScreen2State extends State<ChoosePlanScreen2> {
  List<PlanModal> subscriptionList = [];
  int selectIndex = 0;
  Color color = Colors.blue;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    subscriptionList.add(PlanModal(
      title: 'Free',
      subTitle: '7 days',
      optionList: [
        PlanModal(title: 'Unlock over 10 courses'),
        PlanModal(title: 'Unlock over 40 education video '),
        PlanModal(title: 'View more than 50 tips'),
      ],
    ));
    subscriptionList.add(
      PlanModal(
        title: '\$8 ',
        subTitle: '30 days',
        optionList: [
          PlanModal(title: 'Unlock over 20 courses'),
          PlanModal(title: 'Unlock over 60 education video '),
          PlanModal(title: 'View more than 100 tips'),
        ],
      ),
    );
    subscriptionList.add(
      PlanModal(
        title: '\$14',
        subTitle: '3 months',
        optionList: [
          PlanModal(title: 'Unlock over 60 courses'),
          PlanModal(title: 'Unlock over 120 education video '),
          PlanModal(title: 'View more than 200 tips'),
        ],
      ),
    );
    subscriptionList.add(
      PlanModal(
        title: '\$199',
        subTitle: 'one time',
        optionList: [
          PlanModal(title: 'Unlock over unlimited  courses'),
          PlanModal(title: 'Unlock over 150 education video '),
          PlanModal(title: 'View more than 1200 tips'),
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
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget(
          'Subscription',
          center: true,
          color: context.scaffoldBackgroundColor,
          textSize: 16,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choose \nYour Plan',
                style: boldTextStyle(size: 32),
                textAlign: TextAlign.center,
              ).center(),
              16.height,
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(subscriptionList.length, (index) {
                  bool value = selectIndex == index;
                  return Container(
                    width: context.width() / 2 - 32,
                    padding: EdgeInsets.all(32),
                    decoration: boxDecorationDefault(
                      borderRadius: radius(defaultRadius),
                      border: Border.all(color: Colors.grey),
                      color: value ? color.withOpacity(0.1) : context.cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(subscriptionList[index].title.validate(), style: boldTextStyle(size: 24, color: value ? color : null)),
                        Text(subscriptionList[index].subTitle.validate(), style: secondaryTextStyle(color: value ? color : null)),
                      ],
                    ),
                  ).onTap(() {
                    selectIndex = index;
                    setState(() {});
                  }, borderRadius: radius(24));
                }),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: UL(
                  spacing: 8,
                  edgeInsets: EdgeInsets.symmetric(vertical: 8),
                  symbolType: SymbolType.Custom,
                  customSymbol: Container(
                    height: 20,
                    width: 20,
                    padding: EdgeInsets.all(2),
                    child: Icon(Icons.check, size: 14, color: white),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  children: List.generate(subscriptionList[selectIndex].optionList!.length, (index) {
                    return Text(subscriptionList[selectIndex].optionList![index].title.validate(), style: secondaryTextStyle(size: 18));
                  }),
                ),
              ),
              AppButton(
                width: context.width(),
                color: color,
                shapeBorder: RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                text: "Subscribe now",
                textStyle: boldTextStyle(color: Colors.white),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
