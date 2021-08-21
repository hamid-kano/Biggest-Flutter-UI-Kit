import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTDataProvider.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'CartListView.dart';
import 'DTDrawerWidget.dart';
import 'DTOrderSummaryScreen.dart';

class DTCartScreen extends StatefulWidget {
  static String tag = '/DTCartScreen';

  @override
  DTCartScreenState createState() => DTCartScreenState();
}

class DTCartScreenState extends State<DTCartScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget checkOutBtn() {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appColorPrimary),
        child: Text('Checkout', style: boldTextStyle(color: white)),
      ).onTap(() {
        DTOrderSummaryScreen(getCartProducts()).launch(context);
      });
    }

    Widget mobileWidget() {
      return SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartListView(mIsEditable: true, isOrderSummary: true),
            Center(child: checkOutBtn()),
          ],
        ),
      );
    }

    Widget webWidget() {
      return CartListView(mIsEditable: true, isOrderSummary: false);
    }

    return Scaffold(
      appBar: appBar(context, 'Cart'),
      drawer: DTDrawerWidget(),
      body: ContainerX(
        mobile: mobileWidget(),
        web: webWidget(),
      ),
    );
  }
}
