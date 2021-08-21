import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/model/PlanModal.dart';

class ChoosePlanScreen5 extends StatefulWidget {
  @override
  ChoosePlanScreen5State createState() => ChoosePlanScreen5State();
}

class ChoosePlanScreen5State extends State<ChoosePlanScreen5> {
  int selectIndex = 0;
  List<PlanModal> planPageViewList = [];
  Color color = white;
  Color testTextColor = Colors.blue;
  Color doubtsTextColor = Colors.red;

  PageController controller = PageController(viewportFraction: 0.7);
  Color containerAdvanced = Color(0xFFEAA954);
  double viewPortFraction = 0.5;
  Color selectedContainerColor = Color(0xFFF0C05B);
  int _index = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    planPageViewList.add(
      PlanModal(
        title: 'Learn',
        subTitle: 'Unlimited access to video \nlectures adaptive practice.',
        price: '₹ 31,200',
        planPriceSubTitle: '12months/ Upto Apr 19',
        containerColor: containerAdvanced.withOpacity(0.9),
        icon: Icons.add_to_photos_sharp,
        planTitleColor: containerAdvanced,
        iconColor: containerAdvanced,
      ),
    );
    planPageViewList.add(
      PlanModal(
        title: 'Tests ',
        subTitle: 'Create Custom challanges invite friends and access test reports',
        price: '₹ 15,600',
        planPriceSubTitle: '12months/ Upto Apr 19',
        planTitleColor: testTextColor,
        icon: Icons.add_to_photos_sharp,
        iconColor: testTextColor,
      ),
    );
    planPageViewList.add(
      PlanModal(
        title: 'Doubts',
        subTitle: 'Get unlimited doubts solved via chat with our subjects experts ',
        price: '₹ 15,600',
        planPriceSubTitle: '12months/ Upto Apr 19',
        icon: Icons.chat_bubble,
        iconColor: doubtsTextColor,
        planTitleColor: doubtsTextColor,
      ),
    );

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
        appBar: appBarWidget('Pricing plan 5', center: true, color: context.scaffoldBackgroundColor),
        body: PageView.builder(
          controller: controller,
          itemCount: planPageViewList.length,
          onPageChanged: (i) {
            _index = i;
            setState(() {});
          },
          itemBuilder: (BuildContext context, int index) {
            bool isMyPageIndex = selectIndex == index;

            return AnimatedContainer(
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              height: _index == index ? context.height() * 0.55 : context.height() * 0.50,
              padding: EdgeInsets.all(24),
              decoration: boxDecorationDefault(color: selectIndex == index ? containerAdvanced.withOpacity(0.9) : context.cardColor, boxShadow: defaultBoxShadow(), borderRadius: radius(defaultRadius)),
              duration: 1000.milliseconds,
              curve: Curves.linearToEaseOut,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                planPageViewList[index].title.validate(),
                                style: boldTextStyle(size: 32, color: isMyPageIndex ? Colors.white : planPageViewList[index].planTitleColor),
                              ).expand(),
                              Icon(
                                planPageViewList[index].icon,
                                color: isMyPageIndex ? white : planPageViewList[index].iconColor,
                              ),
                            ],
                          ),
                          8.height,
                          Text(
                            planPageViewList[index].subTitle.validate(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: secondaryTextStyle(
                              size: 16,
                            ),
                          ),
                        ],
                      ).expand(),
                    ],
                  ),
                  32.height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(planPageViewList[index].price.validate(), style: boldTextStyle(size: 32, color: isMyPageIndex ? white : textPrimaryColorGlobal)),
                      8.height,
                      Text(
                        planPageViewList[index].planPriceSubTitle.validate(),
                        style: secondaryTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  16.height,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AppButton(
                      width: context.width(),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: TextIcon(
                        prefix: isMyPageIndex ? Icon(Icons.check, color: Colors.white, size: 16) : null,
                        text: isMyPageIndex ? 'Choose' : 'Choose',
                        textStyle: primaryTextStyle(size: 16, color: isMyPageIndex ? Colors.white : white),
                      ),
                      onTap: () {
                        setState(() {});
                        selectIndex = index;
                      },
                      shapeBorder: RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                      color: isMyPageIndex ? Colors.green.shade400 : Colors.green,
                    ),
                  ),
                ],
              ),
            ).center();
          },
        ),
      ),
    );
  }
}
