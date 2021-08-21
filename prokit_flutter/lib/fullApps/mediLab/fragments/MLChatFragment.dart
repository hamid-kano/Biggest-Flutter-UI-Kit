import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLBotSupportComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLDoctorChatComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

class MLChatFragment extends StatefulWidget {
  static String tag = '/MLChatFragment';

  @override
  MLChatFragmentState createState() => MLChatFragmentState();
}

class MLChatFragmentState extends State<MLChatFragment> with SingleTickerProviderStateMixin {
  int notificationCounter = 3;
  TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
    _tabController = TabController(length: 2, vsync: this);
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
    //

    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mlPrimaryColor,
        body: Container(
          width: context.width(),
          decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.height,
              Text('Inbox', style: boldTextStyle(size: 20)).paddingLeft(16.0),
              8.height,
              AppTextField(
                controller: _searchController,
                textFieldType: TextFieldType.OTHER,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: _searchController.text.isEmpty
                      ? null
                      : Icon(Icons.clear).onTap(() {
                          _searchController.clear();
                        }),
                ),
              ).paddingOnly(right: 16.0, left: 16.0),
              16.height,
              TabBar(
                controller: _tabController,
                labelColor: mlColorBlue,
                indicatorColor: mlColorBlue,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: mlDoctors! + ' (' + notificationCounter.toString() + ')'),
                  Tab(text: mlBot_support),
                ],
              ),
              TabBarView(
                controller: _tabController,
                children: [
                  MLDoctorChatComponent(),
                  MLBotSupportComponent(),
                ],
              ).expand(),
            ],
          ),
        ),
      ),
    );
  }
}
