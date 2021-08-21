import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/beforeAfter/BeforeAfter.dart';

class BeforeAfterImageScreen extends StatefulWidget {
  static String tag = '/BeforeAfterImageScreen';

  @override
  BeforeAfterImageScreenState createState() => BeforeAfterImageScreenState();
}

class BeforeAfterImageScreenState extends State<BeforeAfterImageScreen> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);
    return Scaffold(
      appBar: appBar(context, "Before After Image"),
      body: Center(
        child: BeforeAfter(
          beforeImage: Image.asset('images/integrations/img/after.jpg'),
          afterImage: Image.asset('images/integrations/img/before.jpg'),
        ),
      ),
    );
  }
}
