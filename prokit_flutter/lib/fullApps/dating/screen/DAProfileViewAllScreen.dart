import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/model/DatingAppModel.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DAZoomingScreen.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DADataGenerator.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';

class DAProfileViewAllScreen extends StatefulWidget {
  @override
  DAProfileViewAllScreenState createState() => DAProfileViewAllScreenState();
}

class DAProfileViewAllScreenState extends State<DAProfileViewAllScreen> {
  List<DatingAppModel> list = getAllListData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    list.shuffle();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('View All', titleTextStyle: boldTextStyle()),
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: list.map((e) {
            return commonCachedNetworkImage(
              e.image,
              fit: BoxFit.cover,
              height: 150,
              width: context.width() * 0.5 -24,
            ).cornerRadiusWithClipRRect(10).onTap(() {
              DAZoomingScreen(img: e.image).launch(context);
            });
          }).toList(),
        ).paddingAll(16),
      ),
    );
  }
}
