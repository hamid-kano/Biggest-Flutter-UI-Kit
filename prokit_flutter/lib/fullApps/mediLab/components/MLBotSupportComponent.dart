import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLChatListComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLBotScreen.dart';

class MLBotSupportComponent extends StatefulWidget {
  static String tag = '/MLBotSupportComponent';

  @override
  MLBotSupportComponentState createState() => MLBotSupportComponentState();
}

class MLBotSupportComponentState extends State<MLBotSupportComponent> {
  List<String> botsData = <String>['Tony Bot', 'Dr. Heldi Kulm'];

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
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Available Bots', style: boldTextStyle()),
          16.height,
          MLChatListComponent(botsData, Colors.yellow, MLBotScreen()),
        ],
      ),
    );
  }
}
