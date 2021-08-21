import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class MWExpansionPanelScreen extends StatefulWidget {
  static String tag = '/MWExpansionPanelScreen';

  @override
  MWExpansionPanelScreenState createState() => MWExpansionPanelScreenState();
}

class MWExpansionPanelScreenState extends State<MWExpansionPanelScreen> {
  @override
  void initState() {
    super.initState();
    init();
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
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      appBar: appBar(context, 'Expansion Panel'),
      body: MyStatefulWidget(),
    );
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String? expandedValue;
  String? headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(headerValue: 'Item $index', expandedValue: 'This is item number $index');
  });
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Theme(
          data: Theme.of(context).copyWith(cardColor: appStore.scaffoldBackground),
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return CustomTheme(
      child: ExpansionPanelList(
        dividerColor: Theme.of(context).dividerColor.withOpacity(0.5),
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(title: Text(item.headerValue!, style: primaryTextStyle(color: appStore.textPrimaryColor)));
            },
            body: ListTile(
              title: Text(item.expandedValue!, style: primaryTextStyle(color: appStore.textPrimaryColor)),
              subtitle: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.', style: boldTextStyle(color: appStore.textSecondaryColor)),
              ),
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
