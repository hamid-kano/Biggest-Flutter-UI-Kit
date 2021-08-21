import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/component/MPDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPPodCastDetailScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSearchScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPPodCastScreen extends StatefulWidget {
  final String? name;

  MPPodCastScreen({this.name});

  @override
  MPPodCastScreenState createState() => MPPodCastScreenState();
}

class MPPodCastScreenState extends State<MPPodCastScreen> {
  List<MusicModel> podCastList = getPodCastList();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
      key: _scaffoldKey,
      backgroundColor: mpAppBackGroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mpAppBackGroundColor,
        leading: IconButton(
          icon: Icon(Icons.menu, color: white),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        elevation: 0.0,
        title: Text(widget.name!, style: boldTextStyle(color: Colors.white.withOpacity(0.9))),
        actions: [
          searchIconWidget(onPressed: () {
            MPSearchScreen().launch(context);
          }),
        ],
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 60),
        child: Wrap(
          runAlignment: WrapAlignment.spaceEvenly,
          alignment: WrapAlignment.spaceEvenly,
          children: List.generate(
            podCastList.length,
            (index) {
              MusicModel data = podCastList[index];

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                width: context.width() * 0.45,
                child: Column(
                  children: [
                    commonCacheImageWidget(data.img, 100, fit: BoxFit.cover, width: context.width() * 0.45).cornerRadiusWithClipRRect(16),
                    4.height,
                    Text(data.title!, maxLines: 1, style: boldTextStyle(color: white.withOpacity(0.9))),
                    4.height,
                    Text(data.subtitle!, maxLines: 2, style: secondaryTextStyle(color: mpAppTextColor)),
                  ],
                ),
              ).onTap(() {
                String? img = data.img;
                MPPodCastDetailScreen(img: img).launch(context);
              });
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(height: 70, child: playMusicWidget(context)),
    );
  }
}
