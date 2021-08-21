import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/screens/firebaseCrud/FAddUserScreen.dart';
import 'package:prokit_flutter/integrations/screens/firebaseCrud/FirebaseUserService.dart';
import 'package:prokit_flutter/integrations/screens/firebaseCrud/model/FBusermodel.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

FirebaseUserService userService = FirebaseUserService();

class FUserListScreen extends StatefulWidget {
  const FUserListScreen({Key? key}) : super(key: key);

  @override
  _FUserListScreenState createState() => _FUserListScreenState();
}

class _FUserListScreenState extends State<FUserListScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(appColorPrimary);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    setStatusBarColor(context.scaffoldBackgroundColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget('Firebase User List', center: true, color: appColorPrimary, textColor: white, elevation: 0),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FAddUserScreen().launch(context);
          },
          backgroundColor: appColorPrimary,
          child: Icon(Icons.add, color: Colors.white, size: 32),
        ),
        body: StreamBuilder<List<FBUserModel>>(
          stream: userService.getData(),
          builder: (context, snap) {
            if (snap.hasData) {
              if (snap.data!.isEmpty) {
                return Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("images/integrations/img/no_data_found.png", height: 150, fit: BoxFit.cover),
                      16.height,
                      Text("No User Found", style: boldTextStyle()),
                    ],
                  ),
                ).center();
              }

              return ListView.builder(
                padding: EdgeInsets.only(bottom: 80),
                itemCount: snap.data!.length,
                shrinkWrap: true,
                reverse: true,
                itemBuilder: (_, int index) {
                  FBUserModel data = snap.data![index];
                  return SettingItemWidget(
                    padding: EdgeInsets.all(16),
                    decoration: boxDecorationDefault(color: context.cardColor),
                    onTap: () {
                      FAddUserScreen(data: data).launch(context);
                    },
                    title: data.name.validate(),
                    subTitle: data.email,
                    trailing: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: appColorPrimary),
                      child: Text(data.age.validate().toString(), style: primaryTextStyle(color: white)),
                    ),
                    subTitleTextStyle: secondaryTextStyle(size: 14),
                    titleTextStyle: boldTextStyle(size: 18),
                  ).paddingSymmetric(vertical: 4, horizontal: 8);
                },
              );
            }
            return snapWidgetHelper(snap);
          },
        ),
      ),
    );
  }
}
