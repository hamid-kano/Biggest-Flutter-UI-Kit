import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

class QIBusEditProfile extends StatefulWidget {
  static String tag = '/QIBusEditProfile';

  @override
  QIBusEditProfileState createState() => QIBusEditProfileState();
}

class QIBusEditProfileState extends State<QIBusEditProfile> {
  String? _selectedLocation = 'Male';

  final profileImg = new Container(
      alignment: FractionalOffset.center,
      child: new CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(qibus_ic_profile),
        radius: 50,
      ));

  Widget rowHeading(var label, var subLabel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: text(label, textColor: qIBus_textChild),
          ),
          Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                isDense: true,
                hintText: subLabel,
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }

  Row rowHeading1(var label) {
    return Row(
      children: <Widget>[
        Padding(padding: const EdgeInsets.fromLTRB(10, 0, 10, 0), child: text(label, fontFamily: fontMedium)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: qIBus_app_background,
        body: Column(
          children: <Widget>[
            TopBar(
              QIBus_lbl_edit_profile,
              icon: qibus_gif_bell,
              isVisible: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        profileImg,
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
                        decoration: boxDecoration(
                          showShadow: true,
                          bgColor: qIBus_white,
                          radius: spacing_middle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(spacing_standard, spacing_standard, spacing_standard, spacing_standard_new),
                          child: Column(
                            children: <Widget>[
                              rowHeading1(QIBus_title_edit_your_name),
                              SizedBox(height: spacing_standard),
                              rowHeading(QIBus_lbl_first_name, QIBus_txt_user_name),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                child: view(),
                              ),
                              SizedBox(height: 8),
                              rowHeading(QIBus_lbl_last_name, QIBus_text_user_last_name),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                                child: view(),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: text(QIBus_lbl_gender, textColor: qIBus_textChild),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: _selectedLocation,
                                            items: <String>['Female', 'Male'].map((String value) {
                                              return new DropdownMenuItem<String>(
                                                value: value,
                                                child: text(value, fontSize: textSizeMedium, textColor: qIBus_textChild),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedLocation = newValue;
                                              });
                                            },
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new, bottom: spacing_standard_new),
                        decoration: boxDecoration(
                          showShadow: true,
                          bgColor: qIBus_white,
                          radius: spacing_middle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(spacing_standard, spacing_standard, spacing_standard, spacing_standard_new),
                          child: Column(
                            children: <Widget>[
                              rowHeading1(QIBus_title_edit_your_contact),
                              SizedBox(height: spacing_standard),
                              rowHeading(QIBus_lbl_email, QIBus_txt_email_id),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                child: view(),
                              ),
                              SizedBox(height: 8),
                              rowHeading(QIBus_text_phone, QIBus_text_user_phone),
                            ],
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                      child: QIBusAppButton(
                        textContent: QIBus_text_save,
                        onPressed: () {
                          finish(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: spacing_standard_new,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
