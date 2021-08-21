import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/screens/flutterCalender/CleanCalendar.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';

class T14CalendarScreen2 extends StatefulWidget {
  @override
  _T14CalendarScreen2State createState() => _T14CalendarScreen2State();
}

class _T14CalendarScreen2State extends State<T14CalendarScreen2> {
  Map<DateTime, List> _events = Map<DateTime, List>();
  List _selectedEvents = [];
  DateTime _selectedDay = DateTime.now();
  int? i;

  @override
  void initState() {
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
    init();
  }

  init() async {
    _events = {
      DateTime(_selectedDay.year, _selectedDay.month, 7): [
        {'name': 'Event A', 'isDone': true, 'time': '13 - 15 PM'},
      ],
      DateTime(_selectedDay.year, _selectedDay.month, 9): [
        {'name': 'Event A', 'isDone': true, 'time': '10 - 11 AM'},
        {'name': 'Event B', 'isDone': true, 'time': '_selectedDay.month - 7 PM'},
      ],
      DateTime(_selectedDay.year, _selectedDay.month, 10): [
        {'name': 'Event A', 'isDone': true, 'time': '9 - 10 AM'},
        {'name': 'Event B', 'isDone': false, 'time': '5 - 6 PM'},
      ],
      DateTime(_selectedDay.year, _selectedDay.month, 13): [
        {'name': 'Event A', 'isDone': true, 'time': '9 - 10 AM'},
        {'name': 'Event B', 'isDone': true, 'time': '1 - 2 PM'},
        {'name': 'Event C', 'isDone': false, 'time': '9 - 10 PM'},
      ],
      DateTime(_selectedDay.year, _selectedDay.month, 25): [
        {'name': 'Event A', 'isDone': true, 'time': '11 - 12 AM'},
        {'name': 'Event B', 'isDone': true, 'time': '1 - 2 PM'},
        {'name': 'Event C', 'isDone': false, 'time': '3 - 4 PM'},
      ],
      DateTime(_selectedDay.year, 6, 6): [
        {'name': 'Event A', 'isDone': false, 'time': '9 - 10 AM'},
      ],
    };
  }

  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: t14_btn_subscription,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Calendar(
                  startOnMonday: true,
                  weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                  events: _events,
                  onRangeSelected: (range) => print("Range is ${range.from}, ${range.to}"),
                  onDateSelected: (date) => _handleNewDate(date),
                  isExpandable: true,
                  isExpanded: true,
                  eventDoneColor: t14_colorBlue,
                  selectedColor: t14_calendar1_BgColor,
                  todayColor: t14_colorSkyBlue,
                  eventColor: t14_finance3_spending1,
                  dayOfWeekStyle: TextStyle(color: black, fontWeight: FontWeight.w800, fontSize: 11),
                ),
              ),
              _buildEventList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return Container(
      decoration: boxDecorationWithRoundedCorners(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        backgroundColor: white,
      ),
      height: context.height(),
      child: ListView.builder(
        itemCount: _selectedEvents.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(right: 8, top: 8, bottom: 8),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 8, top: 8, bottom: 8),
            child: Row(
              children: [
                Icon(Entypo.dot_single, color: i == index ? t14_colorBlue : Colors.transparent, size: 25),
                Text(_selectedEvents[index]['Time'].toString(), style: primaryTextStyle(color: t14_SuccessTxtColor, size: 12)),
                16.width,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  height: i == index ? 100 : null,
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    backgroundColor: i == index ? t14_call_BgColor : t14_calendar3_BgColor,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(_selectedEvents[index]['name'].toString(), style: boldTextStyle(color: i == index ? white : black, size: 14)),
                      16.width,
                      Text(
                        _selectedEvents[index]['ScheduleTime'].toString(),
                        style: primaryTextStyle(color: i == index ? white : t14_SuccessTxtColor, size: 12),
                      ),
                    ],
                  ),
                ).expand(),
              ],
            ),
          ).onTap(() {
            i = index;
            setState(() {});
          });
        },
      ),
    );
  }
}
