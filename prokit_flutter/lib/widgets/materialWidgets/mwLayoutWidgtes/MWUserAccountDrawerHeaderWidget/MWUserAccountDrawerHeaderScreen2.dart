import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWUserAccountDrawerHeaderScreen2 extends StatefulWidget {
  static const tag = '/MWUserAccountDrawerHeaderScreen2';

  @override
  _MWUserAccountDrawerHeaderScreen2State createState() => _MWUserAccountDrawerHeaderScreen2State();
}

class _MWUserAccountDrawerHeaderScreen2State extends State<MWUserAccountDrawerHeaderScreen2> {
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
      appBar: appBar(context, 'Simple User Account Drawer Header'),
      drawer: Drawer(
        child: Container(
          color: appStore.appBarColor,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                accountName: Text("John Smith", style: primaryTextStyle(color: white)),
                accountEmail: Text("John@gmail.com", style: secondaryTextStyle(size: 14, color: white)),
                currentAccountPicture: CircleAvatar(backgroundImage: Image.asset('images/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/ic_user1.png').image),
              ),
              ListTile(
                leading: Icon(Icons.category, color: appStore.iconColor),
                title: Text('Category', style: primaryTextStyle()),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toast("Category");
                },
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_box, color: appStore.iconColor),
                title: Text('Account', style: primaryTextStyle()),
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
                ),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toast("Account");
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet, color: appStore.iconColor),
                title: Text('Balance', style: primaryTextStyle()),
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
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
    );
  }
}
