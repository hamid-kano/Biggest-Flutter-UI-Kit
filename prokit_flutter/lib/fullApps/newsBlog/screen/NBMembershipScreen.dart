import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDataProviders.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBMembershipScreen extends StatefulWidget {
  static String tag = '/NBMembershipScreen';

  @override
  NBMembershipScreenState createState() => NBMembershipScreenState();
}

class NBMembershipScreenState extends State<NBMembershipScreen> {
  List<NBMembershipPlanItemModel> membershipPlanList = nbGetMembershipPlanItems();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nbAppBarWidget(context, title: 'Membership'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            16.height,
            Text('Choose your plan', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'By becoming a member you can read on any\n device.read with no ads.and offline.',
              style: secondaryTextStyle(),
              textAlign: TextAlign.center,
            ),
            16.height,
            GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: membershipPlanList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: index == selectedIndex ? NBPrimaryColor : grey.withOpacity(0.2), width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: index == selectedIndex ? NBPrimaryColor : grey.withOpacity(0.1), shape: BoxShape.circle),
                        child: Icon(Icons.check, color: index == selectedIndex ? white : grey.withOpacity(0.2)),
                      ),
                      16.height,
                      Text('${membershipPlanList[index].timePeriod}', style: boldTextStyle(size: 20)),
                      8.height,
                      Text('${membershipPlanList[index].price}', style: boldTextStyle()),
                      16.height,
                      Text('${membershipPlanList[index].text}', style: secondaryTextStyle()),
                    ],
                  ),
                ).onTap(() {
                  setState(() {
                    selectedIndex = index;
                  });
                });
              },
            ),
            16.height,
            nbAppButtonWidget(context, 'Select Plan', () {
              finish(context);
            }),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
