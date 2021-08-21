import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/ATMList.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Colors.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Style.dart';

class OPAtmLocationScreen extends StatefulWidget {
  @override
  _OPAtmLocationScreenState createState() => _OPAtmLocationScreenState();
}

class _OPAtmLocationScreenState extends State<OPAtmLocationScreen> {
  late GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController? _pageController;

  int? prevPage;

  @override
  void initState() {
    super.initState();
    atmList.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.shopName!),
          draggable: false,
          infoWindow: InfoWindow(
            title: element.shopName,
            snippet: element.address,
          ),
          position: element.locationCoords!));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController!.page!.toInt() != prevPage) {
      prevPage = _pageController!.page!.toInt();
      moveCamera();
    }
  }

  _coffeeShopList(index) {
    return AnimatedBuilder(
      animation: _pageController!,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController!.position.haveDimensions) {
          value = _pageController!.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.bounceIn.transform(value) * 125.0,
            width: Curves.bounceIn.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          moveCamera();
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                height: 125.0,
                width: 275.0,
                decoration: boxDecoration(),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: opOrangeColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                        child: Image.network(
                          atmList[index].thumbNail!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: <Widget>[
                              Text(
                                atmList[index].shopName!,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                atmList[index].time!,
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.white),
                              ),
                            ],
                          ),
                          FittedBox(
                            child: Text(
                              atmList[index].address!,
                              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5.0),
                      Expanded(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(target: LatLng(20.817595, 72.954918), zoom: 12.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: atmList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _coffeeShopList(index);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: atmList[_pageController!.page!.toInt()].locationCoords!, zoom: 14.0, bearing: 45.0, tilt: 45.0)));
  }
}
