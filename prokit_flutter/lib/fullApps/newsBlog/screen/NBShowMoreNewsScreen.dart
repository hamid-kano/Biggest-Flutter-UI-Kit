import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/newsBlog/component/NBNewsComponent.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDataProviders.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBShowMoreNewsScreen extends StatefulWidget {
  static String tag = '/NBShowMoreNewsScreen';

  @override
  NBShowMoreNewsScreenState createState() => NBShowMoreNewsScreenState();
}

class NBShowMoreNewsScreenState extends State<NBShowMoreNewsScreen> {
  List<NBNewsDetailsModel> newsList = nbGetNewsDetails();

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
      appBar: nbAppBarWidget(context, title: 'Latest News'),
      body: NBNewsComponent(list: newsList),
    );
  }
}
