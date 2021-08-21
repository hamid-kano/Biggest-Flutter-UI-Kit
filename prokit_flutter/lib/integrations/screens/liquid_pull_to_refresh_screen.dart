import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class LiquidPullToRefreshScreen extends StatefulWidget {
  static String tag = '/LiquidPullToRefreshScreen';

  @override
  LiquidPullToRefreshScreenState createState() => LiquidPullToRefreshScreenState();
}

class LiquidPullToRefreshScreenState extends State<LiquidPullToRefreshScreen> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);

    return Scaffold(
      appBar: appBar(context, 'Liquid Pull To Refresh'),
      body: LiquidPullToRefresh(
          key: refreshIndicatorKey,
          color: appColorPrimary,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  (index + 1).toString() + ' ' + lipsum.createText(),
                  maxLines: 1,
                  style: primaryTextStyle(),
                ),
              );
            },
            itemCount: 100,
            shrinkWrap: true,
          ),
          onRefresh: refreshData),
    );
  }

  Future<void> refreshData() async {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });
    return completer.future.then<void>((_) {
      refreshIndicatorKey.currentState!.show();
    });
  }
}
