import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class MWCardScreen extends StatefulWidget {
  static String tag = '/MWCardScreen';

  @override
  MWCardScreenState createState() => MWCardScreenState();
}

class MWCardScreenState extends State<MWCardScreen> {
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
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Cards'),
        body: ListView(
          children: [
            getCard1(),
            getCard2(),
            getCard3(),
            getCard4(),
            getCard5(),
          ],
        ),
      ),
    );
  }

  Widget getCard1() {
    return Card(
      margin: EdgeInsets.all(16),
      color: appStore.appBarColor,
      elevation: 2,
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
                child: Image.network('https://picsum.photos/seed/picsum/200/300', height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(lipsum.createWord(numWords: 2), style: boldTextStyle(size: 20, color: appStore.textPrimaryColor)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(lipsum.createParagraph(numSentences: 1), style: secondaryTextStyle(size: 16, color: appStore.textSecondaryColor)),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCard2() {
    return Card(
      margin: EdgeInsets.only(left: 16, right: 16),
      color: appStore.appBarColor,
      elevation: 2,
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
                child: Image.asset('images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/widget_card1.jpg', height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.bookmark, color: appStore.iconColor, size: 28),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.favorite, color: appStore.iconColor, size: 28),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.share, color: appStore.iconColor, size: 28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCard3() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.only(top: 16),
            color: Colors.blueGrey,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Container(
              margin: EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lipsum.createWord(numWords: 1), style: boldTextStyle(size: 18, color: Colors.white)),
                  SizedBox(height: 10),
                  Text(lipsum.createParagraph(numSentences: 1), style: secondaryTextStyle(size: 14, color: Colors.white)),
                ],
              ),
            ),
          ),
          Container(
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: appStore.appBarColor!, offset: Offset(0, 3)),
              ],
            ),
            padding: EdgeInsets.all(8),
            child: Icon(Icons.close, color: appStore.iconColor),
          )
        ],
      ),
    );
  }

  Widget getCard4() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Card(
            color: Colors.deepOrangeAccent,
            shadowColor: Colors.deepOrangeAccent,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Activity", style: boldTextStyle(size: 16, color: Colors.white)),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/run.png',
                    color: Colors.white,
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomRight,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            margin: EdgeInsets.only(top: 16, bottom: 16, right: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              onTap: () {
                //
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                      child: Text(lipsum.createWord(numWords: 9), maxLines: 2, overflow: TextOverflow.ellipsis, style: primaryTextStyle(color: appStore.textPrimaryColor)),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Feb 27, 2020', style: secondaryTextStyle(color: appStore.textSecondaryColor)),
                          Icon(Icons.date_range, color: appStore.iconColor),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getCard5() {
    return Card();
  }
}
