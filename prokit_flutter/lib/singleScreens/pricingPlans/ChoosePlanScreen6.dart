import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/model/PlanModal.dart';

class ChoosePlanScreen6 extends StatefulWidget {
  @override
  ChoosePlanScreen6State createState() => ChoosePlanScreen6State();
}

class ChoosePlanScreen6State extends State<ChoosePlanScreen6> {
  List<PlanModal> subscriptionList = [];
  PageController controller = PageController(viewportFraction: 0.85);
  int _index = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    subscriptionList.add(
      PlanModal(
        title: 'Freelancer',
        currency: '\$',
        price: '5',
        period: 'month',
        icon: Icons.person,
        optionList: [
          PlanModal(title: '1 Agent', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Tickets', isAvailable: true, isImportant: false),
          PlanModal(title: 'Email Ticketing', isAvailable: true, isImportant: false),
          PlanModal(title: 'Live Chat', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Customers', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Products', isAvailable: true, isImportant: false),
          PlanModal(title: 'Knowledge Base', isAvailable: true, isImportant: false),
          PlanModal(title: 'Saved Replies', isAvailable: true, isImportant: false),
          PlanModal(title: 'Envato Integration', isAvailable: true, isImportant: false),
          PlanModal(title: 'Custom Domain', isAvailable: false, isImportant: false),
          PlanModal(title: 'Remove Desky Branding', isAvailable: false, isImportant: false),
          PlanModal(title: 'Developer Apis', isAvailable: false, isImportant: false),
          PlanModal(title: 'Custom JS & CSS', isAvailable: false, isImportant: false),
          PlanModal(title: 'Custom user Roles', isAvailable: false, isImportant: false),
          PlanModal(title: 'External Purchase', isAvailable: false, isImportant: false),
          PlanModal(title: 'Verification', isAvailable: false, isImportant: false),
        ],
      ),
    );
    subscriptionList.add(
      PlanModal(
        title: 'StartUp',
        currency: '\$',
        price: '19',
        period: 'month',
        icon: Icons.person,
        optionList: [
          PlanModal(title: 'Up to 5 agent', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Tickets', isAvailable: true, isImportant: false),
          PlanModal(title: 'Email Ticketing', isAvailable: true, isImportant: false),
          PlanModal(title: 'Live Chat', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Customers', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Products', isAvailable: true, isImportant: false),
          PlanModal(title: 'Knowledge Base', isAvailable: true, isImportant: false),
          PlanModal(title: 'Saved Replies', isAvailable: true, isImportant: false),
          PlanModal(title: 'All Integration', isAvailable: true, isImportant: true),
          PlanModal(title: 'Custom Domain', isAvailable: true, isImportant: false),
          PlanModal(title: 'Remove Desky Branding', isAvailable: true, isImportant: false),
          PlanModal(title: 'Developer Apis', isAvailable: true, isImportant: false),
          PlanModal(title: 'Custom JS & CSS', isAvailable: true, isImportant: false),
          PlanModal(title: 'Custom user Roles', isAvailable: false, isImportant: false),
          PlanModal(title: 'External Purchase', isAvailable: false, isImportant: false),
          PlanModal(title: 'Verification', isAvailable: false, isImportant: false),
        ],
      ),
    );
    subscriptionList.add(
      PlanModal(
        title: 'Business',
        currency: '\$',
        price: '39',
        period: 'month',
        icon: Icons.business,
        optionList: [
          PlanModal(title: 'Up to 10 agent', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Tickets', isAvailable: true, isImportant: false),
          PlanModal(title: 'Email Ticketing', isAvailable: true, isImportant: false),
          PlanModal(title: 'Live Chat', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Customers', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Products', isAvailable: true, isImportant: false),
          PlanModal(title: 'Knowledge Base', isAvailable: true, isImportant: false),
          PlanModal(title: 'Saved Replies', isAvailable: true, isImportant: false),
          PlanModal(title: 'All Integration', isAvailable: true, isImportant: true),
          PlanModal(title: 'Custom Domain', isAvailable: true, isImportant: false),
          PlanModal(title: 'Remove Desky Branding', isAvailable: true, isImportant: false),
          PlanModal(title: 'Developer Apis', isAvailable: true, isImportant: false),
          PlanModal(title: 'Custom JS & CSS', isAvailable: true, isImportant: false),
          PlanModal(title: 'Custom user Roles', isAvailable: true, isImportant: false),
          PlanModal(title: 'External Purchase', isAvailable: true, isImportant: false),
          PlanModal(title: 'Verification', isAvailable: true, isImportant: false),
        ],
      ),
    );
    subscriptionList.add(
      PlanModal(
        title: 'Enterprise  ',
        currency: '\$',
        price: '149',
        period: 'month',
        icon: Icons.business_center,
        optionList: [
          PlanModal(title: ' 10+ agents', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Tickets', isAvailable: true, isImportant: false),
          PlanModal(title: 'Email Ticketing', isAvailable: true, isImportant: false),
          PlanModal(title: 'Live Chat', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Customers', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Products', isAvailable: true, isImportant: false),
          PlanModal(title: 'Knowledge Base', isAvailable: true, isImportant: false),
          PlanModal(title: 'Saved Replies', isAvailable: true, isImportant: false),
          PlanModal(title: 'All Integration', isAvailable: true, isImportant: true),
          PlanModal(title: 'Custom Domain', isAvailable: true, isImportant: false),
          PlanModal(title: 'Remove Desky Branding', isImportant: false, isAvailable: true),
          PlanModal(title: 'Developer Apis', isImportant: false, isAvailable: true),
          PlanModal(title: 'Custom JS & CSS', isImportant: false, isAvailable: true),
          PlanModal(title: 'Custom user Roles', isImportant: false, isAvailable: true),
          PlanModal(title: 'External Purchase', isImportant: false, isAvailable: true),
          PlanModal(title: 'Verification', isImportant: false, isAvailable: true),
        ],
      ),
    );

    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Pricing plan 6',
          center: true,
          color: context.scaffoldBackgroundColor),
      body: PageView.builder(
          itemCount: subscriptionList.length,
          controller: controller,
          onPageChanged: (v) {
            _index = v;
            setState(() {});
          },
          itemBuilder: (context, index) {
            PlanModal data = subscriptionList[index];
            return AnimatedContainer(
              margin: EdgeInsets.symmetric(vertical: _index == index ? 16 : 50, horizontal: 8),
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: radius(defaultRadius),
                boxShadow: defaultBoxShadow(
                  shadowColor: context.dividerColor,
                ),
                backgroundColor: context.cardColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              duration: 1000.milliseconds,
              curve: Curves.linearToEaseOut,
              child: Column(
                children: [
                  Text(data.title.validate(), style: boldTextStyle(size: 28)).center(),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data.currency.validate(), style: primaryTextStyle(color: Colors.blue, size: 18)),
                      Text(data.price.validate(), style: primaryTextStyle(color: Colors.blue, size: 36)),
                      8.width,
                      Text('/' + data.period.validate(), style: secondaryTextStyle()),
                    ],
                  ).center(),
                  Divider(),
                  16.height,
                  ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.optionList!.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Text(
                          data.optionList![index].title.validate(),
                          style: primaryTextStyle(
                              size: 16,
                              weight: data.optionList![index].isImportant! ? FontWeight.bold : FontWeight.normal,
                              decoration: !data.optionList![index].isAvailable! ? TextDecoration.lineThrough : TextDecoration.none,
                              color: !data.optionList![index].isAvailable! ? Colors.grey.shade500 : textPrimaryColorGlobal),
                        ),
                      );
                    },
                  ).expand(),
                  16.height,
                  AppButton(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Colors.blue,
                    child: TextIcon(
                      text: 'SIGN UP',
                      prefix: Icon(data.icon, color: white),
                      textStyle: TextStyle(color: white),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      snackBar(
                        context,
                        title: "Register as ${data.title.validate()}",
                        backgroundColor: appColorPrimaryDark,
                      );
                    },
                    shapeBorder: RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                  ).center(),
                ],
              ),
            );
          }),
    );
  }
}
