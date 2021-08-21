import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPPopularSongScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';

class MPSongTypeScreen extends StatefulWidget {
  static String tag = '/ MPSongScreen';

  @override
  MPSongTypeScreenState createState() => MPSongTypeScreenState();
}

class MPSongTypeScreenState extends State<MPSongTypeScreen> {
  List<MusicModel> songList = getSongList();

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: songList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 2),
              itemBuilder: (BuildContext context, int index) {
                MusicModel data = songList[index];

                return Container(
                  color: data.color,
                  child: Text(data.title!, style: boldTextStyle(color: Colors.white)).center(),
                ).cornerRadiusWithClipRRect(10).onTap(() {
                  MPPopularSongScreen(data: data).launch(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
