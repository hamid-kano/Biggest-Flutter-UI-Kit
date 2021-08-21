import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBAudioNewsDetailsScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';

class NBAudioNewsComponent extends StatefulWidget {
  static String tag = '/NBAudioNewsComponent';

  final List<NBNewsDetailsModel>? list;

  NBAudioNewsComponent({this.list});

  @override
  NBAudioNewsComponentState createState() => NBAudioNewsComponentState();
}

class NBAudioNewsComponentState extends State<NBAudioNewsComponent> {
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
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: widget.list!.length,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        NBNewsDetailsModel mData = widget.list![index];
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Image.asset('${mData.image}', height: 100, fit: BoxFit.fill).cornerRadiusWithClipRRect(16),
                  Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: black.withOpacity(0.2)),
                    child: Text('${mData.time}', style: primaryTextStyle(color: white, size: 14)),
                  ),
                ],
              ).expand(flex: 1),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${mData.categoryName}', style: boldTextStyle(color: NBPrimaryColor)),
                  Text('${mData.title}', style: boldTextStyle(), softWrap: true, maxLines: 3),
                  8.height,
                  Text('${mData.date}', style: secondaryTextStyle()),
                ],
              ).expand(flex: 2),
            ],
          ),
        ).onTap(() {
          NBAudioNewsDetailsScreen(audioDetails: mData).launch(context);
        });
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
