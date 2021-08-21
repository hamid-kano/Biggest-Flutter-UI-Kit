import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Images.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Widgets.dart';

class T2Profile extends StatefulWidget {
  static var tag = "/T2Profile";

  @override
  T2ProfileState createState() => T2ProfileState();
}

class T2ProfileState extends State<T2Profile> {
  String? _selectedLocation = 'Male';
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = t2_user_name;
    addressController.text = t2_profile_address;
    contactController.text = t2_profile_contactNo;
    emailController.text = t2_user_email;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => Stack(
            children: <Widget>[
              CachedNetworkImage(
                placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                imageUrl: t2_profile_cover_page_54,
                width: width,
                height: height / 2.5,
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: height / 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.camera_alt, size: 16, color: t2_white),
                          SizedBox(width: 10),
                          Text(t2_edit_cover_photo, style: primaryTextStyle(color: white)),
                          SizedBox(width: 20)
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: width,
                        decoration: BoxDecoration(color: t2_colorPrimary, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(16),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 16, 16, 16),
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 16),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(16),
                                          child: CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: t2_profile, width: 80, height: 80),
                                        ),
                                        SizedBox(width: 24),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(t2_user_name, style: boldTextStyle(color: white, size: 16)),
                                              SizedBox(height: 8),
                                              Text(t2_user_email, style: primaryTextStyle(color: t2_white, size: 16)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 35,
                                      height: 35,
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          finish(context);
                                        },
                                        child: Icon(Icons.edit, color: t2TextColorPrimary),
                                        backgroundColor: t2_white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: width,
                              decoration: BoxDecoration(color: appStore.scaffoldBackground, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                              child: Container(
                                width: width,
                                height: height,
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(t2_lbl_personal, style: primaryTextStyle(size: 18)),
                                    T2EditTextField(
                                      isPassword: false,
                                      mController: nameController,
                                      fontSize: 16.0,
                                    ),
                                    CustomTheme(
                                      child: DropdownButton<String>(
                                        value: _selectedLocation,
                                        items: <String>['Female', 'Male'].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value, style: primaryTextStyle(size: 18)),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedLocation = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                    T2EditTextField(isPassword: false, mController: addressController, maxLine: 2, fontSize: 16.0),
                                    SizedBox(height: 30),
                                    Text(t2_lbl_contacts, style: primaryTextStyle(color: appStore.textPrimaryColor, size: 18)),
                                    T2EditTextField(isPassword: false, mController: contactController, fontSize: 16.0),
                                    T2EditTextField(isPassword: false, mController: emailController, fontSize: 16.0),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        finish(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Center(
                        child: Text(t2_lbl_profile, maxLines: 2, style: boldTextStyle(size: 22, color: t2_textColorPrimary)),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[t2_colorPrimary, t2_colorPrimaryDark]),
                  ),
                  child: Text(t2_lbl_save, style: primaryTextStyle(size: 18, color: white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
