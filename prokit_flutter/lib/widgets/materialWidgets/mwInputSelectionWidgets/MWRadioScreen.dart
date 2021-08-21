import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWRadioScreen extends StatefulWidget {
  static String tag = '/MWRadioScreen';

  @override
  MWRadioScreenState createState() => MWRadioScreenState();
}

class MWRadioScreenState extends State<MWRadioScreen> {
  var gender;
  var gender1;

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
        appBar: appBar(context, "Radio Button"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('Simple Radio Button', style: boldTextStyle(size: 18)),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(unselectedWidgetColor: appStore.textPrimaryColor),
                    child: Radio(
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender = value;
                          toast("$gender Selected");
                        });
                      },
                    ),
                  ),
                  Text('Male', style: primaryTextStyle()),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Radio(
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender = value;
                          toast("$gender Selected");
                        });
                      },
                    ),
                  ),
                  Text('Female', style: primaryTextStyle()),
                  Theme(
                    data: Theme.of(context).copyWith(unselectedWidgetColor: appStore.textPrimaryColor),
                    child: Radio(
                      value: 'Transgender',
                      groupValue: gender,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender = value;
                          toast("$gender Selected");
                        });
                      },
                    ),
                  ),
                  Text('Transgender', style: primaryTextStyle()),
                ],
              ),
              8.height,
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('Radio Button Tile', style: boldTextStyle(size: 18)),
              ),
              Card(
                margin: EdgeInsets.only(top: 10),
                elevation: 4,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: appStore.textPrimaryColor,
                  ),
                  child: RadioListTile(
                      title: Text(
                        'Radio Button Tile',
                        style: boldTextStyle(),
                      ),
                      subtitle: Text(
                        'Simple Radio button tile with title and subtitle',
                        style: secondaryTextStyle(),
                      ),
                      value: 'Radio button tile',
                      groupValue: gender1,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender1 = value;
                          toast("$gender1 Selected");
                        });
                      }),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.only(top: 10),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: appStore.textPrimaryColor,
                  ),
                  child: RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(
                        'Radio Button Tile',
                        style: boldTextStyle(),
                      ),
                      subtitle: Text(
                        'Radio Button on the trailing side',
                        style: secondaryTextStyle(),
                      ),
                      value: 'Radio Button on the trailing side',
                      groupValue: gender1,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender1 = value;
                          toast("Radio Button on the trailing side");
                        });
                      }),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 10),
                elevation: 4,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: appStore.textPrimaryColor,
                  ),
                  child: RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      secondary: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset(
                            'images/widgets/materialWidgets/mwInputSelectionWidgets/Checkbox/profile.png',
                          ).image),
                          shape: BoxShape.circle,
                        ),
                      ),
                      title: Text(
                        'Radio Button Tile',
                        style: boldTextStyle(),
                      ),
                      subtitle: Text(
                        'Radio Button Tile with leading and trailing side.',
                        style: secondaryTextStyle(),
                      ),
                      value: 'Female',
                      groupValue: gender1,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender1 = value;
                        });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
