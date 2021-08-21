import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

Widget button(
  BuildContext context,
  String text, {
  Color textColor = grocery_color_white,
  Color backgroundColor = grocery_colorPrimary,
  double height = 40,
  double width = 150,
}) {
  return MaterialButton(
    onPressed: () {
      //
    },
    height: height,
    minWidth: width,
    padding: const EdgeInsets.all(0.0),
    child: Text(text, style: TextStyle(fontSize: 18), textAlign: TextAlign.center).cornerRadiusWithClipRRect(25),
    textColor: textColor,
    color: backgroundColor,
  ).cornerRadiusWithClipRRect(10).paddingOnly(left: 8, right: 8);
}

// ignore: must_be_immutable, camel_case_types
class groceryButton extends StatefulWidget {
  static String tag = '/dpButton';
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;
  var height = 50.0;
  var radius = 5.0;
  var bgColors = grocery_colorPrimary;
  Color? color = grocery_colorPrimary;

  groceryButton({required this.textContent, required this.onPressed, this.isStroked = false, this.height = 50.0, this.radius = 5.0, this.color, this.bgColors = grocery_colorPrimary});

  @override
  groceryButtonState createState() => groceryButtonState();
}

// ignore: camel_case_types
class groceryButtonState extends State<groceryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
        alignment: Alignment.center,
        child: text(widget.textContent,
            textColor: widget.isStroked ? grocery_colorPrimary : grocery_color_white, fontSize: textSizeLargeMedium, isCentered: true, fontFamily: fontSemiBold, textAllCaps: true),
        decoration: widget.isStroked ? boxDecoration(bgColor: Colors.transparent, color: grocery_colorPrimary) : boxDecoration(bgColor: widget.bgColors, radius: widget.radius),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class groceryButton1 extends StatefulWidget {
  static String tag = '/dpButton';
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;
  var height = 50.0;

  groceryButton1({required this.textContent, required this.onPressed, this.isStroked = false, this.height = 50.0});

  @override
  groceryButton1State createState() => groceryButton1State();
}

// ignore: camel_case_types
class groceryButton1State extends State<groceryButton1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
        alignment: Alignment.center,
        child: text(widget.textContent,
            textColor: widget.isStroked ? grocery_textGreenColor : grocery_textGreenColor, fontSize: textSizeLargeMedium, isCentered: true, fontFamily: fontSemiBold, textAllCaps: false),
        decoration: widget.isStroked ? boxDecoration(bgColor: grocery_color_white, color: grocery_color_white) : boxDecoration(bgColor: grocery_color_white, radius: 5.0),
      ),
    );
  }
}

// ignore: must_be_immutable
class EditText extends StatefulWidget {
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var maxLine;
  var keyboardType;
  TextEditingController? mController;

  VoidCallback? onPressed;

  EditText(
      {var this.fontSize = textSizeMedium,
      var this.textColor = grocery_textColorSecondary,
      var this.fontFamily = fontRegular,
      var this.isPassword = true,
      var this.isSecure = false,
      var this.text = "",
      var this.mController,
      var this.keyboardType,
      var this.maxLine = 1});

  @override
  State<StatefulWidget> createState() {
    return EditTextState();
  }
}

class EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isSecure) {
      return TextFormField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: grocery_textGreenColor,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 8, 4, 8),
          hintText: widget.text,
//          labelText: widget.text,
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: grocery_view_color, width: 0.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: grocery_view_color, width: 0.0),
          ),
        ),
        maxLines: widget.maxLine,
        style: TextStyle(fontSize: widget.fontSize, color: grocery_textColorPrimary, fontFamily: widget.fontFamily),
      );
    } else {
      return TextField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: grocery_colorPrimary,
        decoration: InputDecoration(
          suffixIcon: new GestureDetector(
            onTap: () {
              setState(() {
                widget.isPassword = !widget.isPassword;
              });
            },
            child: new Icon(widget.isPassword ? Icons.visibility : Icons.visibility_off),
          ),
          contentPadding: EdgeInsets.fromLTRB(16, 8, 4, 8),
          hintText: widget.text,
          labelText: widget.text,
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: grocery_view_color, width: 0.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: grocery_view_color, width: 0.0),
          ),
        ),
        style: TextStyle(fontSize: widget.fontSize, color: grocery_textColorPrimary, fontFamily: widget.fontFamily),
      );
    }
  }
}

Widget title(String title, Color headerColor, Color textColor, BuildContext context) {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      Container(color: headerColor),
      Center(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back, size: 30, color: textColor).paddingOnly(top: spacing_standard_new),
              onPressed: () {
                finish(context);
              },
            ),
            text(title, textColor: textColor, fontSize: textSizeNormal, fontFamily: fontBold, isCentered: true).paddingOnly(left: spacing_standard, top: 26)
          ],
        ).paddingOnly(left: spacing_standard, right: spacing_standard),
      )
    ],
  );
}

Widget title1(String title, Color color1, Color textColor, BuildContext context) {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      Container(color: color1),
      Center(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.close, size: 30, color: textColor).paddingOnly(top: spacing_standard_new),
              onPressed: () {
                finish(context);
              },
            ),
            text(title, textColor: textColor, fontSize: textSizeNormal, fontFamily: fontBold, isCentered: true).paddingOnly(left: spacing_standard, top: 26)
          ],
        ).paddingOnly(
          left: spacing_standard,
          right: spacing_standard,
        ),
      )
    ],
  );
}

class PinEntryTextField extends StatefulWidget {
  final String? lastPin;
  final int fields;
  final onSubmit;
  final fieldWidth;
  final fontSize;
  final isTextObscure;
  final showFieldAsBox;

  PinEntryTextField({this.lastPin, this.fields: 4, this.onSubmit, this.fieldWidth: 40.0, this.fontSize: 16.0, this.isTextObscure: false, this.showFieldAsBox: false}) : assert(fields > 0);

  @override
  State createState() {
    return PinEntryTextFieldState();
  }
}

class PinEntryTextFieldState extends State<PinEntryTextField> {
  late List<String?> _pin;
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;

  Widget textfields = Container();

  @override
  void initState() {
    super.initState();
    _pin = List<String?>.filled(widget.fields, null, growable: false);
    _focusNodes = List<FocusNode?>.filled(widget.fields, null, growable: false);
    _textControllers = List<TextEditingController?>.filled(widget.fields, null, growable: false);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin!.length; i++) {
            _pin[i] = widget.lastPin![i];
          }
        }
        textfields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    _textControllers.forEach((TextEditingController? t) => t!.dispose());
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context);
    });

    if (_pin.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, verticalDirection: VerticalDirection.down, children: textFields);
  }

  void clearTextFields() {
    _textControllers.forEach((TextEditingController? tEditController) => tEditController!.clear());
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i]!.text = widget.lastPin![i];
      }
    }

    _focusNodes[i]!.addListener(() {
      if (_focusNodes[i]!.hasFocus) {}
    });

    return Container(
      width: widget.fieldWidth,
      margin: EdgeInsets.only(right: 20.0),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(color: Colors.black, fontFamily: fontMedium, fontSize: widget.fontSize),
        focusNode: _focusNodes[i],
        obscureText: widget.isTextObscure,
        decoration: InputDecoration(counterText: "", border: widget.showFieldAsBox ? OutlineInputBorder(borderSide: BorderSide(width: 2.0)) : null),
        onChanged: (String str) {
          setState(() {
            _pin[i] = str;
          });
          if (i + 1 != widget.fields) {
            _focusNodes[i]!.unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            }
          } else {
            _focusNodes[i]!.unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
          if (_pin.every((String? digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
        onSubmitted: (String str) {
          if (_pin.every((String? digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
      ).paddingOnly(left: spacing_control, right: spacing_control),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textfields;
  }
}

// ignore: must_be_immutable
class TopBar extends StatefulWidget {
  var leftIcon;
  var titleName;
  var rightIcon;
  VoidCallback onPressed;

  TopBar(var this.leftIcon, var this.titleName, var this.rightIcon, this.onPressed);

  @override
  State<StatefulWidget> createState() {
    return TopBarState();
  }
}

class TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: grocery_colorPrimary,
        padding: EdgeInsets.only(right: spacing_standard_new),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(widget.leftIcon),
                  color: grocery_color_white,
                  onPressed: () {
                    finish(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Center(
                    child: text(widget.titleName, fontFamily: fontBold, textColor: grocery_color_white, fontSize: textSizeLargeMedium),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: widget.onPressed,
              child: Icon(
                widget.rightIcon,
                color: grocery_color_white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
