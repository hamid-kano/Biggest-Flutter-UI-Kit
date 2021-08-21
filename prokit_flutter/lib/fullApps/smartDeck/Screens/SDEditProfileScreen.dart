import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/screens/ShowViewCase/SVCHomePage.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDStyle.dart';

class SDEditProfileScreen extends StatefulWidget {
  @override
  _SDEditProfileScreenState createState() => _SDEditProfileScreenState();
}

class _SDEditProfileScreenState extends State<SDEditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    String? _selectedLocation = 'Female';
    String? _selectedValue = '12th Grade';

    Widget mInput(var mLabel) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 10, 16),
        child: TextField(
          decoration: InputDecoration(contentPadding: EdgeInsets.all(0.0), isDense: true, hintText: mLabel, border: InputBorder.none),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              finish(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text('Edit Profile', style: boldTextStyle(size: 20)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              CircleAvatar(radius: 45, backgroundImage: NetworkImage('https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp')),
              FittedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                  decoration: boxDecorations(radius: 4, bgColor: sdPrimaryColor),
                  child: Center(
                    child: Text('Change Profile Photo', style: boldTextStyle(size: 12, color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: boxDecorations(showShadow: true),
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    mInput("Mark"),
                    Divider(height: 1, thickness: 1),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedLocation,
                        items: <String>['Female', 'Male', 'Other'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: primaryTextStyle(size: 16, color: sdTextPrimaryColor)),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLocation = newValue;
                          });
                        },
                      ),
                    ),
                    Divider(height: 1, thickness: 1),
                    mInput("mark@gmail.com"),
                    Divider(height: 1, thickness: 1),
                    mInput("New York"),
                    Divider(height: 1, thickness: 1),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedValue,
                        items: <String>['12th Grade', 'B.Tech', '10th Grade'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: primaryTextStyle(size: 16, color: sdTextPrimaryColor)),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedValue = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        persistentFooterButtons: <Widget>[
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 15, right: 15),
            width: MediaQuery.of(context).copyWith().size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    finish(context);
                  },
                  child: Text('Cancel', style: secondaryTextStyle()),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      finish(context);
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                      decoration: boxDecorations(radius: 4, bgColor: sdPrimaryColor),
                      child: Center(
                        child: Text('Save', style: boldTextStyle(size: 12, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
