import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/screens/flutterCalender/date_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class CustomCalender extends StatefulWidget {
  @override
  _CustomCalenderState createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> with AfterLayoutMixin<CustomCalender> {
  List<String> monthNameList = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  List<DateModel> monthList = [];
  List<DateModel> dayList = [];
  List<int> yearList = [];
  int? selectedDate;
  DateTime today = DateTime.now();
  int? currentYear;
  int? currentMonth;
  int? selectedDay;
  int? selected;
  ScrollController scrollController = ScrollController();

  List<String> availableTimeList = ['10:00 AM', '10:30 AM', '11:00 AM', '11:30 AM', '12:00 AM', '12:30 AM', '01:00 AM', '01:30 AM', '02:00 AM'];
  int? i;

  void getNumberOfDays() {
    dayList.clear();
    DateTime current = DateTime(currentYear!, currentMonth! + 1);
    var days = Utils.daysInRange(Utils.firstDayOfMonth(current), Utils.lastDayOfMonth(current).add(Duration(days: 1)));
    days.forEach((element) {
      DateModel dateModel = DateModel(id: element.day, monthName: getWeekDay(element.weekday), dateTime: element);
      dayList.add(dateModel);
    });
    setState(() {});
  }
  String? weekName;
  String getWeekDay(int num) {
    if (num == 1) {
      return weekName = "Mon";
    } else if (num == 2) {
      return weekName = "Tue";
    } else if (num == 3) {
      return weekName = "Wed";
    } else if (num == 4) {
      return weekName = "Thr";
    } else if (num == 5) {
      return weekName = "Fri";
    } else if (num == 6) {
      return weekName = "Sat";
    } else {
      return weekName = "Sun";
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    monthNameList.forEach((element) {
      monthList.add(DateModel(id: monthNameList.indexOf(element), monthName: element));
    });
    yearList.add(today.year);
    yearList.add(today.year + 1);
    currentMonth = today.month - 1;
    currentYear = today.year;
    getNumberOfDays();
    selectedDay = today.day - 1;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void afterFirstLayout(BuildContext context) {
    scrollController.animateTo(selectedDay! * 50.toDouble(), duration: Duration(milliseconds: 1), curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(16),
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Theme(
              data: Theme.of(context).copyWith(canvasColor: t14_colorSkyBlue),
              child: DropdownButton<int>(
                icon: Icon(Icons.keyboard_arrow_down_sharp, size: 20, color: white),
                style: boldTextStyle(color: white),
                elevation: 5,
                onTap: () {
                  hideKeyboard(context);
                },
                underline: 0.height,
                value: currentMonth,
                items: monthList.map((e) {
                  return DropdownMenuItem<int>(child: Text(e.monthName!), value: e.id);
                }).toList(),
                onChanged: (month) {
                  currentMonth = month;
                  getNumberOfDays();
                  setState(() {});
                },
              ),
            ),
            20.width,
            Theme(
              data: Theme.of(context).copyWith(canvasColor: t14_colorSkyBlue),
              child: DropdownButton<int>(
                icon: Icon(Icons.keyboard_arrow_down_sharp, size: 20, color: white),
                underline: 0.height,
                style: boldTextStyle(color: white),
                value: currentYear,
                items: yearList.map((e) => DropdownMenuItem<int>(child: Text(e.toString()), value: e)).toList(),
                onChanged: (year) {
                  currentYear = year;
                  getNumberOfDays();
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: Wrap(
            direction: Axis.horizontal,
            children: List.generate(dayList.length, (index) {
              DateModel data = dayList[index];

              return GestureDetector(
                onTap: () {
                  selectedDay = index;
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(6),
                  width: 50,
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: selectedDay == index ? white : Colors.transparent,
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(data.monthName!, style: boldTextStyle(size: 16, color: selectedDay == index ? t14_colorBlue : white)),
                      ),
                      10.height,
                      FittedBox(
                        child: Text(data.id.toString(), style: boldTextStyle(size: 14, color: selectedDay == index ? t14_colorBlue : white)),
                      ),
                      Icon(Entypo.dot_single, color: selectedDay == index ? t14_colorBlue : Colors.transparent, size: 20),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        8.height,
        Text(t14_txt_available_time, style: boldTextStyle(color: white, size: 14)),
        8.height,
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 24.0,
          runSpacing: 16.0,
          children: List.generate(
            availableTimeList.length,
            (index) {
              return Container(
                width: 90,
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  backgroundColor: i == index ? white : Colors.transparent,
                  border: Border.all(color: i == index ? Colors.transparent : white, width: 0.5),
                ),
                padding: EdgeInsets.all(8),
                child: Text(
                  availableTimeList[index],
                  textAlign: TextAlign.center,
                  style: boldTextStyle(size: 12, color: i == index ? t14_colorBlue : white),
                ),
              ).onTap(() {
                i = index;
                setState(() {});
              });
            },
          ),
        ),
        30.height,
        t14AppButton(context, btnText: t14_txt_Save, bgColor: white, shape: 8.0, txtColor: t14_txt_BlueColor, onPress: () {
          finish(context);
        }, width: context.width()),
      ],
    );
  }
}
