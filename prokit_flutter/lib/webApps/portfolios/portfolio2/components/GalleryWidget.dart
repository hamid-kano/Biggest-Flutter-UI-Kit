import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/webApps/portfolios/models/Portfolio1SkillModel.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/DataGenerator.dart';

import '../Colors.dart';

class GalleryWidget extends StatefulWidget {
  static String tag = '/GalleryWidget';

  @override
  GalleryWidgetState createState() => GalleryWidgetState();
}

class GalleryWidgetState extends State<GalleryWidget> {
  List<GuideLinesModel> imgList = [];
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    selectedIndex = 0;
    imgList = getGalleryImgList();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      color: appStore.isDarkModeOn ? appBackgroundColorDark : portfolio2BackgroundColor,
      child: Container(
        width: context.width() * 0.8,
        alignment: Alignment.center,
        child: Column(
          children: [
            32.height,
            commonCachedNetworkImage(
              imgList[selectedIndex].img!,
              height: context.height() * 0.6,
              fit: BoxFit.cover,
            ).cornerRadiusWithClipRRect(10).paddingOnly(left: 16, right: 16),
            Container(
              height: 160,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: imgList.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: commonCachedNetworkImage(imgList[index].img!, height: 150, width: 150, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
