import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/medium/modal/MModel.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MDashBoardScreen.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MDataProvider.dart';

class MSelectTopicScreen extends StatefulWidget {
  static String tag = '/MSelectTopicScreen';

  @override
  MSelectTopicScreenState createState() => MSelectTopicScreenState();
}

class MSelectTopicScreenState extends State<MSelectTopicScreen> {
  List<MSelectTopicModel> getListOfSelectTopic = getSelectTopicList();
  int selectedIndex = 0;

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              16.height,
              Row(
                children: [
                  Text('Select at latest three topics to personalize your story stream.', style: boldTextStyle(color: white, size: 18)).paddingAll(16).expand(),
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(8),
                    child: Text('Next', style: boldTextStyle(color: selectedIndex >= 3 ? white : grey)),
                  ).onTap(() {
                    selectedIndex >= 3 ? MDashBoardScreen().launch(context) : toast("Please select at least 3 topic.");
                  })
                ],
              ),
              8.height,
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.end,
                runAlignment: WrapAlignment.center,
                children: getListOfSelectTopic.map((data) {
                  return Container(
                    decoration: boxDecoration(color: data.isSelected ? Colors.transparent : appDividerColor, bgColor: data.isSelected ? mLimeColor : Colors.transparent, radius: 25),
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                    child: Text(data.topicName!, style: primaryTextStyle(color: white, size: 14)),
                    //height: 200,
                  ).onTap(() {
                    data.isSelected = !data.isSelected;
                    data.isSelected ? selectedIndex++ : selectedIndex--;
                    setState(() {});
                  });
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
