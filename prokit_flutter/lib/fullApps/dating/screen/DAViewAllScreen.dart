import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/model/DatingAppModel.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DAZoomingScreen.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DADataGenerator.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';

class DAViewAllScreen extends StatefulWidget {
  @override
  DAViewAllScreenState createState() => DAViewAllScreenState();
}

class DAViewAllScreenState extends State<DAViewAllScreen> {
  List<DatingAppModel> viewAllData = getDatingAppUser;

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
      appBar: appBarWidget(
        'View All',
        titleTextStyle: boldTextStyle(),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          runSpacing: 16,
          spacing: 16,
          children: viewAllData.map((e) {
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: commonCachedNetworkImage(
                    e.image.validate(),
                    fit: BoxFit.cover,
                    height: 170,
                    width: context.width() * 0.5 - 24,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.name.validate(), style: boldTextStyle(color: white), maxLines: 1, overflow: TextOverflow.ellipsis),
                      8.height,
                      Text(e.subTitle.validate(), style: secondaryTextStyle(color: white), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                )
              ],
            ).onTap(() {
              DAZoomingScreen(img: e.image).launch(context);
            });
          }).toList(),
        ).paddingAll(16),
      ),
    );
  }
}
