import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/screen/QIBusNotification.dart';

import 'QiBusColors.dart';
import 'QiBusConstant.dart';

Padding editTextStyle(var hintText, {var line = 1}) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextFormField(
        maxLines: line,
        style: TextStyle(
          fontSize: textSizeMedium,
          fontFamily: fontRegular,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(spacing_standard_new, 16, 4, 16),
          hintText: hintText,
          filled: true,
          fillColor: qIBus_white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(spacing_middle),
            borderSide: const BorderSide(color: qIBus_view_color, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(spacing_middle),
            borderSide: const BorderSide(color: qIBus_view_color, width: 0.0),
          ),
        ),
      ));
}

Container homeEditTextStyle(var hintText, {var line = 1}) {
  return Container(
    child: TextField(
      style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular, color: qIBus_textChild),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        isDense: true,
        hintText: hintText,
        border: InputBorder.none,
      ),
    ),
  );
}

// ignore: must_be_immutable
class QIBusAppButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;

  QIBusAppButton({required this.textContent, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return QIBusAppButtonState();
  }
}

class QIBusAppButtonState extends State<QIBusAppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        padding: const EdgeInsets.all(0.0),
        textStyle: TextStyle(color: qIBus_white)
      ),
      onPressed: widget.onPressed,
      child: Container(
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: qIBus_colorPrimary),
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

// ignore: must_be_immutable
class TopBar extends StatefulWidget {
  var titleName;
  var icon;
  bool? isVisible = false;
  var isVisibleIcon = true;

  TopBar(var this.titleName, {var this.icon, var this.isVisible});

  @override
  State<StatefulWidget> createState() {
    return TopBarState();
  }
}

class TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(qIBus_colorPrimary);
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(color: qIBus_colorPrimary, height: 70),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width * 0.15,
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    widget.isVisible!
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.arrow_back, color: qIBus_white),
                                onPressed: () {
                                  finish(context);
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(spacing_standard, 0, 0, 0),
                                child: text(widget.titleName, textColor: qIBus_white, fontSize: textSizeNormal, fontFamily: fontBold),
                              ),
                            ],
                          )
                        : Padding(
                            padding: EdgeInsets.fromLTRB(spacing_standard_new, spacing_standard, 0, 0),
                            child: text(widget.titleName, textColor: qIBus_white, fontSize: textSizeNormal, fontFamily: fontBold),
                          ),
                    widget.isVisible!
                        ? GestureDetector(
                            onTap: () {
                              QIBusNotification().launch(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                right: spacing_standard_new,
                              ),
                              child: Image(
                                image: AssetImage(widget.icon),
                                height: 25,
                                width: 25,
                                color: qIBus_white,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              QIBusNotification().launch(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: spacing_standard,
                                right: spacing_standard_new,
                              ),
                              child: Image(
                                image: AssetImage(widget.icon),
                                height: 25,
                                width: 25,
                                color: qIBus_white,
                              ),
                            ),
                          )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: qIBus_app_background),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget title(var title, BuildContext context) {
  return Stack(
    children: <Widget>[
      Container(color: qIBus_colorPrimary, height: 70),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width * 0.15,
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: qIBus_white,
                      ),
                      onPressed: () {
                        finish(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(spacing_standard, 0, 0, 0),
                      child: text(title, textColor: qIBus_white, fontSize: textSizeNormal, fontFamily: fontBold),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
            decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: qIBus_app_background),
          ),
        ],
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
      margin: EdgeInsets.only(right: 10.0),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(color: Colors.black, fontFamily: fontMedium, fontSize: widget.fontSize),
        focusNode: _focusNodes[i],
        obscureText: widget.isTextObscure,
        decoration: InputDecoration(focusColor: qIBus_colorPrimary, counterText: "", border: widget.showFieldAsBox ? OutlineInputBorder(borderSide: BorderSide(width: 2.0)) : null),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textfields;
  }
}

Divider view() {
  return Divider(
    color: qIBus_view_color,
    height: 0.5,
  );
}

class LineDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..strokeWidth = 2;
    var max = 35;
    var dashWidth = 5;
    var dashSpace = 5;
    double startY = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
