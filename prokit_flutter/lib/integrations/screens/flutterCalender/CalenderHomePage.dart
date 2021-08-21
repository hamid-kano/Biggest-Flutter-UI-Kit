import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'CleanCalendar.dart';

class CalenderHomePage extends StatefulWidget {
  static String tag = '/CalenderHomePage';

  @override
  _CalenderHomePageState createState() => _CalenderHomePageState();
}

class _CalenderHomePageState extends State<CalenderHomePage> {
  late List _selectedEvents;
  DateTime _selectedDay = DateTime.now();

  // List of the event on particular date.
  Map<DateTime, List> _events = Map<DateTime, List>();

  @override
  void initState() {
    super.initState();
    // if there is an event on particular date then if will return that list or else it will return empty list
    _selectedEvents = _events[_selectedDay] ?? [];

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

    setState(() {});
  }

  // to check if the current date has any event or not.
  void handleNewDate(DateTime date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
      print(_selectedDay);
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Calender'),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 25),
              child: CustomTheme(
                child: Calendar(
                  // if the value is true it will from monday or else sunday
                  startOnMonday: true,
                  // name of the week as per user choice
                  weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                  // Events list
                  events: _events,
                  // it will hide the Today icon in the header of calender
                  hideTodayIcon: false,
                  // it will highlight the today date and return thr events if there
                  onDateSelected: (date) => handleNewDate(date),
                  // you want to expand your calender or not(if not then it will show the current week)
                  isExpandable: true,
                  // color of the bottom bar
                  bottomBarColor: Color(0xFF8998FF),
                  // color of the arrow in bottom bar
                  bottomBarArrowColor: Colors.white,
                  // style of the text on the bottom bar
                  bottomBarTextStyle: TextStyle(color: Colors.white),
                  // Completed event color
                  eventDoneColor: Colors.green,
                  // current selected date color
                  selectedColor: Color(0xFF8998FF),
                  // today's date color
                  todayColor: Color(0xFF8998FF),
                  // Color of event which are pending
                  eventColor: Colors.grey,
                  // style fot the day of the week list
                  dayOfWeekStyle: boldTextStyle(size: 12),
                ),
              ),
            ),
            // if the date has event it will get call
            _buildEventList(),
          ],
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.black12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 15, top: 5, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_selectedEvents[index]['name'].toString(), style: boldTextStyle(size: 14)),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 10),
                        child: Text(
                          _selectedEvents[index]['time'].toString(),
                          style: secondaryTextStyle(),
                        ),
                      )
                    ],
                  ),
                  _selectedEvents[index]['isDone'] == true
                      ? Row(
                          children: <Widget>[
                            Text('Completed', style: primaryTextStyle()),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.8),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Pending',
                              style: primaryTextStyle(),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.8),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.access_time,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
        itemCount: _selectedEvents.length,
      ),
    );
  }
}
