import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWUserAccountDrawerHeaderScreen3 extends StatefulWidget {
  static const tag = '/MWUserAccountDrawerHeaderScreen3';

  @override
  _MWUserAccountDrawerHeaderScreen3State createState() => _MWUserAccountDrawerHeaderScreen3State();
}

class _MWUserAccountDrawerHeaderScreen3State extends State<MWUserAccountDrawerHeaderScreen3> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
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
      appBar: appBar(context, 'With Multiple Account Selection'),
      body: Center(
        child: GestureDetector(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Container(
            decoration: boxDecoration(bgColor: appColorPrimary, radius: 8),
            padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: Text(
              "Click here",
              style: primaryTextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: appStore.appBarColor,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset('images/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/background.jpg').image,
                )),
                accountName: Text(
                  "Smith",
                  style: primaryTextStyle(),
                ),
                accountEmail: Text(
                  "Smith12@gmail.com",
                  style: primaryTextStyle(),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: Image.asset('images/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/ic_user1.png').image,
                  ),
                  CircleAvatar(
                    backgroundImage: Image.asset('images/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/ic_user2.png').image,
                  ),
                ],
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text('Account', style: primaryTextStyle()),
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.chevron_right,
                    color: appStore.iconColor,
                  ),
                ),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toast("Account");
                },
              ),
              ListTile(
                title: Text('Balance', style: primaryTextStyle()),
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.chevron_right,
                    color: appStore.iconColor,
                  ),
                ),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toast("Balance");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
