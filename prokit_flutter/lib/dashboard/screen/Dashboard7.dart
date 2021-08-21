import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/model/db7/Db7Model.dart';
import 'package:prokit_flutter/dashboard/utils/Db7BottomNavigationBar.dart';
import 'package:prokit_flutter/dashboard/utils/DbColors.dart';
import 'package:prokit_flutter/dashboard/utils/DbDataGenerator.dart';
import 'package:prokit_flutter/dashboard/utils/DbImages.dart';
import 'package:prokit_flutter/dashboard/utils/DbStrings.dart';

class Dashboard7 extends StatefulWidget {
  static String tag = '/Dashboard7';

  @override
  Dashboard7State createState() => Dashboard7State();
}

class Dashboard7State extends State<Dashboard7> {
  late List<DB7Topic> mList;
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    mList = getDB7TodayData();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    Widget mOption(var icon, var value, var subValue, var iconColor, var bgColor) {
      return Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
            width: width * 0.08,
            height: width * 0.08,
            padding: EdgeInsets.all(6),
            child: SvgPicture.asset(icon, width: width * 0.05, height: width * 0.05, color: iconColor),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(value, style: primaryTextStyle(fontFamily: 'Medium')),
              Text(subValue, style: primaryTextStyle(color: db7_textColorSecondary, size: 12)),
            ],
          )
        ],
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: dbShadowColor, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5)]),
        child: Db7BottomNavigationBar(
          items: <Db7BottomNavigationBarItem>[
            Db7BottomNavigationBarItem(icon: db7_ic_home, title: Text("Home", style: TextStyle(fontSize: 16))),
            Db7BottomNavigationBarItem(icon: db7_ic_leaf, title: Text("Service", style: TextStyle(fontSize: 16))),
            Db7BottomNavigationBarItem(icon: db7_ic_chat, title: Text("Notice", style: TextStyle(fontSize: 16))),
            Db7BottomNavigationBarItem(icon: db7_ic_user, title: Text("My", style: TextStyle(fontSize: 16))),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: db7_textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: db7_colorPrimary, size: 24),
          unselectedItemColor: db7_textColorSecondary,
          selectedItemColor: db7_colorPrimary,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: Db7BottomNavigationBarType.fixed,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(db7_lbl_my_medical, style: boldTextStyle(size: 24)),
                      Icon(Icons.search, color: db7_textColorSecondary, size: 24),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.55,
                  child: PageView(
                    children: <Widget>[
                      Slider(file: db7_item1),
                      Slider(file: db7_item2),
                      Slider(file: db7_item3),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(db7_lbl_recent_hotspots, style: boldTextStyle(size: 20)),
                      SizedBox(height: 8),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: mOption(db7_ic_plus, db7_lbl_registered, db7_lbl_just_5_minutes, db7_colorPrimary, db7_light_green),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: mOption(db7_ic_warning, db7_lbl_inquiry, db7_lbl_multiple_problems, db7_dark_blue, db7_light_blue),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: mOption(db7_ic_drugs, db7_lbl_pharmacy, db7_lbl_life_medication, db7_dark_yellow, db7_light_yellow),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: mOption(db7_ic_books_piled, db7_lbl_lecture, db7_lbl_inspection_report, db7_dark_red, db7_light_red),
                          )
                        ],
                      ),
                      Divider(height: 50),
                      Text(db7_lbl_today_s_topic, style: boldTextStyle(size: 20)),
                      SizedBox(height: 8),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Topic(mList[index], index);
                        },
                      ),
                    ],
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

// ignore: must_be_immutable
class Topic extends StatelessWidget {
  late DB7Topic model;

  Topic(DB7Topic model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.topicName, style: primaryTextStyle(fontFamily: 'Medium')),
                Text(model.topicInfo, style: primaryTextStyle(color: db7_textColorSecondary)),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: model.topicLike.toString(), style: primaryTextStyle(size: 16, color: db7_textColorSecondary)),
                          WidgetSpan(
                            child: Padding(padding: EdgeInsets.only(left: 8), child: SvgPicture.asset(db7_ic_like, height: 20, width: 20, color: db7_textColorSecondary)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: model.topicCount.toString(), style: primaryTextStyle(size: 16, color: db7_textColorSecondary)),
                          WidgetSpan(
                            child: Padding(padding: EdgeInsets.only(left: 8), child: SvgPicture.asset(db7_ic_document, height: 20, width: 20, color: db7_textColorSecondary)),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(model.topicImg, width: width * 0.2, height: width * 0.2, fit: BoxFit.fill),
            ),
          )
        ],
      ),
    );
  }
}

class Slider extends StatelessWidget {
  final String file;

  Slider({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Image.asset(file, fit: BoxFit.fill),
      ),
    );
  }
}
