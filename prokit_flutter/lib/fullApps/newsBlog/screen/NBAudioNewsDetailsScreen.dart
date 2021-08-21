import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBImages.dart';

class NBAudioNewsDetailsScreen extends StatefulWidget {
  static String tag = '/NBAudioNewsDetailsScreen';

  final NBNewsDetailsModel? audioDetails;

  NBAudioNewsDetailsScreen({this.audioDetails});

  @override
  NBAudioNewsDetailsScreenState createState() => NBAudioNewsDetailsScreenState();
}

class NBAudioNewsDetailsScreenState extends State<NBAudioNewsDetailsScreen> {
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
              finish(context);
            }),
        elevation: 0,
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            commonCacheImageWidget(widget.audioDetails!.image, 200, width: context.width(), fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
            16.height,
            Text('${widget.audioDetails!.title}', style: boldTextStyle(), textAlign: TextAlign.center),
            16.height,
            Row(
              children: [
                Text('10:20', style: primaryTextStyle(size: 14)),
                8.width,
                LinearProgressIndicator(
                  backgroundColor: grey.withOpacity(0.1),
                  value: 0.7,
                  valueColor: AlwaysStoppedAnimation<Color>(NBPrimaryColor),
                  minHeight: 5,
                ).expand(),
                8.width,
                Text('${widget.audioDetails!.time}', style: primaryTextStyle(size: 14)),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageIcon(
                  AssetImage(NBRefreshIcon),
                  size: 20,
                ),
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  onPressed: () {},
                ),
                Container(
                  decoration: boxDecorationWithRoundedCorners(backgroundColor: NBPrimaryColor),
                  child: IconButton(
                    icon: Icon(Icons.pause),
                    onPressed: () {},
                    color: white,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  onPressed: () {},
                ),
                ImageIcon(
                  AssetImage(NBRefreshNextIcon),
                  size: 20,
                ),
              ],
            ),
            16.height,
            Text('Description', style: boldTextStyle(size: 20)),
            8.height,
            Text('${widget.audioDetails!.details}', style: primaryTextStyle(), textAlign: TextAlign.justify),
            16.height,
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
