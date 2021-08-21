import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class IMLongPressDraggableScreen2 extends StatefulWidget {
  static String tag = '/IMLongPressDraggableScreen2';

  @override
  _IMLongPressDraggableScreen2State createState() => _IMLongPressDraggableScreen2State();
}

class _IMLongPressDraggableScreen2State extends State<IMLongPressDraggableScreen2> with TickerProviderStateMixin {
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

  var mValue = true;
  var mValue1 = true;
  var _mStatus = false;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'Long Press Draggable with Target'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _mStatus
                  ? Container(
                      child: Text(
                        "Empty",
                        style: primaryTextStyle(size: 20),
                      ),
                    )
                  : LongPressDraggable(
                      data: 1,
                      child: FlutterLogo(
                        size: 200,
                      ),
                      feedback: FlutterLogo(
                        size: 200,
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  16.width,
                  Expanded(
                    flex: 1,
                    child: DragTarget(
                      builder: (context, List<int?> candidateData, rejectedData) {
                        print(candidateData);
                        return Container(
                          height: 200,
                          color: mValue ? appColorPrimary : Colors.green,
                          child: Center(
                            child: Text(
                              mValue ? "Flutter" : "Correct",
                              style: primaryTextStyle(color: Colors.white, size: 20),
                            ),
                          ),
                        );
                      },
                      onWillAccept: (dynamic data) {
                        return true;
                      },
                      onAccept: (dynamic data) {
                        if (data == 1) {
                          ScaffoldMessengerState().showSnackBar(SnackBar(content: Text("Correct!")));
                          mValue = false;
                          setState(() {
                            _mStatus = true;
                          });
                        }
                      },
                    ),
                  ),
                  25.width,
                  Expanded(
                    flex: 1,
                    child: DragTarget(
                      builder: (context, List<int?> candidateData, rejectedData) {
                        return Container(
                          height: 200,
                          color: mValue1 ? appColorPrimary : Colors.red,
                          child: Center(
                              child: Text(
                            mValue1 ? "IOS" : "Incorrect",
                            style: primaryTextStyle(color: Colors.white, size: 20),
                          )),
                        );
                      },
                      onWillAccept: (dynamic data) {
                        return true;
                      },
                      onAccept: (dynamic data) {
                        if (data == 1) {
                          mValue1 = false;
                        }
                      },
                    ),
                  ),
                  16.width,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
