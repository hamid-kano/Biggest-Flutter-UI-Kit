import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWTextFormFieldScreen extends StatefulWidget {
  static String tag = '/MWTextFormFieldScreen';

  @override
  MWTextFormFieldScreenState createState() => MWTextFormFieldScreenState();
}

class MWTextFormFieldScreenState extends State<MWTextFormFieldScreen> {
  var formKey = GlobalKey<FormState>();
  var autoValidate = false;

  var usernameCont = TextEditingController();
  var emailCont = TextEditingController();
  var phoneCont = TextEditingController();
  var addressCont = TextEditingController();
  var pinCont = TextEditingController();
  var urlCont = TextEditingController();
  var donateCont = TextEditingController();

  var usernameFocus = FocusNode();
  var emailFocus = FocusNode();
  var phoneFocus = FocusNode();
  var addressFocus = FocusNode();
  var pinFocus = FocusNode();
  var urlFocus = FocusNode();
  var donateFocus = FocusNode();

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
        appBar: appBar(context, "TextForm Field"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameCont,
                    focusNode: usernameFocus,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'Username*',
                      labelStyle: primaryTextStyle(),
                    ),
                    cursorColor: appStore.isDarkModeOn ? white : blackColor,
                    keyboardType: TextInputType.name,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'Usermame is required';
                      if (!s.trim().isAlpha()) return 'Username is not valid';
                      return null;
                    },
                  ),
                  10.height,
                  TextFormField(
                    controller: emailCont,
                    style: primaryTextStyle(),
                    focusNode: emailFocus,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'Email',
                      labelStyle: primaryTextStyle(),
                    ),
                    cursorColor: appStore.isDarkModeOn ? white : blackColor,
                    keyboardType: TextInputType.emailAddress,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'Email is required';
                      if (!s.trim().validateEmail()) return 'Email is not valid';
                      return null;
                    },
                  ),
                  10.height,
                  TextFormField(
                    controller: phoneCont,
                    focusNode: phoneFocus,
                    maxLength: 10,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      counterStyle: secondaryTextStyle(),
                      labelText: 'Mobile Number*',
                      labelStyle: primaryTextStyle(),
                    ),
                    cursorColor: appStore.isDarkModeOn ? white : blackColor,
                    keyboardType: TextInputType.number,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'Mobile is required';
                      if (!s.trim().validatePhone()) return 'Mobile is not valid';
                      return null;
                    },
                  ),
                  10.height,
                  TextFormField(
                    controller: addressCont,
                    focusNode: addressFocus,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'Address',
                      labelStyle: primaryTextStyle(),
                      alignLabelWithHint: true,
                    ),
                    maxLines: 3,
                    cursorColor: appStore.isDarkModeOn ? white : blackColor,
                    keyboardType: TextInputType.multiline,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'Address is required';
                      return null;
                    },
                  ),
                  10.height,
                  TextFormField(
                    controller: pinCont,
                    focusNode: pinFocus,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.pin_drop,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'PinCode',
                      labelStyle: primaryTextStyle(),
                    ),
                    cursorColor: appStore.isDarkModeOn ? white : blackColor,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'Pin is required';
                      if (!s.trim().isDigit()) return 'Pin is not valid';
                      return null;
                    },
                  ),
                  10.height,
                  TextFormField(
                    controller: urlCont,
                    style: primaryTextStyle(),
                    focusNode: urlFocus,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      prefixIcon: Icon(
                        Icons.web,
                        color: appStore.iconColor,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                      labelText: 'URL',
                      labelStyle: primaryTextStyle(),
                    ),
                    cursorColor: appStore.isDarkModeOn ? white : blackColor,
                    keyboardType: TextInputType.url,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'URL is required';
                      if (!s.trim().validateURL()) return 'URL is not valid';
                      return null;
                    },
                  ),
                  10.height,
                  TextFormField(
                    controller: donateCont,
                    style: primaryTextStyle(),
                    focusNode: donateFocus,
                    cursorColor: appStore.isDarkModeOn ? white : blackColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: appStore.iconColor!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                        ),
                        labelText: 'Donate',
                        prefixText: '\₹ ',
                        labelStyle: primaryTextStyle(),
                        prefixStyle: primaryTextStyle(),
                        suffixText: 'INR',
                        suffixStyle: boldTextStyle(color: Colors.green)),
                    maxLines: 1,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'Donate amount is required';
                      if (!s.trim().isDigit()) return 'Donate amount is not valid';
                      return null;
                    },
                  ),
                  CustomTheme(
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        } else {
                          autoValidate = true;
                        }

                        setState(() {});
                      },
                      child: Text('Submit', style: boldTextStyle(color: white)),
                    ),
                  ).paddingTop(15)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
