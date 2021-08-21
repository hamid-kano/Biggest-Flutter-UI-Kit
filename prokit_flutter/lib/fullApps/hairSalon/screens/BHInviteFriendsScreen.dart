import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHImages.dart';
import 'package:nb_utils/nb_utils.dart';

class BHInviteFriendsScreen extends StatefulWidget {
  static String tag = '/InviteFriendsScreen';

  @override
  BHInviteFriendsScreenState createState() => BHInviteFriendsScreenState();
}

class BHInviteFriendsScreenState extends State<BHInviteFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back, color: blackColor),
        ),
        title: Text('Invite Friends', style: TextStyle(color: BHAppTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      body: Container(
        color: BHGreyColor.withOpacity(0.1),
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                ),
                child: Column(
                  children: [
                    Image.asset(BHInviteFriends, height: 150, width: 150, fit: BoxFit.cover),
                    16.height,
                    Text(
                      BHInviteFriendsTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: BHAppTextColorSecondary, fontWeight: FontWeight.bold),
                    ),
                    16.height,
                    Row(
                      children: [
                        Container(
                          height: 45,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Enter HASA code',
                              hintStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                              filled: true,
                              fillColor: BHGreyColor.withOpacity(0.1),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                            ),
                          ),
                        ).expand(),
                        8.width,
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: BHColorPrimary),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(BHTxtCopy, style: TextStyle(color: whiteColor, fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(BHFacebookIcon, height: 40, width: 40),
                        8.width,
                        Text(BHTxtFacebook, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                      ],
                    ),
                    16.height,
                    Row(
                      children: [
                        SvgPicture.asset(BHTwitterIcon, height: 40, width: 40),
                        8.width,
                        Text(BHTxtTwitter, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                      ],
                    ),
                    16.height,
                    Row(
                      children: [
                        Image.asset(BHInstagramIcon, height: 40, width: 40),
                        8.width,
                        Text(BHTxtInstagram, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                      ],
                    ),
                    16.height,
                    Row(
                      children: [
                        Image.asset(BHContactsIcon, height: 40, width: 40),
                        8.width,
                        Text(BHTxtContacts, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
