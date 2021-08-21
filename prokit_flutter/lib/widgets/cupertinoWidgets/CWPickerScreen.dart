import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class CWPickerScreen extends StatefulWidget {
  static String tag = '/CWPickerScreen';

  @override
  CWPickerScreenState createState() => CWPickerScreenState();
}

class CWPickerScreenState extends State<CWPickerScreen> {
  List<ListModel> example = [
    ListModel(name: 'Cupertino Date Picker'),
    ListModel(name: 'Cupertino Time Picker'),
    ListModel(name: 'Cupertino Picker'),
  ];

  List countryName = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Bangladesh",
    "Brazil",
    "Colombia",
    "Denmark",
    "Estonia",
    "France",
    "Guinea-Bissau",
    "Holy See",
    "India",
    "Japan"
  ];

  String? selectedValue;
  String? time;
  String? date;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    time = 'Please Select Time';
    date = 'Please select Date';
    selectedValue = 'Please select value';
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Cupertino Picker'),
      body: SafeArea(
        child: ListView.builder(
            itemCount: example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(example[index], onTap: () {
                if (index == 0) {
                  dateBottomSheet(context);
                } else if (index == 1) {
                  timeBottomSheet(context);
                } else if (index == 2) {
                  pickerBottomSheet(context);
                }
              });
            }),
      ),
    );
  }

  Future<void> timeBottomSheet(context) async {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext e) {
        return Container(
          height: 250,
          child: Column(
            children: [
              Container(
                color: appStore.appBarColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cancel', style: primaryTextStyle(size: 18)).onTap(() {
                      finish(context);
                      toast('Please select time');
                      setState(() {});
                    }),
                    Text('Done', style: primaryTextStyle(size: 18)).onTap(() {
                      finish(context, time);
                      toast(time!.isNotEmpty ? time : 'Please select time');
                    })
                  ],
                ).paddingAll(8.0),
              ),
              Container(
                height: 200,
                child: CupertinoTheme(
                  data: CupertinoThemeData(textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: primaryTextStyle(size: 20))),
                  child: CupertinoDatePicker(
                    backgroundColor: appStore.scaffoldBackground,
                    minimumDate: today,
                    minuteInterval: 1,
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: false,
                    onDateTimeChanged: (DateTime dateTime) {
                      var timeFormat = DateFormat('HH:mm a');
                      String formattedDate = timeFormat.format(dateTime);
                      time = formattedDate;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> dateBottomSheet(context) async {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);

    await showModalBottomSheet(
        context: context,
        builder: (BuildContext e) {
          return Container(
            height: 245,
            child: Column(
              children: [
                Container(
                  color: appStore.appBarColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cancel',
                        style: boldTextStyle(),
                      ).onTap(() {
                        finish(context);
                        date = today as String;
                        setState(() {});
                      }),
                      Text(
                        'Done',
                        style: boldTextStyle(),
                      ).onTap(() {
                        finish(context, date);
                        toast(date.toString());
                      })
                    ],
                  ).paddingOnly(top: 8, left: 8, right: 8, bottom: 8),
                ),
                Container(
                  height: 200,
                  child: CupertinoTheme(
                    data: CupertinoThemeData(textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: primaryTextStyle(size: 20))),
                    child: CupertinoDatePicker(
                      backgroundColor: appStore.appBarColor,
                      minimumDate: today,
                      minuteInterval: 1,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (var dateTime) {
                        var dateFormat = new DateFormat('dd-MM-yyyy');
                        String formattedDate = dateFormat.format(dateTime);
                        print(formattedDate);
                        date = formattedDate;
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<void> pickerBottomSheet(context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext e) {
        return Container(
          height: 250,
          child: Column(
            children: [
              Container(
                color: appStore.appBarColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cancel', style: primaryTextStyle(size: 18)).onTap(() {
                      finish(context);
                      toast('Please select value');
                      setState(() {});
                    }),
                    Text('Done', style: primaryTextStyle(size: 18)).onTap(() {
                      finish(context);
                      toast(selectedValue!.isNotEmpty ? selectedValue : 'Please select value');
                    })
                  ],
                ).paddingAll(8.0),
              ),
              Container(
                height: 200,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      pickerTextStyle: primaryTextStyle(),
                    ),
                  ),
                  child: CupertinoPicker(
                    backgroundColor: appStore.scaffoldBackground,
                    itemExtent: 30,
                    children: countryName.map((e) {
                      return Text(e, style: primaryTextStyle(size: 20));
                    }).toList(),
                    onSelectedItemChanged: (int val) {
                      selectedValue = countryName[val];
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
