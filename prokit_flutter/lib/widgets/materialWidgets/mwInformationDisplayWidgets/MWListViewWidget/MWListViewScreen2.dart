import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWListViewScreen2 extends StatefulWidget {
  static const tag = '/MWListViewScreen2';

  @override
  _MWListViewScreen2State createState() => _MWListViewScreen2State();
}

class _MWListViewScreen2State extends State<MWListViewScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'List Wheel ScrollView'),
        body: ListWheelScrollView.useDelegate(
          physics: FixedExtentScrollPhysics(),
          itemExtent: 75,
          childDelegate: ListWheelChildBuilderDelegate(builder: (BuildContext context, int index) {
            if (index < 0 || index > 30) {
              return null;
            }
            return ListTile(
              leading: Icon(
                dataList[index].images,
                size: 30,
                color: appStore.iconColor,
              ),
              title: Text(
                dataList[index].name,
                style: boldTextStyle(color: appStore.textPrimaryColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DataModel {
  var images;
  var name;

  DataModel({
    this.images,
    this.name,
  });
}

List<DataModel> dataList = [
  DataModel(
    images: Icons.person,
    name: 'Account',
  ),
  DataModel(
    images: Icons.share,
    name: 'Share',
  ),
  DataModel(
    images: Icons.favorite_border,
    name: 'Favourite',
  ),
  DataModel(
    images: Icons.settings,
    name: 'Settings',
  ),
  DataModel(
    images: Icons.notifications,
    name: 'Notifications',
  ),
  DataModel(
    images: Icons.schedule,
    name: 'Schedule',
  ),
  DataModel(
    images: Icons.shopping_cart,
    name: 'Shopping Cart',
  ),
  DataModel(
    images: Icons.local_convenience_store,
    name: 'Heart Shaker',
  ),
  DataModel(
    images: Icons.local_drink,
    name: 'Drink',
  ),
  DataModel(
    images: Icons.local_airport,
    name: 'Airport',
  ),
  DataModel(
    images: Icons.local_atm,
    name: 'ATM',
  ),
  DataModel(
    images: Icons.local_activity,
    name: 'Activity',
  ),
  DataModel(
    images: Icons.local_bar,
    name: 'Bar',
  ),
  DataModel(
    images: Icons.local_cafe,
    name: 'Cafe',
  ),
  DataModel(
    images: Icons.local_car_wash,
    name: 'Car Wash',
  ),
  DataModel(
    images: Icons.local_convenience_store,
    name: 'Store',
  ),
  DataModel(
    images: Icons.local_hotel,
    name: 'Hotel',
  ),
  DataModel(
    images: Icons.local_shipping,
    name: 'Shipping',
  ),
  DataModel(
    images: Icons.local_parking,
    name: 'Parking',
  ),
  DataModel(
    images: Icons.local_movies,
    name: 'Movies',
  ),
  DataModel(
    images: Icons.local_library,
    name: 'Library',
  ),
  DataModel(
    images: Icons.person,
    name: 'Account',
  ),
  DataModel(
    images: Icons.share,
    name: 'Share',
  ),
  DataModel(
    images: Icons.favorite_border,
    name: 'Favourite',
  ),
  DataModel(
    images: Icons.settings,
    name: 'Settings',
  ),
  DataModel(
    images: Icons.notifications,
    name: 'Notifications',
  ),
  DataModel(
    images: Icons.schedule,
    name: 'Schedule',
  ),
  DataModel(
    images: Icons.shopping_cart,
    name: 'Shopping Cart',
  ),
  DataModel(
    images: Icons.local_convenience_store,
    name: 'Heart Shaker',
  ),
  DataModel(
    images: Icons.local_drink,
    name: 'Drink',
  ),
  DataModel(
    images: Icons.local_airport,
    name: 'Airport',
  ),
  DataModel(
    images: Icons.local_atm,
    name: 'ATM',
  ),
  DataModel(
    images: Icons.local_activity,
    name: 'Activity',
  ),
  DataModel(
    images: Icons.local_bar,
    name: 'Bar',
  ),
  DataModel(
    images: Icons.local_cafe,
    name: 'Cafe',
  ),
  DataModel(
    images: Icons.local_car_wash,
    name: 'Car Wash',
  ),
  DataModel(
    images: Icons.local_convenience_store,
    name: 'Store',
  ),
  DataModel(
    images: Icons.local_hotel,
    name: 'Hotel',
  ),
  DataModel(
    images: Icons.local_shipping,
    name: 'Shipping',
  ),
  DataModel(
    images: Icons.local_parking,
    name: 'Parking',
  ),
  DataModel(
    images: Icons.local_movies,
    name: 'Movies',
  ),
  DataModel(
    images: Icons.local_library,
    name: 'Library',
  ),
  DataModel(
    images: Icons.local_printshop,
    name: 'PrintShop',
  ),
  DataModel(
    images: Icons.person,
    name: 'Account',
  ),
  DataModel(
    images: Icons.share,
    name: 'Share',
  ),
  DataModel(
    images: Icons.favorite_border,
    name: 'Favourite',
  ),
  DataModel(
    images: Icons.local_gas_station,
    name: 'Gas Station',
  ),
  DataModel(
    images: Icons.local_post_office,
    name: 'Post Office',
  ),
  DataModel(
    images: Icons.local_mall,
    name: 'Mall',
  ),
  DataModel(
    images: Icons.local_bar,
    name: 'Bar',
  ),
  DataModel(
    images: Icons.local_cafe,
    name: 'Cafe',
  ),
  DataModel(
    images: Icons.local_car_wash,
    name: 'Car Wash',
  ),
  DataModel(
    images: Icons.schedule,
    name: 'Schedule',
  ),
  DataModel(
    images: Icons.shopping_cart,
    name: 'Shopping Cart',
  ),
];
