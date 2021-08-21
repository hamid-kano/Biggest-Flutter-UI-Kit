import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3Dashboard.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3Images.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3widgets.dart';
import 'package:prokit_flutter/themes/theme3/utils/colors.dart';
import 'package:prokit_flutter/themes/theme3/utils/strings.dart';

class T3SideMenu extends StatefulWidget {
  static var tag = "/T3SideMenu";

  @override
  T3SideMenuState createState() => T3SideMenuState();
}

class T3SideMenuState extends State<T3SideMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: T3Drawer(),
      body: T3Dashboard(),
    );
  }
}

class T3Drawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return T3DrawerState();
  }
}

class T3DrawerState extends State<T3Drawer> {
  var selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        elevation: 8,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: t3_orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50),
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(color:t3_white),
                            elevation: 4,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0), topLeft: Radius.circular(80.0))),
                            padding: const EdgeInsets.all(0.0),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0), topLeft: Radius.circular(80.0)), color: t3_white),
                            child: Center(child: Padding(padding: const EdgeInsets.all(16.0), child: Icon(Icons.arrow_forward, color: t3_colorPrimary))),
                          ),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 16),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: CachedNetworkImageProvider(t3_ic_profile), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  border: Border.all(color: t3_white, width: 2.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(t3_user_name, style: primaryTextStyle(color: white, size: 16)),
                                    Text(t3_user_email, style: primaryTextStyle(color: white, size: 16)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                        divider(),
                        SizedBox(height: 12),
                        getSideMenuItem(t3_ic_user, t3_lbl_profile, 1),
                        getSideMenuItem(t3_ic_video, t3_lbl_my_videos, 2),
                        getSideMenuItem(t3_ic_user, t3_lbl_my_followers, 3),
                        getSideMenuItem(t3_ic_recipe, t3_lbl_new_recipe, 4),
                        SizedBox(height: 50),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            child: Text(t3_lbl_logout, style: TextStyle(fontSize: 18.0, decoration: TextDecoration.underline, color: t3_white)),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getSideMenuItem(String icon, String name, int pos) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = pos;
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: t3_colorPrimary_light),
              width: 40,
              height: 40,
              child: Padding(padding: const EdgeInsets.all(10.0), child: SvgPicture.asset(icon, color: t3_white)),
            ),
            SizedBox(width: 16),
            Text(name, style: boldTextStyle(size: 16, color: white))
          ],
        ),
      ),
    );
  }
}
