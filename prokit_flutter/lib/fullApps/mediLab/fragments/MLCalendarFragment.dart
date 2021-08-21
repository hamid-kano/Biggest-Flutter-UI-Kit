import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLAppointmentDetailListComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLDeliveredDataComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLMedicationComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

class MLCalendarFragment extends StatefulWidget {
  static String tag = '/MLCalendarFragment';

  @override
  MLCalendarFragmentState createState() => MLCalendarFragmentState();
}

class MLCalendarFragmentState extends State<MLCalendarFragment> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mlPrimaryColor,
        body: Column(
          children: [
            Row(
              children: [
                Text(mlMy_activity!, style: boldTextStyle(size: 20, color: white)).expand(),
                Text(mlHistory!, style: secondaryTextStyle(color: white)).paddingRight(8.0),
              ],
            ).paddingAll(16.0),
            8.width,
            Container(
              decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
              child: Column(
                children: [
                  16.height,
                  TabBar(
                    controller: _tabController,
                    labelColor: mlColorBlue,
                    indicatorColor: mlColorBlue,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: primaryTextStyle(size: 14),
                    tabs: [
                      Tab(text: mlAppointment),
                      Tab(text: mlDelivery),
                      Tab(text: mlMedication),
                    ],
                  ),
                  TabBarView(
                    controller: _tabController,
                    children: [
                      MLAppointmentDetailListComponent(),
                      MLDeliveredDataComponent(),
                      MLMedicationComponent(),
                    ],
                  ).expand(),
                ],
              ),
            ).expand()
          ],
        ),
      ),
    );
  }
}
