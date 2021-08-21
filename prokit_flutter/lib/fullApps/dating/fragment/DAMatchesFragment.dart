import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/model/DatingAppModel.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DAChatScreen.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DADataGenerator.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';

class DAMatchesFragment extends StatefulWidget {
  @override
  DAMatchesFragmentState createState() => DAMatchesFragmentState();
}

class DAMatchesFragmentState extends State<DAMatchesFragment> {
  List<DatingAppModel> list = getAllListData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    list.shuffle();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              32.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Inbox', style: boldTextStyle()),
                  Icon(Icons.edit_outlined),
                ],
              ).paddingOnly(left: 16, right: 16, top: 16),
              ListView.builder(
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: list.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  DatingAppModel data = list[index];
                  return Container(
                    decoration: boxDecorationWithShadow(borderRadius: BorderRadius.circular(16)),
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: commonCachedNetworkImage(
                            data.image,
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                          ),
                        ),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.name.validate(), style: boldTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
                            8.height,
                            Text(data.subTitle1.validate(), style: secondaryTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ],
                    ),
                  ).onTap(() {
                    DAChatScreen(data: data).launch(context);
                  }, highlightColor: white, splashColor: white);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
