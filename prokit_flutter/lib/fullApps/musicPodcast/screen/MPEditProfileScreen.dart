import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPImages.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPEditProfileScreen extends StatefulWidget {
  @override
  MPEditProfileScreenState createState() => MPEditProfileScreenState();
}

class MPEditProfileScreenState extends State<MPEditProfileScreen> {
  bool isSelected = true;

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
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: mpDrawerBackGroundColor,
        title: Text("Edit Profile", style: boldTextStyle(color: white.withOpacity(0.9))),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: context.width(),
              color: mpDrawerBackGroundColor,
              child: Column(
                children: [
                  commonCacheImageWidget(mpImages_2, 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(50),
                  16.height,
                  Text('Smith John', style: boldTextStyle(color: Colors.white, size: 16)),
                  16.height,
                  Text('Change your profile photo', style: secondaryTextStyle(color: Colors.white.withOpacity(0.7))),
                ],
              ),
            ),
            Column(
              children: [
                editProfileWidget(title: 'User Name', uName: 'Smith John'),
                8.height,
                Divider(color: Colors.white.withOpacity(0.2)),
                8.height,
                editProfileWidget(title: 'your Email', uName: 'smith@gmail.com'),
                8.height,
                Divider(color: Colors.white.withOpacity(0.2)),
                8.height,
                editProfileIconWidget(title: 'Reset Password', icon: Icons.keyboard_arrow_right),
                8.height,
                Divider(color: Colors.white.withOpacity(0.2)),
                EditProfileSwitchWidget(name: 'Notification', isSelected: isSelected).onTap(() {
                  isSelected = !isSelected;
                  setState(() {});
                }),
                Divider(color: Colors.white.withOpacity(0.2)),
                8.height,
                editProfileWidget(title: 'Location', uName: "John"),
                8.height,
                Divider(color: Colors.white.withOpacity(0.2)),
                8.height,
                editProfileIconWidget(title: 'Gender', icon: Icons.keyboard_arrow_down),
                8.height,
                Divider(color: Colors.white.withOpacity(0.2)),
                50.height,
                Container(
                  child: Text('Done', textAlign: TextAlign.center, style: boldTextStyle(color: Colors.white)),
                  color: mpAppButtonColor,
                  width: context.width() * 0.7,
                  padding: EdgeInsets.all(14),
                ).cornerRadiusWithClipRRect(60),
              ],
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
