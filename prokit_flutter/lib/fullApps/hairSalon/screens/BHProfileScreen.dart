import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHImages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'BHAccountInformationScreen.dart';
import 'BHInviteFriendsScreen.dart';
import 'BHNotificationScreen.dart';
import 'BHPaymentScreen.dart';

class BHProfileScreen extends StatefulWidget {
  static String tag = '/ProfileScreen';

  @override
  BHProfileScreenState createState() => BHProfileScreenState();
}

class BHProfileScreenState extends State<BHProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Future<void> _showDialog() async {
      return showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              contentTextStyle: TextStyle(color: BHAppTextColorSecondary),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
              actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
              title: Text(BHTxtLogoutDialog, style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary)),
              content: Text(BHTxtLogoutMsg, style: TextStyle(fontSize: 14, color: BHAppTextColorSecondary)),
              actions: <Widget>[
                TextButton(
                  child: Text(BHBtnYes, style: TextStyle(color: Colors.blue, fontSize: 14)),
                  onPressed: () {
                    finish(context);
                  },
                ),
                TextButton(
                  child: Text(BHBtnNo, style: TextStyle(color: Colors.blue, fontSize: 14)),
                  onPressed: () {},
                ),
              ],
            );
          });
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(backgroundImage: Image.network(BHdDashedBoardImage5).image, radius: 50),
                  ),
                  8.height,
                  Text('Theresa Cohen', style: TextStyle(color: BHAppTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
                  8.height,
                  Text('theresacohen@gmail.com', style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        BHPaymentScreen().launch(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(BHPaymentIcon, height: 23, width: 23, color: BHColorPrimary),
                          8.width,
                          Text(BHTxtPaymentMethods, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)).expand()
                        ],
                      ),
                    ),
                    16.height,
                    GestureDetector(
                      onTap: () {
                        BHAccountInformationScreen().launch(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(BHInformationIcon, height: 23, width: 23, color: BHColorPrimary),
                          8.width,
                          Text(BHTxtAccountInformation, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)).expand()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        BHNotificationScreen().launch(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(BHNotificationIcon, height: 23, width: 23, color: BHColorPrimary),
                          8.width,
                          Text(BHTxtNotification, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)).expand()
                        ],
                      ),
                    ),
                    16.height,
                    GestureDetector(
                      onTap: () {
                        BHInviteFriendsScreen().launch(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(BHInviteFriendsIcon, height: 23, width: 23, color: BHColorPrimary),
                          8.width,
                          Text(BHTxtInviteFriends, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)).expand()
                        ],
                      ),
                    ),
                    16.height,
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset(BHSettingIcon, height: 23, width: 23, color: BHColorPrimary),
                          8.width,
                          Text(BHTxtSetting, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)).expand()
                        ],
                      ),
                    ),
                    16.height,
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset(BHTerms_and_ServicesIcon, height: 23, width: 23, color: BHColorPrimary),
                          8.width,
                          Text(BHTxtTermsOfServices, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)).expand()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                ),
                padding: EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    _showDialog();
                  },
                  child: Row(
                    children: [
                      Image.asset(BHLogoutIcon, height: 23, width: 23, color: BHColorPrimary),
                      8.width,
                      Text(BHTxtLogout, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)).expand(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
