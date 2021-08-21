import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_change_password.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_images.dart';

class AccountSettingsScreen extends StatefulWidget {
  static String tag = '/AccountSettingsScreen';

  @override
  AccountSettingsScreenState createState() => AccountSettingsScreenState();
}

class AccountSettingsScreenState extends State<AccountSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: muvi_appBackground,
      appBar: appBarLayout(context, "Account Settings"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            subType(context, "Change Password", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
            }, ic_password),
            subType(context, "Video Quality", () {}, ic_video),
            subType(context, "Download Settings", () {}, ic_download),
          ],
        ),
      ),
    );
  }
}
