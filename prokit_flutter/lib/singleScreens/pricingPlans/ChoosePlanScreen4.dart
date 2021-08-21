import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/model/PlanModal.dart';

class ChoosePlanScreen4 extends StatefulWidget {
  @override
  ChoosePlanScreen4State createState() => ChoosePlanScreen4State();
}

class ChoosePlanScreen4State extends State<ChoosePlanScreen4> {
  List<PlanModal> planModalList = [];
  Color appbarColor = Color(0xFF131d25);
  Color containerUltimate = Color(0xFF17C4AB);
  Color containerMaster = Color(0xFFE97979);
  Color containerAdvanced = Color(0xFFF7C96C);
  Color containerCustom = Color(0xFF55BBEA);
  String value = 'Class A';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    planModalList.add(
      PlanModal(
        title: 'Master',
        subTitle: 'LEARN',
        price: '₹13000',
        planPriceSubTitle: '₹13,500',
        containerColor: containerMaster,
      ),
    );
    planModalList.add(
      PlanModal(
        title: 'Advanced',
        subTitle: 'LEARN + TESTS',
        price: '₹19000',
        planPriceSubTitle: '₹19,500',
        containerColor: containerAdvanced,
      ),
    );
    planModalList.add(
      PlanModal(
        title: 'Ultimate',
        subTitle: 'LEARN + TEST + DOUBTS',
        price: '₹13000',
        planPriceSubTitle: '₹13,500',
        containerColor: containerUltimate,
      ),
    );
    planModalList.add(
      PlanModal(
        title: 'Custom',
        subTitle: 'Builid your own package by',
        price: '₹13000',
        planPriceSubTitle: '₹13,500',
        containerColor: containerCustom,
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
      appBar: appBarWidget('Pricing plan 4',
          center: true,
          color: context.scaffoldBackgroundColor),
      body: Container(
        height: context.height(),
        width: context.width(),
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(' Select Validity',
                      style: boldTextStyle(
                        size: 22,
                      )).expand(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: viewLineColor),
                      borderRadius: radius(defaultRadius),
                      color: context.cardColor,
                    ),
                    child: DropdownButton<String>(
                      value: value,
                      underline: Offstage(),
                      onChanged: (newValue) {
                        setState(() {
                          value = newValue!;
                        });
                      },
                      items: ['Class A', 'Class B', 'Class C'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                            value: value,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(value, style: primaryTextStyle(size: 16)),
                                Text('Up to Apr 2021', style: secondaryTextStyle()),
                              ],
                            ));
                      }).toList(),
                    ),
                  ),
                ],
              ),
              16.height,
              ListView.builder(
                  itemCount: planModalList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, int index) {
                    return Container(
                      decoration: boxDecorationDefault(color: planModalList[index].containerColor, borderRadius: radius(defaultRadius)),
                      margin: EdgeInsets.all(4.0),
                      padding: EdgeInsets.all(24),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(planModalList[index].title.validate(), style: boldTextStyle(size: 16, color: white)),
                                4.height,
                                Text(planModalList[index].subTitle.validate(), style: primaryTextStyle(size: 14, color: Colors.white)),
                                16.height,
                                Row(
                                  children: [
                                    Text(planModalList[index].price.validate(), style: boldTextStyle(size: 16, color: white)),
                                    8.width,
                                    Text(planModalList[index].planPriceSubTitle.validate(), style: secondaryTextStyle(color: Colors.white54, decoration: TextDecoration.lineThrough)),
                                  ],
                                )
                              ],
                            ),
                          ).expand(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white70,
                            size: 16,
                          )
                        ],
                      ),
                    ).onTap(() {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      snackBar(
                        context,
                        title: "Register as ${planModalList[index].title.validate()}",
                        backgroundColor: appColorPrimaryDark,
                        snackBarAction: SnackBarAction(
                          label: 'Buy',
                          disabledTextColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
                          textColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
                          onPressed: () {},
                        ),
                      );
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
