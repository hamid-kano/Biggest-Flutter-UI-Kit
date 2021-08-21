import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShWidget.dart';

class ShEmailScreen extends StatefulWidget {
  static String tag = '/ShEmailScreen';

  @override
  ShEmailScreenState createState() => ShEmailScreenState();
}

class ShEmailScreenState extends State<ShEmailScreen> {
  var emailCont = TextEditingController();
  var descriptionCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      emailCont.text = sh_reference_email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        title: text(sh_lbl_email, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
        actionsIconTheme: IconThemeData(color: sh_colorPrimary),
        actions: <Widget>[cartIcon(context, 3)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: emailCont,
              enabled: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              style: TextStyle(fontFamily: fontRegular, fontSize: textSizeMedium),
              autofocus: false,
              decoration: formFieldDecoration(sh_lbl_email_to_woobox),
            ),
            SizedBox(
              height: spacing_standard_new,
            ),
            TextFormField(
              controller: descriptionCont,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              style: TextStyle(fontFamily: fontRegular, fontSize: textSizeMedium),
              autofocus: false,
              decoration: formFieldDecoration(sh_lbl_description),
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              height: 50,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
              onPressed: () {},
              color: sh_colorPrimary,
              child: text(sh_lbl_send_mail, fontFamily: fontMedium, fontSize: textSizeLargeMedium, textColor: sh_white),
            )
          ],
        ),
      ),
    );
  }
}
