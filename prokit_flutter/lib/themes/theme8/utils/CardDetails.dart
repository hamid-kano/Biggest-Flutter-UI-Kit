import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardDetails extends StatefulWidget {
  int index;
  String imageAddress;
  String? placeDetails;

  CardDetails(this.imageAddress, this.index);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CardDetailsState(imageAddress, index);
  }
}

class CardDetailsState extends State<CardDetails> {
  int index;
  String imageAddress;
  late String placeDetails;

  CardDetailsState(this.imageAddress, this.index);

  @override
  void initState() {
    super.initState();
    setState(() {
      getData(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(index);
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 800.0,
                  width: double.infinity,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  height: 500.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(imageAddress),
                        fit: BoxFit.fill,
                      )),
                ),
                Positioned(
                  top: 420.0,
                  left: 10.0,
                  right: 10.0,
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 380.0,
                      decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(20.0)
                          ),
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 10.0,
                        top: 20.0,
                      ),
                      child: Text(
                        placeDetails,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  getData(value) {
    switch (value) {
      case 0:
        placeDetails =
            'Mussoorie, located around an hour from Derahdun in Uttarakhand, is a popular weekend destination for north Indians, as well as honeymooners. One of the reasons for Mussoories popularity is that it has a lot of facilities developed especially for tourists. Take a cable car to Gun Hill, enjoy a beautiful nature walk along Camels Back Road, have a picnic at Kempty Falls, or ride a horse up to Lal Tibba (the highest peak in Mussoorie). Mussoorie also offers a superb view of the Himalayas.';
        break;

      case 1:
        placeDetails =
            "Manali, in Himachal Pradesh, is one of the top adventure travel destinations in India.Manali, with its soothing backdrop of the Himalayas, offers a blend of tranquility and adventure that makes it one of northern India's most popular destinations. Although it's a popular place to go off on treks, you can do as little or as much as you want there. Located in the Kullu Valley of Himachal Pradesh, it's bordered by cool pine forest and the raging Beas River, which give it a special energy.";
        break;

      case 2:
        placeDetails =
            "Sikkim's capital, Gangtok, sits along a cloudy mountain ridge about 5,500 feet above sea level. Sikkim only became part of India in 1975. Before that, it was a small independent Buddhist kingdom with its own monarchy after the end of British rule. Gangtok is a popular base for travel throughout the state, particularly with trekkers. It's a well-organized and clean city with strict littering, traffic and tobacco laws. Attractions include monasteries, viewpoints, a cable car, and a zoo that houses rare animals rescued from traders and poachers.";
        break;

      case 3:
        placeDetails =
            "Darjeeling is also famous for its lush tea gardens. In addition, it's blessed with a stunning view of Mount Kanchenjunga, the world's third highest peak. Some of Darjeeling's most popular attractions include historic toy train, monasteries, botanical gardens, a zoo, and the Darjeeling-Rangeet Valley Passenger Ropeway (the longest aerial tramway in Asia). Darjeeling is a great place to walk around and explore the tea estates, villages, and markets. ";
        break;

      case 4:
        placeDetails =
            "The hill station of Nainital, in the Kumaon region of Uttarakhand, was a popular summer retreat for the British during the time they ruled India. It features the serene, emerald-colored Naini Lake and an action-filled strip called The Mall, lined with restaurants, shops, hotels, and markets. Enjoy one of the many forest walks, explore the surrounding area on horseback, or relax on a boat in the lake.";
        break;
    }
  }
}
