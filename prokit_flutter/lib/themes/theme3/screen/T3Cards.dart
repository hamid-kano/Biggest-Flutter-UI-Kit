import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme3/model/T3_Model.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3Listing.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3DataGenerator.dart';

import '../../../main.dart';

class T3Cards extends StatefulWidget {
  static var tag = "/T3Cards";

  @override
  T3CardsState createState() => T3CardsState();
}

class T3CardsState extends State<T3Cards> {
  late List<Theme3Dish> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getList();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      appBar: appBar(context, 'Cards'),
      backgroundColor: appStore.scaffoldBackground,
      body: SafeArea(
        child: Observer(
          builder: (_) => Container(
            color: appStore.scaffoldBackground,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return T3List(mListings[index], index);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
