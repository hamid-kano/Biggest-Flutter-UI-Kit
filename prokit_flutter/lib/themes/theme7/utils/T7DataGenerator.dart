import 'dart:core';

import 'package:prokit_flutter/themes/theme7/models/T7Models.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Images.dart';

List<T7CategoryDataModel> generateCategories() {
  List<T7CategoryDataModel> categories = [];

  T7CategoryDataModel model = T7CategoryDataModel();
  model.name = "Hotels";
  model.image = t7_ic_bed;

  T7CategoryDataModel model1 = T7CategoryDataModel();
  model1.name = "Flights";
  model1.image = t7_ic_flight;

  T7CategoryDataModel model2 = T7CategoryDataModel();
  model2.name = "Foods";
  model2.image = t7_ic_food;

  T7CategoryDataModel model3 = T7CategoryDataModel();
  model3.name = "Events";
  model3.image = t7_ic_event;

  categories.add(model);
  categories.add(model1);
  categories.add(model2);
  categories.add(model3);

  return categories;
}

List<T7BestDestinationDataModel> generateBestDestination() {
  List<T7BestDestinationDataModel> bestDestinationData = [];

  T7BestDestinationDataModel model = T7BestDestinationDataModel();
  model.name = "Malawi";
  model.rating = "4";
  model.image = t7_item1;

  T7BestDestinationDataModel model2 = T7BestDestinationDataModel();
  model2.name = "Japan";
  model2.rating = "2";
  model2.image = t7_item2;

  T7BestDestinationDataModel model3 = T7BestDestinationDataModel();
  model3.name = "London";
  model3.rating = "1";
  model3.image = t7_item3;

  T7BestDestinationDataModel model4 = T7BestDestinationDataModel();
  model4.name = "San Fransisco";
  model4.rating = "5";
  model4.image = t7_item4;
  bestDestinationData.add(model);
  bestDestinationData.add(model2);
  bestDestinationData.add(model3);
  bestDestinationData.add(model4);
  bestDestinationData.add(model);
  bestDestinationData.add(model2);
  bestDestinationData.add(model3);
  bestDestinationData.add(model4);
  return bestDestinationData;
}

//fun generateRecentSearch(): ArrayList<RecentSearchData> {
//val categories = ArrayList<RecentSearchData>()
//categories.apply {
//addRecentSearch { name = "Holy See" }
//addRecentSearch { name = "Sierra Leone" }
//addRecentSearch { name = "Parisianchester" }
//addRecentSearch { name = "Holy See" }
//}
//return categories
//}
//
List<T7RecentSearchDataModel> generateRecentSearch() {
  List<T7RecentSearchDataModel> categories = [];

  T7RecentSearchDataModel model = T7RecentSearchDataModel();
  model.name = "Holy See";

  T7RecentSearchDataModel model2 = T7RecentSearchDataModel();
  model2.name = "Sierra Leone";

  T7RecentSearchDataModel model3 = T7RecentSearchDataModel();
  model3.name = "Parisianchester";

  T7RecentSearchDataModel model4 = T7RecentSearchDataModel();
  model4.name = "Holy See";

  categories.add(model);
  categories.add(model2);
  categories.add(model3);
  categories.add(model4);
  return categories;
}

List<T7RecentSearchDataModel> generatePopularDestination() {
  List<T7RecentSearchDataModel> categories = [];

  T7RecentSearchDataModel model = T7RecentSearchDataModel();
  model.name = "Costa Rica";

  T7RecentSearchDataModel model2 = T7RecentSearchDataModel();
  model2.name = "United States";

  T7RecentSearchDataModel model3 = T7RecentSearchDataModel();
  model3.name = "United Kingdom";

  T7RecentSearchDataModel model4 = T7RecentSearchDataModel();
  model4.name = "Paris";

  categories.add(model);
  categories.add(model2);
  categories.add(model3);
  categories.add(model4);
  return categories;
}

List<T7BestHotelDataModel> generateBestHotels() {
  List<T7BestHotelDataModel> bestDestinationData = [];

  T7BestHotelDataModel model = T7BestHotelDataModel();
  model.name = "Chillax Heritage";
  model.rating = "4";
  model.image = t7_ic_hotel1;

  T7BestHotelDataModel model2 = T7BestHotelDataModel();
  model2.name = "Hotel Bangkok Saran";
  model2.rating = "2";
  model2.image = t7_ic_hotel2;

  T7BestHotelDataModel model3 = T7BestHotelDataModel();
  model3.name = "One 10";
  model3.rating = "1";
  model3.image = t7_ic_hotel3;

  T7BestHotelDataModel model4 = T7BestHotelDataModel();
  model4.name = "One 10";
  model4.rating = "5";
  model4.image = t7_ic_hotel4;

  bestDestinationData.add(model);
  bestDestinationData.add(model2);
  bestDestinationData.add(model3);
  bestDestinationData.add(model4);
  return bestDestinationData;
}

//
//fun generateBestHotels(): ArrayList<BestHotelData> {
//val bestHotels = ArrayList<BestHotelData>()
//bestHotels.apply {
//addBestHotel { name = "Chillax Heritage"; price = "399"; rating = 4; image = R.drawable.theme6_ic_hotel1 }
//addBestHotel { name = "Hotel Bangkok Saran";price = "200"; rating = 5; image = R.drawable.theme6_ic_hotel2 }
//addBestHotel { name = "One 10";price = "150"; rating = 2; image = R.drawable.theme6_ic_hotel3 }
//addBestHotel { name = "One 10";price = "150"; rating = 2; image = R.drawable.theme6_ic_hotel4 }
//}
//return bestHotels
//}
//
//fun generatePopularHotels(): ArrayList<BestHotelData> {
//val bestHotels = ArrayList<BestHotelData>()
//bestHotels.apply {
//addBestHotel { name = "One 10";price = "150"; rating = 2; image = R.drawable.theme6_ic_hotel3 }
//addBestHotel { name = "Chillax Heritage"; price = "399"; rating = 4; image = R.drawable.theme6_ic_hotel1 }
//addBestHotel { name = "Hotel Bangkok Saran";price = "200"; rating = 5; image = R.drawable.theme6_ic_hotel2 }
//addBestHotel { name = "One 10";price = "150"; rating = 2; image = R.drawable.theme6_ic_hotel4 }
//}
//return bestHotels
//}
//
List<T7HotelDataModel> generateHotels() {
  List<T7HotelDataModel> bestDestinationData = [];

  T7HotelDataModel model = T7HotelDataModel();
  model.name = "Chillax Heritage";
  model.image = t7_ic_hotel1;
  model.rating = "5";
  model.address = "Lavender Road | 1 KM from center";
  model.hotel_review = "3450 reviews";
  model.price = "\$1500";
  model.room_detail = "1 room - 1 night (incl. taxes)";

  T7HotelDataModel model1 = T7HotelDataModel();
  model1.name = "Hotel Bangkok Saran";
  model1.image = t7_ic_hotel2;
  model1.rating = "4";
  model1.address = "Santosa Road | 4.5 KM from center";
  model1.hotel_review = "50 reviews";
  model1.price = "\$1000";
  model1.room_detail = "1 room - 1 night (incl. taxes)";

  T7HotelDataModel model2 = T7HotelDataModel();
  model2.name = "One 10";
  model2.image = t7_ic_hotel3;
  model2.rating = "4";
  model2.address = "Orchard Road | 5.5 KM from center";
  model2.hotel_review = "3250 reviews";
  model2.price = "\$1200";
  model2.room_detail = "1 room - 1 night (incl. taxes)";

  T7HotelDataModel model3 = T7HotelDataModel();
  model3.name = "Marina Lavender";
  model3.image = t7_ic_hotel4;
  model3.rating = "4";
  model3.address = "Lavender Road | 1 KM from center";
  model3.hotel_review = "1450 reviews";
  model3.price = "\$300";
  model3.room_detail = "1 room - 1 night (incl. taxes)";

  bestDestinationData.add(model);
  bestDestinationData.add(model1);
  bestDestinationData.add(model2);
  bestDestinationData.add(model3);
  return bestDestinationData;
}
