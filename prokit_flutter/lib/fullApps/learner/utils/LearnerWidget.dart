import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

// ignore: non_constant_identifier_names
Container LearnerEditTextStyle(var hintText, {isPassword = false}) {
  return Container(
    decoration: boxDecoration(radius: 40, showShadow: true, bgColor: learner_white),
    child: TextFormField(
      style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
        hintText: hintText,
        filled: true,
        fillColor: learner_white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: learner_white, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: learner_white, width: 0.0),
        ),
      ),
    ),
  );
}

// ignore: must_be_immutable
class LearnerButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;

  LearnerButton({required this.textContent, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return T9ButtonState();
  }
}

class T9ButtonState extends State<LearnerButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: const EdgeInsets.all(0.0),
          elevation: 4,
          primary: learner_colorPrimary,
          textStyle: TextStyle(color: learner_white)),
      onPressed: widget.onPressed,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.textContent,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
