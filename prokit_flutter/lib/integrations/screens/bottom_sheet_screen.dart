import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;

class BottomSheetScreen extends StatefulWidget {
  static String tag = '/BottomSheetScreen';

  @override
  BottomSheetScreenState createState() => BottomSheetScreenState();
}

class BottomSheetScreenState extends State<BottomSheetScreen> {
  var aText = lipsum.createParagraph(numParagraphs: 1);

  showBottomSheetDialog(context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Image.network('https://picsum.photos/seed/picsum/200/300', height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth),
              SizedBox(height: 10),
              Padding(padding: EdgeInsets.only(left: 16, right: 16, top: 8), child: text(aText, isLongText: true)),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);

    return Scaffold(
      appBar: appBar(context, "Bottom Sheet"),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16),
          shrinkWrap: true,
          children: <Widget>[
            MaterialButton(
              color: appColorPrimary,
              onPressed: () => showBottomSheetDialog(context),
              child: Text('Show BottomSheet', style: primaryTextStyle()),
            )
          ],
        ),
      ),
    );
  }
}
