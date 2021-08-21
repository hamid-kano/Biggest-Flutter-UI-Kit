import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/medium/modal/MModel.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MDataProvider.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MWidget.dart';

class MPublicationComponents extends StatefulWidget {
  static String tag = '/MPublicationComponents';

  @override
  MPublicationComponentsState createState() => MPublicationComponentsState();
}

class MPublicationComponentsState extends State<MPublicationComponents> {
  List<MPeopleModel> peopleList = getPublicationPeopleList();
  List<MPeopleModel> publicationList = getPublicationPickList();

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
            child: Text('See all publication you follow', style: primaryTextStyle(color: white, size: 18)),
          ),
          Text('New and notable', style: primaryTextStyle(color: white, size: 18)).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
          MPublicationList(list: peopleList),
          Text('Pick for you', style: primaryTextStyle(color: white, size: 18)).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
          MPublicationList(list: publicationList),
        ],
      ),
    );
  }
}
