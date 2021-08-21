import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/integrations/utils/panel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

class SlidingPanelScreen extends StatefulWidget {
  static String tag = '/SlidingPanelScreen';

  @override
  SlidingPanelScreenState createState() => SlidingPanelScreenState();
}

class SlidingPanelScreenState extends State<SlidingPanelScreen> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);

    return Scaffold(
      appBar: appBar(context, "Google Maps Sliping Panel"),
      body: SlidingUpPanel(
        minHeight: 180,
        panelBuilder: (sc) => Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.all(8.0),
          child: ListView(
            controller: sc,
            children: <Widget>[
              SizedBox(height: 10),
              Center(
                  child: Text(
                'Explore Italy',
                style: primaryTextStyle(size: 22),
              )),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                        child: Icon(Icons.favorite, color: whiteColor),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Popular',
                        style: primaryTextStyle(),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                        child: Icon(Icons.local_dining, color: whiteColor),
                      ),
                      SizedBox(height: 10),
                      Text('Food', style: primaryTextStyle())
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                        child: Icon(Icons.event_note, color: whiteColor),
                      ),
                      SizedBox(height: 10),
                      Text('Events', style: primaryTextStyle())
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                        child: Icon(Icons.more_horiz, color: whiteColor),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'More',
                        style: primaryTextStyle(),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('About', style: primaryTextStyle(size: 22)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy"
                  " text ever since the 1500s, when an unknown printer took"
                  " a galley of type and scrambled it to make a type specimen book. It has survived "
                  "not only five centuries, but also the leap into electronic typesetting, remaining essentially "
                  "unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum "
                  "passages, and more recently with desktop publishing software like Aldus PageMaker including version"
                  "s of Lorem Ipsum.",
                  style: primaryTextStyle(),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: primaryTextStyle(),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(43.7262115, 12.636526499999945), zoom: 5),
          ),
        ),
      ),
    );
  }
}
