import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/clusteringGoogleMaps/clustering_helper.dart';
import 'package:prokit_flutter/main/utils/clusteringGoogleMaps/lat_lang_geohash.dart';

class GoogleMapScreen extends StatefulWidget {
  static String tag = '/GoogleMapScreen';

  @override
  GoogleMapScreenState createState() => GoogleMapScreenState();
}

class GoogleMapScreenState extends State<GoogleMapScreen> with AfterLayoutMixin<GoogleMapScreen> {
  //TODO Without NullSafety Geo coder
  //Completer<GoogleMapController> _controller = Completer();

  ClusteringHelper? clusteringHelper;
  List<LatLngAndGeohash>? list;

  List<Marker> markers = [];
  var mMapType = MapType.normal;

//TODO Without NullSafety Geo coder
  /*initMemoryClustering(context) async {
    list = await getListOfLatLngAndGeoHash(context);
    clusteringHelper = ClusteringHelper.forMemory(
      list: list,
      updateMarkers: updateMarkers,
      aggregationSetup: AggregationSetup(markerSize: 150), // You can customize marker size, colors and size limits
    );
    setState(() {});
  }*/

  updateMarkers(Set<Marker> markers) {
    this.markers = markers.toList();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    //  TODO Without NullSafety Geo coder
    //initMemoryClustering(context);
  }

  // TODO Without NullSafety Geo coder
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);

    // TODO Without NullSafety Geo coder
    /*CameraPosition initialPosition = CameraPosition(
      target: LatLng(43.7262115, 12.636526499999945),
      zoom: 5,
    );*/
      // TODO Without NullSafety Geo coder
    //CameraPosition newPosition = CameraPosition(bearing: 192.8334901395799, target: LatLng(37.43296265331129, -122.08832357078792), tilt: 59.440717697143555, zoom: 19.151926040649414);
    // TODO Without NullSafety Geo coder
    return Scaffold(
        /*appBar: appBar(context, 'Google Maps with Clustering', actions: buildActionButtons()),
      body: clusteringHelper != null
          ? GoogleMap(
              compassEnabled: true,
              indoorViewEnabled: true,
              trafficEnabled: true,
              mapType: mMapType,
              markers: markers.toSet(),
              onCameraMove: (newPosition) => clusteringHelper.onCameraMove(newPosition, forceUpdate: false),
              onCameraIdle: clusteringHelper != null ? clusteringHelper.onMapIdle : null,
              initialCameraPosition: initialPosition,
              //onTap: _handleTap,
              onMapCreated: (GoogleMapController controller) {
                clusteringHelper.mapController = controller;
                _controller.complete(controller);
                clusteringHelper.updateMap();

                setState(() {});
              },
            )
          : SizedBox(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.location_on,
          color: white,
        ),
        onPressed: () async {
          final GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(newPosition));
        },
      ),*/
        );
  }

  buildActionButtons() {
    return [
      CustomTheme(
        child: PopupMenuButton(
          color: appStore.scaffoldBackground,
          itemBuilder: (_) => [
            PopupMenuItem(
              child: InkWell(
                child: Text(
                  'Hybrid',
                  style: primaryTextStyle(),
                ),
                onTap: () {
                  setState(() {
                    mMapType = MapType.hybrid;
                  });
                },
              ),
            ),
            PopupMenuItem(
              child: InkWell(
                child: Text(
                  'Normal',
                  style: primaryTextStyle(),
                ),
                onTap: () {
                  setState(() {
                    mMapType = MapType.normal;
                  });
                },
              ),
            ),
            PopupMenuItem(
              child: InkWell(
                child: Text(
                  'Satellite',
                  style: primaryTextStyle(),
                ),
                onTap: () {
                  setState(() {
                    mMapType = MapType.satellite;
                  });
                },
              ),
            ),
            PopupMenuItem(
              child: InkWell(
                child: Text(
                  'Terrain',
                  style: primaryTextStyle(),
                ),
                onTap: () {
                  setState(() {
                    mMapType = MapType.terrain;
                  });
                },
              ),
            ),
          ],
        ),
      )
    ];
  }
//TODO Without NullSafety Geo coder
/* getLocation(LatLng point) async {
    var coordinates = Coordinates(point.latitude, point.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first.addressLine;
  }
*/
//TODO Without NullSafety Geo coder
/*  void _handleTap(LatLng point) async {
    toast('Fetching Location');
    var location = await getLocation(point);
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        draggable: true,
        infoWindow: InfoWindow(
          title: location,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ));
    });
  }*/
}
