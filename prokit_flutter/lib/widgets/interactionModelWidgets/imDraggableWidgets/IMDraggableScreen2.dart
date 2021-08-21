import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class IMDraggableScreen2 extends StatefulWidget {
  static String tag = '/IMDraggableScreen2';

  @override
  _IMDraggableScreen2State createState() => _IMDraggableScreen2State();
}

class _IMDraggableScreen2State extends State<IMDraggableScreen2> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  var mValue = false;
  var _mStatus = false;

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
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(context, 'Draggable with Target'),
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
                : Draggable(
                    data: 5,
                    childWhenDragging: Container(
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            'images/widgets/interactionModelWidgets/ic_photo.png',
                            height: 170,
                            width: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        'images/widgets/interactionModelWidgets/ic_item1.jpg',
                        height: 170,
                        width: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onDragStarted: () {
                      mValue = true;
                      print("onDragStarted" + mValue.toString());
                    },
                    onDraggableCanceled: (Velocity velocity, Offset offset) {
                      setState(() {
                        mValue = false;
                        print("onDraggableCanceled" + mValue.toString());
                      });
                    },
                    feedback: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Opacity(
                        opacity: 0.7,
                        child: Image.asset(
                          'images/widgets/interactionModelWidgets/ic_item1.jpg',
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
            DragTarget(
              builder: (context, List<int?> candidateData, rejectedData) {
                return AnimatedCrossFade(
                  duration: Duration(seconds: 0),
                  firstChild: Image.asset(
                    'images/widgets/interactionModelWidgets/ic_trash.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                    color: Colors.green,
                  ),
                  secondChild: Image.asset('images/widgets/interactionModelWidgets/ic_delete.png', height: 150, width: 200, fit: BoxFit.fill, color: Colors.green),
                  crossFadeState: mValue ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                );
              },
              onWillAccept: (data) {
                return true;
              },
              onAccept: (data) {
                if (data == 5) {
                  mValue = false;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Done")));
                  setState(() {
                    _mStatus = true;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
