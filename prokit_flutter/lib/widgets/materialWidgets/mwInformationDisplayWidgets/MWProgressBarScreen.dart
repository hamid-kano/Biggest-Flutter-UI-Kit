import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class MWProgressBarScreen extends StatefulWidget {
  static String tag = '/MWProgressBarScreen';

  @override
  MWProgressBarScreenState createState() => MWProgressBarScreenState();
}

class MWProgressBarScreenState extends State<MWProgressBarScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    print(animation.value);
    controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    void _onLoading() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: appStore.scaffoldBackground,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: EdgeInsets.all(0.0),
            insetPadding: EdgeInsets.symmetric(horizontal: 100),
            content: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text("Please wait....", style: primaryTextStyle(color: appStore.textPrimaryColor)),
                ],
              ),
            ),
          );
        },
      );
    }

    void _onHorizontalLoading1() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: appStore.scaffoldBackground,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: EdgeInsets.all(0.0),
            content: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  16.width,
                  CircularProgressIndicator(
                    backgroundColor: Color(0xffD6D6D6),
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                  ),
                  16.width,
                  Text(
                    "Please Wait....",
                    style: primaryTextStyle(color: appStore.textPrimaryColor),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Progress Bar'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Circular Progress", style: boldTextStyle(color: appStore.textPrimaryColor)).paddingOnly(left: 16, top: 16),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xffD6D6D6),
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 4,
                        margin: EdgeInsets.all(4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Container(
                          width: 45,
                          height: 45,
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        )),
                  ),
                ],
              ),
              16.height,
              Divider(thickness: 1),
              Text("Linear Progress", style: boldTextStyle(color: appStore.textPrimaryColor)).paddingOnly(left: 16, top: 16),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                child: LinearProgressIndicator(
                  value: animation.value,
                  backgroundColor: Color(0xffD6D6D6),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                ),
              ),
              16.height,
              Divider(thickness: 1),
              Text("Linear Progress with corner", style: boldTextStyle(color: appStore.textPrimaryColor)).paddingOnly(left: 16, top: 16),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                width: MediaQuery.of(context).size.width,
                height: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: animation.value,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                    backgroundColor: Color(0xffD6D6D6),
                  ),
                ),
              ),
              16.height,
              Divider(thickness: 1),
              GestureDetector(
                onTap: () {
                  _onLoading();
                },
                child: Container(
                  margin: EdgeInsets.all(16),
                  decoration: boxDecoration(bgColor: Colors.blueGrey, radius: 10),
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text("Circular Progress in Dialog 1", style: primaryTextStyle(color: Colors.white)),
                ),
              ),
              Divider(thickness: 1),
              GestureDetector(
                onTap: () {
                  _onHorizontalLoading1();
                },
                child: Container(
                  margin: EdgeInsets.all(16),
                  decoration: boxDecoration(bgColor: Colors.blueGrey, radius: 10),
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text("Circular Progress in Dialog 2", style: primaryTextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
