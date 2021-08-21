import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/webApps/portfolios/models/Portfolio1SkillModel.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/DataGenerator.dart';

class ToDoWidget extends StatefulWidget {
  static String tag = '/ToDoScreen';

  @override
  ToDoWidgetState createState() => ToDoWidgetState();
}

class ToDoWidgetState extends State<ToDoWidget> {
  String selectedTab = 'All Project';
  List toDoTab = [];
  List<Portfolio1ToDolModel> imgList = [];
  List<Portfolio1ToDolModel> searchList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    toDoTab.add('All Project');
    toDoTab.add('Illustration');
    toDoTab.add('Photography');
    toDoTab.add('Website');

    imgList = getToDoList();
    searchList = getToDoList();
  }

  filter(String type) {
    imgList.clear();

    if (type.isEmpty) {
      imgList.addAll(searchList);
    } else {
      searchList.forEach((element) {
        if (element.type == type) {
          imgList.add(element);
        }
      });
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      child: Column(
        children: [
          30.height,
          Text('I Love What I Do', style: primaryTextStyle(size: 36)),
          16.height,
          Text(
            'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere '
            'cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus '
            'turpis sodales quis. Integer sit amet mattis quam.',
            style: secondaryTextStyle(size: 16),
            textAlign: TextAlign.center,
          ).withWidth(context.width() * 0.5),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: context.width() * 0.12,
                decoration: boxDecoration(
                  radius: 10,
                  color: selectedTab == 'All Project' ? Colors.transparent : appStore.textPrimaryColor!,
                  bgColor: selectedTab == 'All Project' ? Colors.green : appStore.scaffoldBackground,
                ),
                child: Center(
                  child: Text(
                    'All Project',
                    style: primaryTextStyle(color: selectedTab == 'All Project' ? Colors.white : appStore.textPrimaryColor),
                  ),
                ),
                margin: EdgeInsets.all(8),
              ).onTap(() {
                setState(() {
                  selectedTab = 'All Project';
                  filter('');
                });
              }, splashColor: Colors.green),
              Container(
                height: 50,
                width: context.width() * 0.12,
                decoration: boxDecoration(
                  radius: 10,
                  color: selectedTab == 'Illustration' ? Colors.transparent : appStore.textPrimaryColor!,
                  bgColor: selectedTab == 'Illustration' ? Colors.green : appStore.scaffoldBackground,
                ),
                margin: EdgeInsets.all(8),
                child: Center(child: Text('Illustration', style: primaryTextStyle(color: selectedTab == 'Illustration' ? Colors.white : appStore.textPrimaryColor))),
              ).onTap(() {
                setState(() {
                  selectedTab = 'Illustration';
                  filter(selectedTab);
                });
              }, splashColor: Colors.green),
              Container(
                height: 50,
                width: context.width() * 0.12,
                decoration: boxDecoration(
                  radius: 10,
                  color: selectedTab == 'Photography' ? Colors.transparent : appStore.textPrimaryColor!,
                  bgColor: selectedTab == 'Photography' ? Colors.green : appStore.scaffoldBackground,
                ),
                margin: EdgeInsets.all(8),
                child: Center(child: Text('Photography', style: primaryTextStyle(color: selectedTab == 'Photography' ? Colors.white : appStore.textPrimaryColor))),
              ).onTap(() {
                setState(() {
                  selectedTab = 'Photography';
                  filter(selectedTab);
                });
              }, splashColor: Colors.green),
              Container(
                height: 50,
                width: context.width() * 0.12,
                decoration: boxDecoration(
                  radius: 10,
                  color: selectedTab == 'Website' ? Colors.transparent : appStore.textPrimaryColor!,
                  bgColor: selectedTab == 'Website' ? Colors.green : appStore.scaffoldBackground,
                ),
                margin: EdgeInsets.all(8),
                child: Center(child: Text('Website', style: primaryTextStyle(color: selectedTab == 'Website' ? Colors.white : appStore.textPrimaryColor))),
              ).onTap(() {
                setState(() {
                  selectedTab = 'Website';
                  filter(selectedTab);
                });
              }, splashColor: Colors.green),
            ],
          ),
          40.height,
          Wrap(
            spacing: 5,
            runSpacing: 0,
            children: imgList.map((e) {
              return Container(
                width: context.width() * 0.24,
                height: 200,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: commonCachedNetworkImage(e.img!, fit: BoxFit.cover, width: context.width() * 0.25, height: 200).cornerRadiusWithClipRRect(5),
              );
            }).toList(),
          ),
          16.height,
        ],
      ),
    );
  }
}
