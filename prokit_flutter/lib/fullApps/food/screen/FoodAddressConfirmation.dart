import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodColors.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodString.dart';

import '../utils/FoodImages.dart';
import 'FoodAddAddress.dart';

class FoodAddressConfirmation extends StatefulWidget {
  static String tag = '/FoodAddressConfirmation';

  @override
  FoodAddressConfirmationState createState() => FoodAddressConfirmationState();
}

class FoodAddressConfirmationState extends State<FoodAddressConfirmation> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //changeStatusColor(food_app_background);

    return Scaffold(
      backgroundColor: food_view_color,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            MapPage(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                height: width * 0.55,
                width: width,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)), color: food_white),
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(food_lbl_set_delivery_information.toUpperCase(), style: primaryTextStyle(size: 18)),
                    Text(food_lbl_location, style: secondaryTextStyle(size: 14)),
                    SizedBox(height: 4),
                    Text(food_lbl_address_dashboard, style: primaryTextStyle()),
                    Container(
                      height: 0.5,
                      color: food_view_color,
                      width: width,
                      margin: EdgeInsets.only(top: 4, bottom: 16),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              FoodAddAddress().launch(context);
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              decoration: BoxDecoration(color: food_textColorPrimary, borderRadius: BorderRadius.circular(50)),
                              child: Text(food_lbl_add_more_details, style: primaryTextStyle(color: white)).center(),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(top: 4, bottom: 4),
                            decoration: BoxDecoration(border: Border.all(color: food_colorPrimary), borderRadius: BorderRadius.circular(50), color: white),
                            child: Text(food_lbl_confirm_location, style: primaryTextStyle(color: black)).center(),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  late BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5), food_ic_map);
  }

  @override
  Widget build(BuildContext context) {
    LatLng pinPosition = LatLng(37.3797536, -122.1017334);

    CameraPosition initialLocation = CameraPosition(zoom: 16, bearing: 30, target: pinPosition);

    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: true,
      markers: _markers,
      initialCameraPosition: initialLocation,
      onMapCreated: (GoogleMapController controller) {
        controller.setMapStyle(Utils.mapStyles);
        _controller.complete(controller);
        setState(() {
          _markers.add(Marker(markerId: MarkerId('value'), position: pinPosition, icon: pinLocationIcon));
        });
      },
    );
  }
}

class Utils {
  static String mapStyles = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
}
