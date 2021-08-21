import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWDropDownButtonScreen extends StatefulWidget {
  static const tag = '/MWDropDownButtonScreen';

  @override
  _MWDropDownButtonScreenState createState() => _MWDropDownButtonScreenState();
}

class _MWDropDownButtonScreenState extends State<MWDropDownButtonScreen> {
  List<String> listOfCategory = ['It', 'Computer Science', 'Business', 'Data Science', 'Infromation Technologies', 'Health', 'Physics'];
  String? selectedIndexCategory = 'Business';
  String? dropdownNames;
  String? dropdownScrollable = 'I';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "DropDown Button"),
      body: Container(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Text('Category', style: boldTextStyle()),
              10.height,
              Card(
                  elevation: 4,
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: appStore.appBarColor,
                    value: selectedIndexCategory,
                    style: boldTextStyle(),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: appStore.iconColor,
                    ),
                    underline: 0.height,
                    onChanged: (dynamic newValue) {
                      setState(() {
                        toast(newValue);
                        selectedIndexCategory = newValue;
                      });
                    },
                    items: listOfCategory.map((category) {
                      return DropdownMenuItem(
                        child: Text(category, style: primaryTextStyle()).paddingLeft(8),
                        value: category,
                      );
                    }).toList(),
                  )),
              10.height,
              Text('Dropdown with  Hint', style: boldTextStyle()),
              10.height,
              DropdownButton<String>(
                value: dropdownNames,
                underline: 0.height,
                dropdownColor: appStore.appBarColor,
                hint: Text(
                  'Choose Text Style',
                  style: primaryTextStyle(size: 16),
                ).paddingLeft(8),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: appStore.iconColor,
                ).paddingLeft(10),
                onChanged: (String? newValue) {
                  setState(() {
                    toast(newValue);
                    dropdownNames = newValue;
                  });
                },
                items: <String>['Normal', 'Bold', 'Italic', 'Underline'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Tooltip(message: value, child: Container(margin: EdgeInsets.only(left: 4, right: 4), child: Text(value, style: primaryTextStyle()))),
                  );
                }).toList(),
              ),
              10.height,
              Text('Scrollable Dropdown', style: boldTextStyle()),
              10.height,
              DropdownButton<String>(
                value: dropdownScrollable,
                underline: 0.height,
                dropdownColor: appStore.appBarColor,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: appStore.iconColor,
                ).paddingLeft(10),
                onChanged: (String? newValue) {
                  toast(newValue);
                  setState(() {
                    dropdownScrollable = newValue;
                  });
                },
                items: <String>[
                  'I',
                  'He',
                  'She',
                  'You',
                  'We',
                  'They',
                  'Am',
                  'Is',
                  'Are',
                  'A',
                  'An',
                  'Me',
                  'His',
                  'Her',
                  'Your',
                  'Our',
                  'The',
                  'i',
                  'he',
                  'she',
                  'you',
                  'we',
                  'they',
                  'am',
                  'is',
                  'are',
                  'a',
                  'an',
                  'me',
                  'his',
                  'her',
                  'your',
                  'our',
                  'the',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: primaryTextStyle()).paddingLeft(8),
                  );
                }).toList(),
              ),
              10.height,
            ],
          ),
        ),
      ),
    );
  }
}
