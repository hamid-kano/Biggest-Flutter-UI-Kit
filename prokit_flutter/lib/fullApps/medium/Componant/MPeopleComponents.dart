import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/medium/modal/MModel.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MDataProvider.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MWidget.dart';

class MPeopleComponents extends StatefulWidget {
  static String tag = '/MPeopleComponents';

  @override
  MPeopleComponentsState createState() => MPeopleComponentsState();
}

class MPeopleComponentsState extends State<MPeopleComponents> {
  List<MPeopleModel> peopleList = getPeopleFlutterList();
  List<MPeopleModel> publicationList = getPublicationList();

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Container(
            width: context.width(),
            color: black,
            padding: EdgeInsets.all(16),
            child: Text('See all people you follow', style: primaryTextStyle(color: white, size: 18)),
          ),
          Text('People writing about Flutter Widget', style: primaryTextStyle(color: white, size: 18)).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
          MPeopleList(list: peopleList),
          Text('People writing about Android', style: primaryTextStyle(color: white, size: 18)).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
          MPeopleList(list: publicationList),
        ],
      ),
    );
  }
}
