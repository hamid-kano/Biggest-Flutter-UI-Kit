import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBNewsDetailsScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';

class NBNewsComponent extends StatefulWidget {
  static String tag = '/NBNewsComponent';
  final List<NBNewsDetailsModel>? list;

  NBNewsComponent({this.list});

  @override
  NBNewsComponentState createState() => NBNewsComponentState();
}

class NBNewsComponentState extends State<NBNewsComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: widget.list!.length,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        NBNewsDetailsModel mData = widget.list![index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${mData.categoryName}', style: boldTextStyle(color: NBPrimaryColor)),
                Text('${mData.title}', style: boldTextStyle(), softWrap: true, maxLines: 3),
                8.height,
                Text('${mData.date}', style: secondaryTextStyle()),
              ],
            ).expand(flex: 2),
            4.width,
            Image.asset('${mData.image}', height: 100, fit: BoxFit.fill).cornerRadiusWithClipRRect(16).expand(flex: 1),
          ],
        ).onTap(() {
          NBNewsDetailsScreen(newsDetails: mData).launch(context);
        });
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
