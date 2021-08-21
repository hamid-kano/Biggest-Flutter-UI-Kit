import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodColors.dart';

class DefaultLayout extends StatefulWidget {
  final String? title, description, imageLink;
  final Color? color;

  const DefaultLayout({this.title, this.description, this.imageLink, this.color});

  @override
  _DefaultLayoutState createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Since we used SafeArea we need to provide it full width of the app so that it stretches full screen.
            Container(
              width: double.infinity,
            ),

            //Image
            Stack(
              children: <Widget>[
                Arc(
                  arcType: ArcType.CONVEX,
                  edge: Edge.BOTTOM,
                  height: (MediaQuery.of(context).size.width) / 20,
                  child: new Container(height: (MediaQuery.of(context).size.height) / 1.7, width: MediaQuery.of(context).size.width, color: food_colorPrimary_light),
                ),
                SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height) / 1.7,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(widget.imageLink!, width: 300, height: (MediaQuery.of(context).size.height) / 2.8),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.title!,
                style: boldTextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 40.0,
              ),
            ),
            //Description
            Container(
              width: 300.0,
              child: Text(
                '''${widget.description}''',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
