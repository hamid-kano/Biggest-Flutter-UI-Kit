import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

import 'MLCountryPIckerComponent.dart';

class MLProfileFormComponent extends StatefulWidget {
  static String tag = '/MLProfileFormComponent';

  @override
  MLProfileFormComponentState createState() => MLProfileFormComponentState();
}

class MLProfileFormComponentState extends State<MLProfileFormComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  String dropdownValue = 'Female';
  String bloodGroupValue = 'None';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.all(16.0),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radius(30.0),
              backgroundColor: Colors.grey.shade100,
            ),
            child: Icon(Icons.camera_alt_outlined, color: mlColorBlue)),
        16.height,
        Text('First Name*', style: boldTextStyle()),
        AppTextField(
          decoration: InputDecoration(
            hintText: mlFirst_name!,
            hintStyle: secondaryTextStyle(size: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: mlColorLightGrey),
            ),
          ),
          textFieldType: TextFieldType.NAME,
        ),
        16.height,
        Text('Last Name*', style: boldTextStyle()),
        AppTextField(
          textFieldType: TextFieldType.NAME,
          decoration: InputDecoration(
            hintText: mlLast_name!,
            hintStyle: secondaryTextStyle(size: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: mlColorLightGrey),
            ),
          ),
        ),
        16.height,
        Text('Day of Birth*', style: boldTextStyle()),
        AppTextField(
          textFieldType: TextFieldType.OTHER,
          decoration: InputDecoration(
            hintText: mlDate_format!,
            hintStyle: secondaryTextStyle(size: 16),
            suffixIcon: Icon(Icons.calendar_today_outlined, color: mlColorBlue),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: mlColorLightGrey),
            ),
          ),
        ),
        16.height,
        Text('Phone Number*', style: boldTextStyle()),
        Row(
          children: [
            MLCountryPickerComponent(),
            AppTextField(
              textFieldType: TextFieldType.PHONE,
              decoration: InputDecoration(
                labelText: mlPhoneNumber!,
                labelStyle: secondaryTextStyle(size: 16),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: mlColorLightGrey),
                ),
              ),
            ).expand(),
          ],
        ),
        16.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            genderDropDown().expand(flex: 5),
            24.width,
            bloodGroupDropDown().expand(flex: 5),
          ],
        ),
        16.height,
      ],
    );
  }

  Widget genderDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gender', style: boldTextStyle()),
        DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: mlColorBlue,
          ).paddingOnly(left: 74.0),
          iconSize: 24,
          elevation: 16,
          style: secondaryTextStyle(size: 16),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>[
            'Female',
            'Male',
            'Other',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value, style: secondaryTextStyle(size: 16)));
          }).toList(),
        ),
      ],
    );
  }

  Widget bloodGroupDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Blood Group', style: boldTextStyle()),
        Container(
          constraints: BoxConstraints(minWidth: context.width() / 2.5),
          child: DropdownButton<String>(
            value: bloodGroupValue,
            icon: Icon(Icons.keyboard_arrow_down, color: mlColorBlue).paddingOnly(left: 74.0),
            iconSize: 24,
            elevation: 16,
            style: secondaryTextStyle(size: 16),
            onChanged: (String? newValue) {
              setState(() {
                bloodGroupValue = newValue!;
              });
            },
            items: <String>[
              'None',
              'A+',
              'A-',
              'B+',
              'B-',
              'O+',
              'O-',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: secondaryTextStyle(size: 16)),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
