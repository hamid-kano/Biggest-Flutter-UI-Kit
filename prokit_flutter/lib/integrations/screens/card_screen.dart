import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/styles.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class CardScreen extends StatefulWidget {
  static String tag = '/CardScreen';

  @override
  CardScreenState createState() => CardScreenState();
}

class CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);

    return Scaffold(
      appBar: appBar(context, "Cards"),
      body: Center(
        child: ListView(
          children: <Widget>[
            getCard1(),
            Row(
              children: <Widget>[
                Flexible(flex: 1, child: getCard2(0.0)),
                Flexible(flex: 1, child: getCard2(16.0)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getCard1() {
    return Card(
      margin: EdgeInsets.all(16),
      color: whiteColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        onTap: () {},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                  child: Image.network('https://picsum.photos/seed/picsum/200/300', height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth)),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: textPrimary(lipsum.createWord(numWords: 4), color: textPrimaryColor, size: 20),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(lipsum.createParagraph(numSentences: 3), style: secondaryTextStyle()),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCard2(right) {
    return Card(
      margin: EdgeInsets.only(top: 8, bottom: 16, left: 16, right: right),
      color: whiteColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        onTap: () {},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                child: text(lipsum.createWord(numWords: 4), fontSize: 18, textColor: textPrimaryColor, maxLine: 2),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Feb 27, 2020', style: secondaryTextStyle()),
                    Icon(Icons.date_range, color: textSecondaryColor),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
