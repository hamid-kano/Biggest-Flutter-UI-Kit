import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme6/models/T6Models.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6CalendarStrip.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Colors.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Constant.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6DataGenerator.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Images.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Strings.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Widget.dart';
import 'package:prokit_flutter/themes/theme6/utils/Widget/T6Bar.dart';
import 'package:prokit_flutter/themes/theme6/utils/Widget/T6SliderWidget.dart';

import '../../../main.dart';

class T6Dashboard extends StatefulWidget {
  static String tag = '/T6Dashboard';

  @override
  T6DashboardState createState() => T6DashboardState();
}

class T6DashboardState extends State<T6Dashboard> {
  DateTime startDate = DateTime.now().subtract(Duration(days: 2));
  DateTime endDate = DateTime.now().add(Duration(days: 30));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 2));
  List<DateTime> markedDates = [DateTime.now().subtract(Duration(days: 1)), DateTime.now().subtract(Duration(days: 2)), DateTime.now().add(Duration(days: 4))];
  int selectedPos = 1;
  List<T6Slider>? mSliderList;
   List<T6LogModel>? mActivity;

  onSelect(data) {
    print("Selected Date -> $data");
  }

  _monthNameWidget(monthName) {
    return Container(
      child: Text(
        monthName,
        style: TextStyle(
          fontSize: 16,
          color: Colors.transparent,
        ),
      ),
      padding: EdgeInsets.only(top: 8, bottom: 0),
    );
  }

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    TextStyle normalStyle = TextStyle(fontSize: 16, color: t6textColorSecondary);
    TextStyle selectedStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: t6white);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: t6colorPrimary);

    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(), style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : t6view_color,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mSliderList = getSliders();
    mActivity = getData();
  }

  var isSelected = 1;

  Widget tabItem(var pos, var icon, var name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = pos;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          decoration: isSelected == pos ? BoxDecoration(shape: BoxShape.rectangle, color: t6colorPrimary, borderRadius: BorderRadius.circular(8)) : BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: isSelected == pos ? t6white : t6textColorSecondary,
                ),
                text(name, textColor: isSelected == pos ? t6white : t6textColorSecondary, fontSize: textSizeSmall)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: appStore.scaffoldBackground,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(t6_lbl_hi_carnegie, textColor: appStore.textPrimaryColor),
                              Icon(Icons.notifications_active, color: appStore.iconColor),
                            ],
                          ),
                          text(t6_lbl_how_was_your_day, textColor: appStore.textPrimaryColor, fontFamily: fontMedium)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: text(t6_lbl_your_progress_this_week, textColor: t6colorPrimary, fontFamily: fontMedium),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: CustomTheme(
                      child: CalendarStrip(
                        startDate: startDate,
                        endDate: endDate,
                        onDateSelected: onSelect,
                        dateTileBuilder: dateTileBuilder,
                        iconColor: Colors.transparent,
                        monthNameWidget: _monthNameWidget,
                        containerDecoration: boxDecoration(radius: 16, showShadow: true, bgColor: appStore.scaffoldBackground),
                        addSwipeGesture: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: text(t6_lbl_today_s_workout, textColor: t6colorPrimary, fontFamily: fontMedium),
                  ),
                  SizedBox(height: 16),
                  T6SliderWidget(mSliderList),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: text(t6_lbl_log_other_activities, textColor: t6colorPrimary, fontFamily: fontMedium),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.32,
                    child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        scrollDirection: Axis.horizontal,
                        itemCount: mActivity!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return T6Activity(mActivity![index], index);
                        }),
                  ),
                  Container(
                    height: 400,
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                          decoration: boxDecoration(radius: 10, showShadow: true, bgColor: t6light_blue),
                          child: (Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text(t6_lbl_calories, textColor: t6colorPrimary, fontFamily: fontMedium),
                                SizedBox(height: 50),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Bar(0.3),
                                      Bar(0.5),
                                      Bar(0.7),
                                      Bar(0.5),
                                      Bar(0.5),
                                      Bar(0.7),
                                      Bar(0.98),
                                      Bar(0.54),
                                      Bar(0.99),
                                      Bar(0.99),
                                      Bar(0.94),
                                      Bar(0.94),
                                      Bar(0.54),
                                    ],
                                  ),
                                ),
                                RotationTransition(
                                  turns: new AlwaysStoppedAnimation(180 / 360),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Bar(0.3),
                                        Bar(0.5),
                                        Bar(0.7),
                                        Bar(0.5),
                                        Bar(0.5),
                                        Bar(0.7),
                                        Bar(0.98),
                                        Bar(0.54),
                                        Bar(0.99),
                                        Bar(0.99),
                                        Bar(0.94),
                                        Bar(0.94),
                                        Bar(0.54),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                          width: context.width() / 1.3,
                          decoration: boxDecoration(radius: 10, showShadow: true, bgColor: t6light_blue),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text(t6_lbl_log_other_activities, textColor: t6colorPrimary, fontFamily: fontMedium),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    circleProgressDashboard("70.0g", t6_lbl_sugar, t6_lbl_sugar, 0.8),
                                    circleProgressDashboard("55.0g", t6_lbl_fats, t6_lbl_over, 0.2),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    circleProgressDashboard("55.0g", t6_lbl_carbs, t6_lbl_over, 0.5),
                                    circleProgressDashboard("70.0g", t6_lbl_protein, t6_lbl_over, 0.7),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            //margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
            height: 70,
            decoration: BoxDecoration(
              color: appStore.scaffoldBackground,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: shadowColorGlobal,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: tabItem(1, t6_ic_activity, t6_lbl_activity),
                  flex: 1,
                ),
                Flexible(
                  child: tabItem(2, t6_ic_list, t6_lbl_health),
                  flex: 1,
                ),
                Flexible(
                  child: tabItem(3, t6_ic_meal, t6_lbl_meals),
                  flex: 1,
                ),
                Flexible(
                  child: tabItem(4, t6_ic_work_bn, t6_lbl_work),
                  flex: 1,
                ),
                Flexible(
                  child: tabItem(5, t6_ic_sleep, t6_lbl_sleep),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class T6Activity extends StatelessWidget {
  late T6LogModel model;

  T6Activity(T6LogModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 16, right: 4, bottom: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: boxDecoration(radius: 10, showShadow: true, bgColor: appStore.scaffoldBackground),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: SvgPicture.asset(model.Image, height: w * 0.08, width: w * 0.08, color: appStore.iconSecondaryColor),
            ),
          ),
          SizedBox(height: 8),
          text(model.name, textColor: appStore.textSecondaryColor)
        ],
      ),
    );
  }
}
