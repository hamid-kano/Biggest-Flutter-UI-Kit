import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWUserAccountDrawerHeaderScreen1 extends StatefulWidget {
  static const tag = '/MWUserAccountDrawerHeaderScreen1';

  @override
  _MWUserAccountDrawerHeaderScreen1State createState() => _MWUserAccountDrawerHeaderScreen1State();
}

class _MWUserAccountDrawerHeaderScreen1State extends State<MWUserAccountDrawerHeaderScreen1> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(milliseconds: 500));
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(context, 'With Custom UI'),
      body: Center(
        child: GestureDetector(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Container(
            decoration: boxDecoration(bgColor: appColorPrimary, radius: 8),
            padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: Text("Click here", style: primaryTextStyle(color: Colors.white)),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: appStore.appBarColor,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.red),
                accountEmail: Text('leedesigner@gmail.com', style: primaryTextStyle(size: 16, color: Colors.white)),
                accountName: Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider('https://miro.medium.com/max/2048/0*0fClPmIScV5pTLoE.jpg'),
                        ),
                      ),
                    ),
                    8.width,
                    Text('Lee \nDesigner', style: primaryTextStyle(size: 16, color: Colors.white)),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_box, color: appStore.iconColor),
                title: Text('My Account', style: primaryTextStyle()),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toast("My Account");
                },
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: appStore.iconColor),
                title: Text('Setting', style: primaryTextStyle()),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toast("Setting");
                },
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
