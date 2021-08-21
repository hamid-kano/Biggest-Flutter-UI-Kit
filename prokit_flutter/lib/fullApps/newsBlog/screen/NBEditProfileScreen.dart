import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBImages.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBEditProfileScreen extends StatefulWidget {
  static String tag = '/NBEditProfileScreen';

  @override
  NBEditProfileScreenState createState() => NBEditProfileScreenState();
}

class NBEditProfileScreenState extends State<NBEditProfileScreen> {
  TextEditingController userNameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  FocusNode userNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  late File imageFile;
  bool loadFromFile = false;

  Future getImage(ImageSource source) async {
    var image = await ImagePicker().getImage(source: source);
    setState(() {
      if (image != null) {
        imageFile = File(image.path);
        loadFromFile = true;
      }
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nbAppBarWidget(context, title: 'Edit Profile'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: loadFromFile
                  ? Image.file(imageFile, fit: BoxFit.cover, width: 100, height: 100).cornerRadiusWithClipRRect(50)
                  : Image.asset(NBProfileImage, fit: BoxFit.cover, width: 100, height: 100).cornerRadiusWithClipRRect(50),
            ).onTap(() {
              getImage(ImageSource.gallery);
            }),
            8.height,
            Text(
              'Upload Image',
              style: boldTextStyle(),
            ),
            16.height,
            nbAppTextFieldWidget(userNameCont, 'Edit Username', TextFieldType.OTHER, focus: userNameFocus, nextFocus: emailFocus),
            16.height,
            nbAppTextFieldWidget(emailCont, 'Change Email', TextFieldType.EMAIL, focus: emailFocus, nextFocus: passwordFocus),
            16.height,
            nbAppTextFieldWidget(passwordCont, 'Change Password', TextFieldType.PASSWORD, focus: passwordFocus),
            16.height,
            nbAppButtonWidget(context, 'Save', () {
              toast('Profile updated Successfully');
              finish(context);
            })
          ],
        ).paddingAll(16),
      ),
    );
  }
}
