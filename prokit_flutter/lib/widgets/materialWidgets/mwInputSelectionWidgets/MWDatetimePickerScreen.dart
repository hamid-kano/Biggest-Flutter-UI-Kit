import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWDatetimePickerScreen extends StatefulWidget {
  static String tag = '/MWDatetimePickerScreen';

  @override
  MWDatetimePickerScreenState createState() => MWDatetimePickerScreenState();
}

class MWDatetimePickerScreenState extends State<MWDatetimePickerScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    init();
    print(selectedTime.period);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        helpText: 'Select your Booking date',
        cancelText: 'Not Now',
        confirmText: "Book",
        fieldLabelText: 'Booking Date',
        fieldHintText: 'Month/Date/Year',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter date in valid range',
        context: context,
        builder: (BuildContext context, Widget? child) {
          return CustomTheme(
            child: child,
          );
        },
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        print(picked);
        selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
          return CustomTheme(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
              child: child!,
            ),
          );
        });

    if (picked != null)
      setState(() {
        selectedTime = picked;
      });
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
        appBar: appBar(context, "Date Time Picker"),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Card(
                  elevation: 4,
                  child: ListTile(
                    onTap: () {
                      _selectDate(context);
                    },
                    title: Text(
                      'Select your Booking date',
                      style: primaryTextStyle(),
                    ),
                    subtitle: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: secondaryTextStyle(),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.date_range,
                        color: appStore.iconColor,
                      ),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  )),
              Card(
                  elevation: 4,
                  child: ListTile(
                    onTap: () {
                      _selectTime(context);
                    },
                    title: Text(
                      'Select your checking time',
                      style: primaryTextStyle(),
                    ),
                    subtitle: Text(
                      "${selectedTime.hour < 10 ? "0${selectedTime.hour}" : "${selectedTime.hour}"} : ${selectedTime.minute < 10 ? "0${selectedTime.minute}" : "${selectedTime.minute}"} ${selectedTime.period != DayPeriod.am ? 'PM' : 'AM'}   ",
                      style: secondaryTextStyle(),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.date_range,
                        color: appStore.iconColor,
                      ),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
