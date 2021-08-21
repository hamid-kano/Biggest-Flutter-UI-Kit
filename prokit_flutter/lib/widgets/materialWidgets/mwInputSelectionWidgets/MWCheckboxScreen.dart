import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWCheckboxScreen extends StatefulWidget {
  static String tag = '/MWCheckboxScreen';

  @override
  MWCheckboxScreenState createState() => MWCheckboxScreenState();
}

class MWCheckboxScreenState extends State<MWCheckboxScreen> {
  bool? isChecked1 = false;
  bool isChecked2 = false;
  bool? isChecked3 = false;
  bool? isChecked4 = true;
  bool? isChecked5 = true;
  bool? isChecked6 = false;
  bool? isChecked7 = false;
  bool? isChecked8 = false;
  bool isChecked9 = false;
  bool? isChecked10 = false;
  bool? isChecked11 = false;
  bool? isChecked12 = false;

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
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, "Checkbox"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('Simple Checkbox', style: boldTextStyle(size: 18)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Checkbox(
                      activeColor: Colors.grey,
                      value: isChecked1,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked1 = value;
                        });
                      },
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Checkbox(
                      value: null,
                      onChanged: (checked) {},
                      activeColor: Colors.redAccent, // checkbox color
                      tristate: true, // whether there are three states
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Checkbox(
                      value: isChecked3, // unchecked
                      onChanged: (checked) {
                        setState(() {
                          isChecked3 = checked;
                        });
                      },
                      activeColor: Colors.redAccent, // checkbox color
                      tristate: false, // whether there are three states
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Checkbox(
                      value: isChecked4, // selected
                      onChanged: (checked) {
                        setState(() {
                          this.isChecked4 = checked;
                        });
                      },
                      activeColor: Colors.redAccent, // checkbox color
                      tristate: false, // whether there are three states
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Checkbox(
                      value: isChecked5, // control status value
                      onChanged: (checked) {
                        setState(() {
                          this.isChecked5 = checked;
                        });
                      },
                      tristate: true,
                      activeColor: appColorPrimary,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                alignment: Alignment.topLeft,
                child: Text('Custom Shape Checkbox', style: boldTextStyle(size: 18)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: new BoxDecoration(
                      color: isChecked6 == true ? appColorPrimary : Colors.transparent,
                      border: Border.all(
                        width: 1,
                        color: appStore.textPrimaryColor!,
                      ),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.transparent,
                      ),
                      child: Checkbox(
                        value: isChecked6,
                        onChanged: (state) {
                          setState(() {
                             isChecked6 = state;
                          });
                        },
                        activeColor: Colors.transparent,
                        checkColor: Colors.white,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      ),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: new BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: appStore.textPrimaryColor!,
                      ),
                      borderRadius: new BorderRadius.circular(20),
                    ),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.transparent,
                      ),
                      child: Checkbox(
                        value: isChecked7,
                        onChanged: (state) {
                          setState(() {
                             isChecked7 = state;
                          });
                        },
                        activeColor: Colors.transparent,
                        checkColor: appColorPrimary,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      ),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: new BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: appStore.textPrimaryColor!,
                      ),
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.transparent,
                      ),
                      child: Checkbox(
                        value: isChecked8,
                        onChanged: (state) {
                          setState(() {
                             isChecked8 = state;
                          });
                        },
                        activeColor: Colors.transparent,
                        checkColor: appColorPrimary,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('Checkbox Tile', style: boldTextStyle(size: 18)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5, top: 10),
                child: Card(
                  elevation: 4,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: CheckboxListTile(
                      checkColor: appStore.appBarColor,
                      value: isChecked10,
                      onChanged: (checked) {
                        setState(() {
                          isChecked10 = checked;
                        });
                      },
                      title: Text(
                        'Checkbox Tile',
                        style: boldTextStyle(size: 18),
                      ),
                      subtitle: Text(
                        'Check box with title and subtitle',
                        style: secondaryTextStyle(),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Card(
                  elevation: 4,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: CheckboxListTile(
                      checkColor: appStore.appBarColor,
                      controlAffinity: ListTileControlAffinity.leading,
                      secondary: Icon(
                        Icons.subscriptions,
                        color: appStore.iconColor,
                      ),
                      value: isChecked11,
                      onChanged: (checked) {
                        setState(() {
                          isChecked11 = checked;
                        });
                      },
                      title: Text(
                        'Checkbox Tile',
                        style: boldTextStyle(size: 18),
                      ),
                      subtitle: Text(
                        'Custom Trailing value',
                        style: secondaryTextStyle(),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Card(
                  elevation: 4,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: CheckboxListTile(
                      value: isChecked12,
                      checkColor: appStore.appBarColor,
                      secondary: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset(
                            'images/widgets/materialWidgets/mwInputSelectionWidgets/Checkbox/profile.png',
                          ).image),
                          shape: BoxShape.circle,
                        ),
                      ),
                      onChanged: (checked) {
                        setState(() {
                          isChecked12 = checked;
                        });
                      },
                      title: Text(
                        'Checkbox Tile',
                        style: boldTextStyle(size: 18),
                      ),
                      subtitle: Text(
                        'Custom Leading value ',
                        style: secondaryTextStyle(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
