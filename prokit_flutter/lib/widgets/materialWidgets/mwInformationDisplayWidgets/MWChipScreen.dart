import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class MWChipScreen extends StatefulWidget {
  static String tag = '/MWChipScreen';

  @override
  MWChipScreenState createState() => MWChipScreenState();
}

class MWChipScreenState extends State<MWChipScreen> {
  var isSelected = false;
  int? _value = 1;
  int _value1 = 1;
  int _value2 = 1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  List<String> programmingList = [
    "Task 1",
    "Task 2",
    "Task 3",
  ];
  List<String> selectedProgrammingList = [];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'Chips'),
        body: CustomTheme(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text("Simple Chip", style: boldTextStyle(color: appStore.textPrimaryColor)),
                ),
                Row(
                  children: [
                    Chip(
                      deleteIcon: Icon(Icons.close),
                      onDeleted: () {
                        setState(() {});
                      },
                      label: Text("Task 1"),
                    ).paddingLeft(16),
                    Chip(label: Text('Task 2')).paddingLeft(16)
                  ],
                ),
                16.height,
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text("Choice Chip", style: boldTextStyle(color: appStore.textPrimaryColor)),
                ),
                Wrap(
                  children: List<Widget>.generate(
                    3,
                    (int index) {
                      return ChoiceChip(
                        label: Text('Item $index'),
                        selectedColor: appColorPrimary,
                        selected: _value == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? index : null;
                          });
                        },
                      ).paddingLeft(16);
                    },
                  ).toList(),
                ),
                16.height,
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text("Filter Chip", style: boldTextStyle(color: appStore.textPrimaryColor)),
                ),
                Wrap(
                  children: List<Widget>.generate(
                    3,
                    (int index) {
                      return FilterChip(
                        label: Text('Item $index'),
                        labelStyle: TextStyle(color: _value1 == index ? white : appStore.appBarColor),
                        selected: _value1 == index,
                        selectedColor: appColorPrimary,
                        checkmarkColor: appStore.appBarColor,
                        onSelected: (bool selected) {
                          setState(() {
                            _value1 = index;
                          });
                        },
                      ).paddingLeft(16);
                    },
                  ).toList(),
                ),
                Wrap(
                  children: List<Widget>.generate(
                    3,
                    (int index) {
                      return FilterChip(
                        label: Text('Item $index'),
                        shape: StadiumBorder(side: BorderSide()),
                        labelStyle: TextStyle(color: _value2 == index ? white : appStore.appBarColor),
                        selected: _value2 == index,
                        selectedColor: Colors.green,
                        checkmarkColor: appStore.appBarColor,
                        onSelected: (bool selected) {
                          setState(() {
                            _value2 = index;
                          });
                        },
                      ).paddingLeft(16);
                    },
                  ).toList(),
                ),
                16.height,
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    "Action Chip",
                    style: boldTextStyle(color: appStore.textPrimaryColor),
                  ),
                ),
                Row(
                  children: [
                    ActionChip(
                      avatar: CircleAvatar(backgroundColor: Colors.grey.shade800, child: Text('L')),
                      label: Text('Lee'),
                      onPressed: () {
                        print("If you stand for nothing, Burr, what’ll you fall for?");
                      },
                    ).paddingLeft(16.0),
                    ActionChip(
                      avatar: CircleAvatar(backgroundColor: Colors.grey.shade800, backgroundImage: AssetImage('images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item4.jpg')),
                      label: Text('John Smith'),
                      onPressed: () {
                        print("If you stand for nothing, Burr, what’ll you fall for?");
                      },
                    ).paddingLeft(16.0),
                  ],
                ),
                ActionChip(
                  avatar: isSelected ? CircularProgressIndicator(backgroundColor: black, strokeWidth: 1.5) : null,
                  label: Text('${isSelected ? 'Downloading...' : 'Download'}'),
                  labelStyle: primaryTextStyle(color: black),
                  onPressed: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                ).paddingLeft(16.0),
                16.height,
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    "Multi Selection",
                    style: boldTextStyle(color: appStore.textPrimaryColor),
                  ),
                ),
                MultiSelectChip(
                  programmingList,
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      selectedProgrammingList = selectedList;
                    });
                  },
                ).paddingLeft(16.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>)? onSelectionChanged;

  MultiSelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = [];

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item) ? selectedChoices.remove(item) : selectedChoices.add(item);
              widget.onSelectionChanged!(selectedChoices);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
