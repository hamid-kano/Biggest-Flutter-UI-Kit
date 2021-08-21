import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/model/BHModel.dart';

import 'BHColors.dart';

Widget textFieldWidget(String hintText, TextEditingController controller, {bool obscureText = false, bool isPassword = true}) {
  return TextFormField(
    obscureText: isPassword,
    style: TextStyle(color: Colors.black),
    controller: controller,
    decoration: InputDecoration(
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      labelText: hintText,
      labelStyle: TextStyle(color: Colors.grey),
      suffixIcon: GestureDetector(
        onTap: () {
          isPassword = !isPassword;
        },
        child: Icon(
          isPassword ? Icons.visibility_off : Icons.visibility,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget raiseButton({required String btnText}) {
  return Container(
    width: 130,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(8),
        primary: whiteColor,
        shape: RoundedRectangleBorder(side: BorderSide(color: BHGreyColor)),
      ),
      onPressed: () {},
      child: Text(
        btnText,
        style: TextStyle(
          color: BHAppTextColorSecondary,
          fontSize: 15,
        ),
      ),
    ),
  );
}

Widget raiseButton1(String btnText1) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(12),
      primary: BHColorPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
    onPressed: () {},
    child: Text(
      btnText1,
      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    ),
  );
}

// ignore: must_be_immutable
class EditTextFieldWidget extends StatefulWidget {
  static String tag = '/EditTextFieldWidget';

  String? hintText = '';
  TextEditingController? controller;
  bool? isPassword;
  bool? showPassword = false;

  EditTextFieldWidget({this.hintText, this.controller, this.showPassword});

  @override
  EditTextFieldWidgetState createState() => EditTextFieldWidgetState();
}

class EditTextFieldWidgetState extends State<EditTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(color: Colors.black),
      // obscureText: !showPassword,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        labelText: widget.hintText,
        labelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    Key? key,
    required this.isMe,
    required this.data,
  }) : super(key: key);

  final bool isMe;
  final BHMessageModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMe.validate() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          margin: isMe.validate() ? EdgeInsets.only(top: 3.0, bottom: 3.0, right: 0, left: (500 * 0.25).toDouble()) : EdgeInsets.only(top: 4.0, bottom: 4.0, left: 0, right: (500 * 0.25).toDouble()),
          decoration: BoxDecoration(
            color: !isMe ? Colors.red.withOpacity(0.85) : white,
            boxShadow: defaultBoxShadow(),
            borderRadius: isMe.validate()
                ? BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10), topRight: Radius.circular(10))
                : BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
            border: Border.all(color: isMe ? Theme.of(context).dividerColor : Colors.transparent),
          ),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: Text(data.msg!, style: primaryTextStyle(color: !isMe ? white : textPrimaryColor))),
              Text(data.time!, style: secondaryTextStyle(color: !isMe ? white : textSecondaryColor, size: 12))
            ],
          ),
        ),
      ],
    );
  }
}
