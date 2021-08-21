import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';

import 'MLSymptomsDescription.dart';

class MLDiseaseSymptomsComponent extends StatefulWidget {
  static String tag = '/MLDiseaseSymptomsComponent';

  @override
  MLDiseaseSymptomsComponentState createState() => MLDiseaseSymptomsComponentState();
}

class MLDiseaseSymptomsComponentState extends State<MLDiseaseSymptomsComponent> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    print('tabb');
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
    return Container(
      color: white,
      height: context.height(),
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            labelStyle: boldTextStyle(color: Colors.grey.shade400),
            controller: _tabController,
            labelColor: mlColorBlue,
            indicatorColor: mlColorBlue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Total'),
              Tab(text: 'Casual'),
              Tab(text: 'Prevent'),
              Tab(text: 'Treatment'),
            ],
          ),
          Divider(),
          TabBarView(
            controller: _tabController,
            children: [
              MLSymptomsDiscriptionComponent(),
              MLSymptomsDiscriptionComponent(),
              MLSymptomsDiscriptionComponent(),
              MLSymptomsDiscriptionComponent(),
            ],
          ).flexible(),
        ],
      ),
    );
  }
}
