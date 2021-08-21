import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/component/MPDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPArtistsDetailScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSearchScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPArtistsScreen extends StatefulWidget {
  final String? name;

  MPArtistsScreen({this.name});

  @override
  MPArtistsScreenState createState() => MPArtistsScreenState();
}

class MPArtistsScreenState extends State<MPArtistsScreen> {
  List<MusicModel> artistsList = getArtistsList();

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
      backgroundColor: mpAppBackGroundColor,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu, color: white),
        ),
        backgroundColor: mpAppBackGroundColor,
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
        child: Column(
          children: [
            GridView.builder(
              itemCount: artistsList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.4, crossAxisSpacing: 16),
              itemBuilder: (BuildContext context, int index) {
                MusicModel data = artistsList[index];

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    commonCacheImageWidget(data.img, 100, width: 180, fit: BoxFit.cover).cornerRadiusWithClipRRect(12),
                    Container(height: 100, width: 180, color: black.withOpacity(0.7)).cornerRadiusWithClipRRect(12),
                    Text(data.title!, textAlign: TextAlign.center, style: boldTextStyle(color: white.withOpacity(0.9)))
                  ],
                ).onTap(() {
                  String? img = data.img;
                  MPArtistsDetailScreen(img: img).launch(context);
                });
              },
            ).paddingSymmetric(horizontal: 16),
          ],
        ),
      ),
      bottomNavigationBar: Container(height: 70, child: playMusicWidget(context)),
    );
  }
}
