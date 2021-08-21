import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class AMAnimatedSizeScreen extends StatefulWidget {
  static String tag = '/AMAnimatedSizeScreen';

  @override
  AMAnimatedSizeScreenState createState() => AMAnimatedSizeScreenState();
}

class AMAnimatedSizeScreenState extends State<AMAnimatedSizeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(seconds: 1));
    _updateSize();
    await Future.delayed(Duration(seconds: 2));
    init();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'Animated Size'),
        body: Center(
          child: GestureDetector(
            onTap: () => _updateSize(),
            child: Container(
              child: AnimatedSize(
                curve: Curves.easeIn,
                vsync: this,
                duration: Duration(seconds: 1),
                child: FlutterLogo(
                  size: _size,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
