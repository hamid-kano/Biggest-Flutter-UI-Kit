import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShImages.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';

class ShProfileFragment extends StatefulWidget {
  static String tag = '/ShProfileFragment';

  @override
  ShProfileFragmentState createState() => ShProfileFragmentState();
}

class ShProfileFragmentState extends State<ShProfileFragment> {
  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();
  var confirmPasswordCont = TextEditingController();
  var firstNameCont = TextEditingController();
  var lastNameCont = TextEditingController();
  String? selectedValue = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(spacing_standard_new),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(spacing_standard_new),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: spacing_standard,
                        margin: EdgeInsets.all(spacing_control),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(ic_user),
                            radius: 55,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(spacing_control),
                      margin: EdgeInsets.only(bottom: 30, right: 20),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: sh_white, border: Border.all(color: sh_colorPrimary, width: 1)),
                      child: Icon(
                        Icons.camera_alt,
                        color: sh_colorPrimary,
                        size: 16,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        controller: firstNameCont,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                        decoration: InputDecoration(
                            filled: false,
                            hintText: sh_hint_first_name,
                            hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0))),
                      ),
                    ),
                    SizedBox(
                      width: spacing_standard_new,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        controller: lastNameCont,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                        decoration: InputDecoration(
                            filled: false,
                            hintText: sh_hint_last_name,
                            hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_standard_new),
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1), borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    isExpanded: true,
                    items: <String>["Male", "Female", "Other"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: text(value, textColor: sh_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontRegular),
                      );
                    }).toList(),
                    //hint:Text(selectedValue),
                    value: selectedValue,
                    onChanged: (newVal) {
                      setState(() {
                        selectedValue = newVal;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: spacing_standard_new),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                controller: emailCont,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                decoration: InputDecoration(
                    filled: false,
                    hintText: sh_hint_Email,
                    hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0))),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                // height: double.infinity,
                child: MaterialButton(
                  padding: EdgeInsets.all(spacing_standard),
                  child: text(sh_lbl_save_profile, fontSize: textSizeNormal, fontFamily: fontMedium, textColor: sh_white),
                  textColor: sh_white,
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                  color: sh_colorPrimary,
                  onPressed: () => {},
                ),
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                // height: double.infinity,
                child: MaterialButton(
                  padding: EdgeInsets.all(spacing_standard),
                  child: text(sh_lbl_change_pswd, fontSize: textSizeNormal, fontFamily: fontMedium, textColor: sh_colorPrimary),
                  textColor: sh_white,
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0), side: BorderSide(color: sh_colorPrimary, width: 1)),
                  color: sh_white,
                  onPressed: () => {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
