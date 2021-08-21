import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'DTChangePasswordScreen.dart';
import 'DTDrawerWidget.dart';

class DTSecurityScreen extends StatefulWidget {
  static String tag = '/DTSecurityScreen';

  @override
  DTSecurityScreenState createState() => DTSecurityScreenState();
}

class DTSecurityScreenState extends State<DTSecurityScreen> {
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
      appBar: appBar(context, 'Security'),
      drawer: DTDrawerWidget(),
      body: Column(
        children: [
          settingItem(context, 'Change Password', onTap: () {
            DTChangePasswordScreen().launch(context);
          }, leading: Icon(AntDesign.lock), detail: SizedBox()),
        ],
      ),
    );
  }
}
