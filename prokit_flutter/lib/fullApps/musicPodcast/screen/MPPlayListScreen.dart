import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPPlayListDetailScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSearchScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPPlayListScreen extends StatefulWidget {
  static String tag = '/MPPlayListScreen';

  @override
  MPPlayListScreenState createState() => MPPlayListScreenState();
}

class MPPlayListScreenState extends State<MPPlayListScreen> {
  List<MusicModel> playList = getPlayList();

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
      backgroundColor: mpAppBackGroundColor,
      appBar: AppBar(
        backgroundColor: mpAppBackGroundColor,
        title: Text('My Playlist', style: boldTextStyle(color: white.withOpacity(0.9), size: 18)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: white.withOpacity(0.9)),
          onPressed: () {
            finish(context);
          },
        ),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: white.withOpacity(0.9)),
        actions: [
          searchIconWidget(onPressed: () {
            MPSearchScreen().launch(context);
          }),
        ],
        elevation: 0.0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Wrap(
              runSpacing: 4,
              spacing: 16,
              runAlignment: WrapAlignment.spaceEvenly,
              alignment: WrapAlignment.center,
              children: List.generate(
                playList.length,
                (index) {
                  MusicModel data = playList[index];

                  return Container(
                    width: context.width() * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonCacheImageWidget(data.img, 170, fit: BoxFit.cover).cornerRadiusWithClipRRect(10).onTap(() {
                          MPPlayListDetailScreen(data: data).launch(context);
                        }),
                        4.height,
                        Text(data.title!, style: primaryTextStyle(color: Colors.white), maxLines: 1),
                        4.height,
                        Text(data.subtitle!, style: secondaryTextStyle(color: Colors.white.withOpacity(0.5)), maxLines: 1),
                      ],
                    ),
                  );
                },
              ),
            ).paddingOnly(bottom: 70),
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: playMusicWidget(context)),
        ],
      ),
    );
  }
}
