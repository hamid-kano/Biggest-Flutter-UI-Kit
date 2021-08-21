import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWFloatingActionButtonScreen extends StatefulWidget {
  static String tag = '/MWFloatingActionButtonScreen';

  @override
  MWFloatingActionButtonScreenState createState() => MWFloatingActionButtonScreenState();
}

class MWFloatingActionButtonScreenState extends State<MWFloatingActionButtonScreen> {
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
        appBar: appBar(context, "Floating Button"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Text(
                "Default FAB Button",
                style: boldTextStyle(),
              ),
              FloatingActionButton(
                heroTag: '1',
                elevation: 5,
                onPressed: () {
                  toast('Default FAB Button');
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              Divider(),
              Text(
                "Label FAB Button",
                style: boldTextStyle(),
              ),
              FloatingActionButton(
                heroTag: '2',
                backgroundColor: getColorFromHex('#8998FF'),
                child: Text(
                  'Add',
                  style: primaryTextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  toast('Label FAB Button');
                },
              ),
              Divider(),
              Text(
                "Circle Border FAB",
                style: boldTextStyle(),
              ),
              FloatingActionButton(
                  heroTag: '3',
                  shape: CircleBorder(side: BorderSide(color: Colors.black)),
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.warning,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    toast('Circle Border FAB button');
                  }),
              Divider(),
              Text(
                "Rounded Rectangle Border FAB",
                style: boldTextStyle(),
              ),
              10.height,
              Center(
                child: FloatingActionButton(
                    heroTag: '4',
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.amber,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      toast('Rounded Rectangle Border FAB');
                    }),
              ),
              Divider(),
              Text(
                "Icon with Label Fab",
                style: boldTextStyle(),
              ),
              10.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                      heroTag: '5',
                      label: Text(
                        "Add",
                        style: primaryTextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        toast('Icon with Label Fab');
                      }),
                  10.width,
                  FloatingActionButton.extended(
                      heroTag: '6',
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      label: Text(
                        "Take pic",
                        style: primaryTextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.deepOrangeAccent,
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        toast('Icon with Label Fab');
                      }),
                  Divider(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
