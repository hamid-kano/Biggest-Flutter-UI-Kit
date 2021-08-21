import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDataProviders.dart';

class NBLanguageScreen extends StatefulWidget {
  static String tag = '/NBLanguageScreen';

  @override
  NBLanguageScreenState createState() => NBLanguageScreenState();
}

class NBLanguageScreenState extends State<NBLanguageScreen> {
  List<NBLanguageItemModel> mLanguageList = nbGetLanguageItems();

  int selectedIndex = 1;

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
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              finish(context, mLanguageList[selectedIndex]);
            }),
        title: Text('Select Language', style: boldTextStyle(color: black, size: 20)),
        backgroundColor: white,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, index) {
          return Column(
            children: [
              8.height,
              Divider(),
              8.height,
            ],
          );
        },
        itemCount: mLanguageList.length,
        itemBuilder: (_, index) {
          return Row(
            children: [
              Row(
                children: [
                  commonCacheImageWidget('${mLanguageList[index].image}', 30),
                  8.width,
                  Text('${mLanguageList[index].name}', style: primaryTextStyle()),
                ],
              ).expand(),
              index == selectedIndex
                  ? Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: NBPrimaryColor,
                    )
                  : SizedBox(),
            ],
          ).onTap(() {
            setState(() {
              selectedIndex = index;
            });
            finish(context, mLanguageList[selectedIndex]);
          });
        },
      ),
    );
  }
}
