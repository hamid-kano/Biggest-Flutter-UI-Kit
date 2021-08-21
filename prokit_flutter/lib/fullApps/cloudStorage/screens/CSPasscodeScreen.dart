import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSConstants.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSWidgets.dart';

class CSPasscodeScreen extends StatefulWidget {
  static String tag = '/CSPasscodeScreen';

  @override
  CSPasscodeScreenState createState() => CSPasscodeScreenState();
}

class CSPasscodeScreenState extends State<CSPasscodeScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () => finish(context)),
                expandedHeight: 120,
                flexibleSpace: FlexibleSpaceBar(title: Text("Passcode", style: boldTextStyle())),
              ),
            ];
          },
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildListTileForSetting(
                    title: "Turn passcode on",
                    trailing: Switch(value: false, onChanged: (val) {}),
                  ),
                  buildDivider(),
                  buildListTileForSetting(
                    title: "Change passcode",
                    isEnable: false,
                  ),
                  buildDivider(),
                  buildListTileForSetting(
                    title: "Erase data",
                    trailing: Switch(value: false, onChanged: null),
                    subTitle: "Erase all $CSAppName data from this device after 10 failed passcode attempts",
                    isEnable: false,
                  ),
                  buildDivider(),
                  buildListTileForSetting(
                    title: "Fingerprint unlock",
                    subTitle: "Unlock the $CSAppName app with your fingerprint",
                    trailing: Switch(value: false, onChanged: null),
                    isEnable: false,
                  ),
                  buildDivider(),
                ],
              ).paddingOnly(left: 4, top: 8),
            ),
          )),
    );
  }
}
